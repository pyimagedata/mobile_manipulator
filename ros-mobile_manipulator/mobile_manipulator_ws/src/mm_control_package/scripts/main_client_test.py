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

    home_orientation =  [0, 0, 0, 1]
    home_position =  [-0.1000000061390212, -0.0007233915825811785, 1.0310924921166602]

    detect_orientation =  [-0.9247926650989297, 6.478721621621528e-05, 4.374730350607046e-06, 0.3804718187643688]
    detect_position =  [-0.09999201088509106, 0.21346792584364316, 0.803730011462971]

    res_go_detect = go_client(detect_position, detect_orientation)

    print("go detection...")

    res_camera = camera_client()

    location_array = np.array(res_camera)

    if len(location_array) > 0:

        location_array = location_array.reshape(int(len(res_camera)/2), 2)

        print("location_array : ", location_array)

        count = 0
        length = len(res_camera)/2

        for loc in location_array:

            # find position and orientation

            res_pointcloud = pointcloud_client(location=loc)

            print("position : ", res_pointcloud.position)
            print("quaternion : ", res_pointcloud.quaternion)

            # go to target position

            print("heree1")

            res_go_target = go_client(res_pointcloud.position, res_pointcloud.quaternion)

            print("heree2")

            # go home position

            count += 1

            if count < length:

                res_go_home = go_client(home_position,home_orientation)
        
        res_go_home = go_client(home_position,home_orientation)
        
    else:

        res_go_home = go_client(home_position,home_orientation)

        print("go home...")