#!/usr/bin/env python3
import roslib
roslib.load_manifest("learning_tf")
import rospy
import tf

"""
    pose_goal.orientation.w =  0.3415971666479172
pose_goal.orientation.x =  0.22688660165135507
pose_goal.orientation.y =  -0.688307985377709
pose_goal.orientation.z =  0.5983861320205321
pose_goal.position.x =  -0.33201938790385915
pose_goal.position.y =  -0.3621654155287613
pose_goal.position.z =  0.2106740326699712

"""

if __name__ == '__main__':
    rospy.init_node('fixed_tf_broadcaster')
    br = tf.TransformBroadcaster()
    rate = rospy.Rate(10.0)
    while not rospy.is_shutdown():
        br.sendTransform((0.6145207252009262, -0.0020350606232543635, 0.7394514688491639),(0.27786593929756553, 0.6504540186705142, 0.6357901630221402, 0.30898375034609865),
                         rospy.Time.now(),
                         "asdfg",
                         "base_link") #camera_link_optical depth_camera_1 base_link
        rate.sleep()
