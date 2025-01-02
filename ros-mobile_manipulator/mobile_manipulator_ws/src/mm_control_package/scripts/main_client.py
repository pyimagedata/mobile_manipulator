#!/usr/bin/env python3

from __future__ import print_function
from mm_control_package.srv import Navigation
import time
import rospy
import numpy as np
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

import sys
from mm_control_package.srv import Camera, CameraRequest
from mm_control_package.srv import PointCloud, PointCloudRequest
from mm_control_package.srv import Go, GoRequest

def nav_client(position, quaternion):
    rospy.wait_for_service('navigation_server')
    try:

        nav_req = rospy.ServiceProxy('navigation_server', Navigation)
        resp1 = nav_req(position = position, quaternion = quaternion)
        return resp1.is_reached
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

def camera_client():
    rospy.wait_for_service('camera_server')
    try:

        camera_req = rospy.ServiceProxy('camera_server', Camera)
        resp1 = camera_req(camera_info = "True")
        return resp1.location
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

def pointcloud_client(location):
    rospy.wait_for_service('pointcloud_server')
    try:

        point_req = rospy.ServiceProxy('pointcloud_server', PointCloud)
        resp1 = point_req(location = location)
        return resp1
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

def go_client(position_, quaternion_):
    rospy.wait_for_service('go_server')
    try:

        point_req = rospy.ServiceProxy('go_server', Go)
        resp1 = point_req(position = position_, quaternion = quaternion_)
        return resp1
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

if __name__ == "__main__":

    # start position

    zero_pos = [2.9291147436174834, 0.7021219813627688, -2.0633686036219956e-05]
    zero_ori = [3.1797962923985033e-06, -7.254624870172376e-05, -0.01218975412248253, 0.9999256995504038]

    first_pos = [5.9, 0.7542299230032364, -2.0154829301427535e-05]
    first_ori = [2.4694360516908024e-06, -7.863011465312677e-05, -0.0032378142451824103, 0.9999947551713063]

    second_pos = [4.953440013881065, 3.225721724583892, -1.967001840610591e-05]
    second_ori = [5.259750720996159e-05, 4.70450960574327e-06, 0.9991114414813725, -0.042146467377275655]

    third_pos = [0.4840515926791364, 3.2371859390315456, -2.1332089901331813e-05]
    third_ori = [6.0130725715632386e-05, 1.7295357806583356e-05, 0.9976615810767646, -0.06834739006411868]

    m_orientations = np.array([zero_ori, first_ori, second_ori, third_ori])
    m_positions = np.array([zero_pos, first_pos, second_pos, third_pos])

    home_orientation =  [0, 0, 0, 0]
    home_position =  [-0.1000000061390212, -0.0007233915825811785, 1.0310924921166602]

    detect_orientation =  [-0.9247926650989297, 6.478721621621528e-05, 4.374730350607046e-06, 0.3804718187643688]
    detect_position =  [-0.09999201088509106, 0.21346792584364316, 0.803730011462971]


    for orientation, position in zip(m_orientations, m_positions):

        print("----------------------------------------")

        res = nav_client(position=position, quaternion=orientation)
        if res:
            print("mobile is reached to target...")

            time.sleep(1)

            res_go_detect = go_client(detect_position, detect_orientation)

            print("go detection...")

            res_camera = camera_client()
        
            location_array = np.array(res_camera)

            if len(location_array) > 0:

                location_array = location_array.reshape(int(len(res_camera)/2), 2)

                print(location_array)

                count = 0
                length = len(res_camera)/2

                for loc in location_array:

                    # find position and orientation

                    res_pointcloud = pointcloud_client(location=loc)

                    print("position : ", res_pointcloud.position)
                    print("quaternion : ", res_pointcloud.quaternion)

                    # go to target position

                    res_go_target = go_client(res_pointcloud.position, res_pointcloud.quaternion)

                    # go home position

                    count += 1

                    if count < length:

                        res_go_home = go_client(home_position,home_orientation)
                res_go_home = go_client(home_position,home_orientation)
            else:

                res_go_home = go_client(home_position,home_orientation)

                print("go home...")
            res_go_home = go_client(home_position,home_orientation)
        else:

                res_go_home = go_client(home_position,home_orientation)

                print("go home...")

        time.sleep(1)

    
    print("Mission is Complated...")