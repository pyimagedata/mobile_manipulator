#!/usr/bin/env python3

from __future__ import print_function
from turtle import width
from cv2 import matMulDeriv
import numpy as np
import time

import sys
import rospy
from mm_control_package.srv import Camera, CameraRequest
from mm_control_package.srv import PointCloud, PointCloudRequest
from mm_control_package.srv import Go, GoRequest

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

    right_orientation =  [-0.46944575690383517, 0.7064651822207693, 0.31825046743321844, 0.42337246442435195]
    right_position =  [0.43426451556698387, -0.14757858761874557, 0.4571487037652073]

    front_orientation =  [1.56426003640435e-05, 0.9553651680842354, -1.0462516748270456e-05, 0.2954275095556361]
    front_position =  [0.24372411652148926, 5.664802541806537e-06, 0.6393921605307586]

    left_orientation =  [0.3944930097221512, 0.8445922313814119, -0.22450397835322763, 0.28396688481951504]
    left_position =  [0.3170751825485979, 0.21980730143239438, 0.3581852122849134]

    orientations = [right_orientation, front_orientation, left_orientation]
    positions = [right_position, front_position, left_position]

    for orientation, position in zip(orientations, positions):

        print("----------------------------------------")

        start = time.time()

        res = go_client(position, orientation)

        print("res : ", res)

        # disease detection with 2d camera

        res = camera_client()
        
        print("location : ", res)

        location_array = np.array(res)

        location_array = location_array.reshape(int(len(res)/2), 2)

        print(location_array)

        if len(res) > 0:

            count = 0
            length = len(res)/2

            for loc in location_array:

                # find position and orientation

                res = pointcloud_client(location=loc)

                print("position : ", res.position)
                print("quaternion : ", res.quaternion)

                # go to target position

                res = go_client(res.position, res.quaternion)

                print("res : ", res)

                # go home position

                count += 1

                if count < length:

                    res = go_client(position, orientation)

                    print("res : ", res)

                    end = time.time()

                    print("duration : ", end - start)
        
        else:
            print("No found any disease!!!")
