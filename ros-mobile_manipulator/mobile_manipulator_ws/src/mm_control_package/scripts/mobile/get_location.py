#!/usr/bin/env python3

import rospy
from nav_msgs.msg import Odometry

def callback(msg):
    print("************************************")
    
    print([msg.pose.pose.position.x, msg.pose.pose.position.y, msg.pose.pose.position.z])
    print([msg.pose.pose.orientation.x, msg.pose.pose.orientation.y, msg.pose.pose.orientation.z, msg.pose.pose.orientation.w])

    print("************************************")
    
    
rospy.init_node('check_odometry')
odom_sub = rospy.Subscriber('/odom', Odometry, callback)
rospy.spin()