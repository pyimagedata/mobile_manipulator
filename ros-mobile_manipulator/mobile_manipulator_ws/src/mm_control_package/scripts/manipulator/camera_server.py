#!/usr/bin/env python3

from __future__ import print_function
from mm_control_package.srv import Camera, CameraRequest, CameraResponse
import time
import rospy
import numpy as np
from sensor_msgs.msg import Image
import glob
import random
import cv2
from cv_bridge import CvBridge, CvBridgeError
bridge = CvBridge()

image_ = None

disease_list = []

proccess = False

def image_callback(img_msg):

    global image_
    global disease_list
    global proccess

    image_ = None
    disease_list = []
    
    try:
        cv_image = bridge.imgmsg_to_cv2(img_msg, "passthrough")
        
    except CvBridgeError as e:
        rospy.logerr("CvBridge Error: {0}".format(e))

    # Flip the image 90deg
    
    cv_image = cv2.cvtColor(cv_image, cv2.COLOR_BGR2RGB)

    # cv_image = cv2.transpose(cv_image)
    # cv_image = cv2.flip(cv_image,0)

    # cv_image = cv2.transpose(cv_image)
    # image = cv2.flip(cv_image,1)

    image_ = cv_image

    net = cv2.dnn.readNet("/home/burhanok/mobile_manipulator_ws/src/mm_control_package/scripts/manipulator/yolov3_training_last.weights", "/home/burhanok/mobile_manipulator_ws/src/mm_control_package/scripts/manipulator/yolov3_testing.cfg")
    
    # Name custom object
    classes = ["leaf_spot",]

    # Images path
    #images_path = glob.glob(r"/home/burhanok/Pictures/*.jpg")

    

    layer_names = net.getLayerNames()
    output_layers = []
    for i in net.getUnconnectedOutLayers():

        output_layers.append(layer_names[i - 1])

    colors = np.random.uniform(0, 255, size=(len(classes), 3))
    
    img = cv_image
    # if img.shape[0] or img.shape[1] > 640:
    #   img = cv2.resize(img, None, fx=0.1, fy=0.1)
    height, width, channels = img.shape

    # Detecting objects
    blob = cv2.dnn.blobFromImage(img, 0.00392, (416, 416), (0, 0, 0), True, crop=False)

    net.setInput(blob)
    outs = net.forward(output_layers)

    # Showing informations on the screen
    class_ids = []
    confidences = []
    boxes = []
    for out in outs:
        for detection in out:
            scores = detection[5:]
            class_id = np.argmax(scores)
            confidence = scores[class_id]
            if confidence > 0.01:
                # Object detected
                center_x = int(detection[0] * width)
                center_y = int(detection[1] * height)
                w = int(detection[2] * width)
                h = int(detection[3] * height)

                # Rectangle coordinates
                x = int(center_x - w / 2)
                y = int(center_y - h / 2)

                boxes.append([x, y, w, h])
                confidences.append(float(confidence))
                class_ids.append(class_id)

    indexes = cv2.dnn.NMSBoxes(boxes, confidences, 0.1, 0.1)
    font = cv2.FONT_HERSHEY_PLAIN
    for i in range(len(boxes)):
        if i in indexes:
            x, y, w, h = boxes[i]
            # label = str(classes[class_ids[i]])
            # color = colors[class_ids[i]]
            # cv2.rectangle(img, (x, y), (x + w, y + h), color, 3)
            # cv2.putText(img, "%" + str(round(confidences[i], 3)*100)[:4] + " " + label, (x, y - 15), font, 2, color, 2)
            # cv2.putText(img, f"x : {x}", (x + int(w/3), y + int(h/2)), font, 1, (255,255,255), 1)
            # cv2.putText(img, f"y : {y}", (x + int(w/3), y + int(h/2) + 20), font, 1, (255,255,255), 1)
            # cv2.circle(img, (x+int(w/2),y+int(h/2)), radius=0, color=(0, 0, 255), thickness=10)
            disease_list.append([x+int(w/2),y+int(h/2)])

    print(img.shape)

    #cv2.imshow("img", img)

    key = cv2.waitKey(0)

    cv2.destroyAllWindows()

    proccess =  True

    print("diseae_list : ", disease_list)

    return image_

def handle_camera_server(req):
    global image_
    global disease_list
    global proccess
    
    sub_image = rospy.Subscriber("/depth_camera/color/image_raw", Image, image_callback)

    while True:
        if proccess:
            break

    # print(disease_list[0])

    location_list = np.array(disease_list).flatten()

    sub_image.unregister()

    proccess = False

    return CameraResponse(location = location_list)
    

def camera_server():
    rospy.init_node('camera_server')
    s = rospy.Service('camera_server', Camera, handle_camera_server)
    print("Ready to send camera")
    rospy.spin()

if __name__ == "__main__":
    camera_server()