#!/usr/bin/env python3
import roslib
roslib.load_manifest('learning_tf')
import rospy
import math
import tf
import geometry_msgs.msg
import turtlesim.srv

if __name__ == '__main__':
    rospy.init_node('turtle_tf_listener')

    listener = tf.TransformListener()

    print("heree")


    rate = rospy.Rate(10.0)
    
    while not rospy.is_shutdown():
        try:
            (trans,rot) = listener.lookupTransform('/base_link', '/asdfg', rospy.Time(0))
        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            continue
        
        """
        print("trans : ", trans)
        print("")
        print("rot : ", rot)

        """

        position = trans
        quaternion = rot

        print("pose_goal.orientation.x = ",quaternion[0])
        print("pose_goal.orientation.y = ",quaternion[1])
        print("pose_goal.orientation.z = ",quaternion[2])
        print("pose_goal.orientation.w = ",quaternion[3])

        print("pose_goal.position.x = ",position[0])
        print("pose_goal.position.y = ",position[1])
        print("pose_goal.position.z = ",position[2])

        print(" \n")


        print(f"br.sendTransform(({position[0]}, {position[1]}, {position[2]}),({quaternion[0]}, {quaternion[1]}, {quaternion[2]}, {quaternion[3]}),")

        rate.sleep()