#!/usr/bin/env python3
# from __future__ import print_function
from six.moves import input

import sys
import copy
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg

try:
    from math import pi, tau, dist, fabs, cos
except:  # For Python 2 compatibility
    from math import pi, fabs, cos, sqrt

    tau = 2.0 * pi

    def dist(p, q):
        return sqrt(sum((p_i - q_i) ** 2.0 for p_i, q_i in zip(p, q)))


from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list


moveit_commander.roscpp_initialize(sys.argv)
rospy.init_node("move_group_python_interface_tutorial", anonymous=True)

robot = moveit_commander.RobotCommander()

scene = moveit_commander.PlanningSceneInterface()

group_name = "arm"
move_group = moveit_commander.MoveGroupCommander(group_name)

print("pose_goal.orientation.w = ",move_group.get_current_pose().pose.orientation.w)
print("pose_goal.orientation.x = ",move_group.get_current_pose().pose.orientation.x)
print("pose_goal.orientation.y = ",move_group.get_current_pose().pose.orientation.y)
print("pose_goal.orientation.z = ",move_group.get_current_pose().pose.orientation.z)

print("pose_goal.position.x = ",move_group.get_current_pose().pose.position.x)
print("pose_goal.position.y = ",move_group.get_current_pose().pose.position.y)
print("pose_goal.position.z = ",move_group.get_current_pose().pose.position.z)

print("orientation = ", [move_group.get_current_pose().pose.orientation.x, move_group.get_current_pose().pose.orientation.y, move_group.get_current_pose().pose.orientation.z, move_group.get_current_pose().pose.orientation.w])
print("position = ", [move_group.get_current_pose().pose.position.x, move_group.get_current_pose().pose.position.y, move_group.get_current_pose().pose.position.z])