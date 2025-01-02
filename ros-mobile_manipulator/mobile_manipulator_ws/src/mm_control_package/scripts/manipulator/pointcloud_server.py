#!/usr/bin/env python3

from __future__ import print_function
from mm_control_package.srv import PointCloud, PointCloudResponse
import time
import rospy
import numpy as np
from sensor_msgs.msg import Image, PointCloud2
import sensor_msgs.point_cloud2 as pc2
from tf.transformations import quaternion_from_euler
from tf.transformations import euler_from_matrix
from tf.transformations import quaternion_from_matrix
import tf
tft = tf.transformations

np.set_printoptions(suppress=True)

location_2d = None
position_ = None
quaternion_ = None
proccess = False

def point_callback(data):
    global location_2d
    global position_
    global quaternion_
    global proccess

    points_list = []

    for data in pc2.read_points(data, skip_nans=False):
        points_list.append(data)

    np_points = np.array(points_list)
    np_points = (np_points.reshape(500,500,4)).transpose(1,0,2)

    # points


    x,y = list(location_2d)

    x = int(x)
    y = int(y)

    print(x,y)
    
    p1 = np_points[x+10,y+10][:3]
    p2 = np_points[x-10,y-10][:3]
    p3 = np_points[x+10,y-10][:3]

    print("p1 :", p1)
    print("p2 :", p3)
    print("p3 :", p3)

    # vectors

    p1p2_vec = p2 - p1
    p1p3_vec = p3 - p1

    normal_vec = np.cross(p1p2_vec, p1p3_vec)
    
    center = np.array([(p1[0] + p2[0] + p3[0])/3, (p1[1] + p2[1] + p3[1])/3, (p1[2] + p2[2] + p3[2])/3])

    normal_vec[0] = (normal_vec[0]/abs(normal_vec[0]))*0.13
    normal_vec[1] = (normal_vec[1]/abs(normal_vec[1]))*0.13
    normal_vec[2] = (normal_vec[2]/abs(normal_vec[2]))*0.20

    norm_tip = np.array([center[0]+normal_vec[0], center[1]+normal_vec[1], center[2]+normal_vec[2]])

    norm_tip_inv = np.array([center[0]-normal_vec[0], center[1]-normal_vec[1], center[2]-normal_vec[2]])

    ref_pt = np.array([0, 0, 0])

    dist1 = np.linalg.norm(norm_tip - ref_pt)

    dist2 = np.linalg.norm(norm_tip_inv - ref_pt)

    if dist1 < dist2:
        tar_noz_pos = norm_tip
        tar_z_dir = -1*normal_vec
    else:
        tar_noz_pos = norm_tip_inv
        tar_z_dir = normal_vec

    z_vec = tar_z_dir

    x_ref =  np.array([1 ,0 , 0])
    y_ref =  np.array([0 ,1 ,0])
    z_ref =  np.array([0 ,0 ,1])
    
    y_vec = np.cross(z_vec, z_ref)
    
    x_vec = np.cross(z_vec, y_vec)

    r_matrix = np.array([x_vec, y_vec, z_vec])

    

    euler = euler_from_matrix(r_matrix.T)

    quaternion = quaternion_from_euler(euler[0], euler[1], euler[2])

    position = tar_noz_pos


    listener = tf.TransformListener()

    br = tf.TransformBroadcaster()

    while True:
        try:
            (trans,rot) = listener.lookupTransform('/base_footprint', '/camera_link_optical', rospy.Time(0))

            base_t_matrix = tft.translation_matrix(trans)

            base_r_matrix = tft.quaternion_matrix(rot)

            base_t_matrix[:3,:3] = base_r_matrix[:3,:3]

            #######

            target_t_matrix = tft.translation_matrix(position)

            target_r_matrix = tft.quaternion_matrix(quaternion)

            target_t_matrix[:3,:3] = target_r_matrix[:3,:3]

            ########
            
            t_matrix = np.dot(base_t_matrix, target_t_matrix)

            euler = euler_from_matrix(t_matrix[0:3,0:3])

            quaternion = quaternion_from_euler(euler[0], euler[1], euler[2])

            position = t_matrix[:3,3]

            br.sendTransform((position[0], position[1], position[2]),(quaternion[0], quaternion[1], quaternion[2], quaternion[3]),
                         rospy.Time.now(),
                         "asdfg",
                         "base_footprint") #camera_link_optical depth_camera_1 base_link

            

            # print("quaternion : \n", quaternion)

            # print("position : \n", position)

            break

        except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
            continue


    
    position_ = position
    quaternion_ = quaternion
    proccess = True

    

def handle_pointcloud_server(req):

    global location_2d
    global position_
    global quaternion_
    global proccess


    location_2d = req.location

    sub_cloud = rospy.Subscriber("/depth_camera/depth/points", PointCloud2, point_callback)

    while True:
        if proccess:
            break


    sub_cloud.unregister()

    proccess = False

    #position_[2] = position_[2] - 0.3

    print("position : ", position_)

    return PointCloudResponse(position = position_, quaternion = quaternion_)
    

def camera_server():
    rospy.init_node('pointcloud_server')
    s = rospy.Service('pointcloud_server', PointCloud, handle_pointcloud_server)
    print("Ready to sent pointcloud")
    rospy.spin()

if __name__ == "__main__":
    camera_server()