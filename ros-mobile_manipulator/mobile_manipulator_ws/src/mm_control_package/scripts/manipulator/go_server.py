#!/usr/bin/env python3

from pickle import FALSE
from warnings import resetwarnings
from six.moves import input
import sys
import copy
import rospy
import moveit_commander
import moveit_msgs.msg
import geometry_msgs.msg
from mm_control_package.srv import Go, GoResponse

proccess = False

try:
    from math import pi, tau, dist, fabs, cos
except:  # For Python 2 compatibility
    from math import pi, fabs, cos, sqrt

    tau = 2.0 * pi

    def dist(p, q):
        return sqrt(sum((p_i - q_i) ** 2.0 for p_i, q_i in zip(p, q)))


from std_msgs.msg import String
from moveit_commander.conversions import pose_to_list

def go_to_position(position_, quaternion_):

    global proccess

    moveit_commander.roscpp_initialize(sys.argv)

    robot = moveit_commander.RobotCommander()

    scene = moveit_commander.PlanningSceneInterface()

    group_name = "arm"
    move_group = moveit_commander.MoveGroupCommander(group_name)

    pose_goal = geometry_msgs.msg.Pose()

    pose_goal.orientation.x =  quaternion_[0]
    pose_goal.orientation.y =  quaternion_[1]
    pose_goal.orientation.z =  quaternion_[2]
    pose_goal.orientation.w =  quaternion_[3]
    pose_goal.position.x =  position_[0]
    pose_goal.position.y =  position_[1]
    pose_goal.position.z =  position_[2]

    move_group.set_pose_target(pose_goal)

    plan = move_group.go(wait=True)

    print("********** plan ******************* : ", plan)

    move_group.stop()
    move_group.clear_pose_targets()

    proccess = True

    return True

def handle_go_server(req):

    global proccess
    
    position_ = list(req.position)
    quaternion_ = list(req.quaternion)

    res = go_to_position(position_, quaternion_)

    #print(position_)
    #print("\n")
    #print(quaternion_)

    while True:
        if proccess:
            break

    proccess = False

    return GoResponse(go_to_target = res)
    

def camera_server():
    rospy.init_node('go_server')
    s = rospy.Service('go_server', Go, handle_go_server)
    print("Ready go server")
    rospy.spin()

if __name__ == "__main__":
    camera_server()