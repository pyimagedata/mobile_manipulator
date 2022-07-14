#!/usr/bin/env python3

from __future__ import print_function
import re
from turtle import position
from mm_control_package.srv import Navigation, NavigationRequest, NavigationResponse
import time
import rospy
import numpy as np
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal

def handle_nav_server(req):

    position = req.position
    quaternion = req.quaternion
    
    client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
    client.wait_for_server()

    goal = MoveBaseGoal()
    
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()
    goal.target_pose.pose.position.x = position[0]
    goal.target_pose.pose.position.y = position[1]
    goal.target_pose.pose.position.z = position[2]

    goal.target_pose.pose.orientation.x = quaternion[0]
    goal.target_pose.pose.orientation.y = quaternion[1]
    goal.target_pose.pose.orientation.z = quaternion[2]
    goal.target_pose.pose.orientation.w = quaternion[3]

    client.send_goal(goal)
    wait = client.wait_for_result()
    if not wait:
        return NavigationResponse(is_reached = False)
        rospy.logerr("Action server not available!")
        rospy.signal_shutdown("Action server not available!")
    else:
        #return client.get_result()
        return NavigationResponse(is_reached = True)

    

def nav_server():
    rospy.init_node('navigation_server')
    s = rospy.Service('navigation_server', Navigation, handle_nav_server)
    print("Ready navigation server")
    rospy.spin()

if __name__ == "__main__":
    nav_server()