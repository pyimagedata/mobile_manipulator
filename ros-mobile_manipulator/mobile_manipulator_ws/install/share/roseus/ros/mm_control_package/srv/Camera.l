;; Auto-generated. Do not edit!


(when (boundp 'mm_control_package::Camera)
  (if (not (find-package "MM_CONTROL_PACKAGE"))
    (make-package "MM_CONTROL_PACKAGE"))
  (shadow 'Camera (find-package "MM_CONTROL_PACKAGE")))
(unless (find-package "MM_CONTROL_PACKAGE::CAMERA")
  (make-package "MM_CONTROL_PACKAGE::CAMERA"))
(unless (find-package "MM_CONTROL_PACKAGE::CAMERAREQUEST")
  (make-package "MM_CONTROL_PACKAGE::CAMERAREQUEST"))
(unless (find-package "MM_CONTROL_PACKAGE::CAMERARESPONSE")
  (make-package "MM_CONTROL_PACKAGE::CAMERARESPONSE"))

(in-package "ROS")





(defclass mm_control_package::CameraRequest
  :super ros::object
  :slots (_camera_info ))

(defmethod mm_control_package::CameraRequest
  (:init
   (&key
    ((:camera_info __camera_info) "")
    )
   (send-super :init)
   (setq _camera_info (string __camera_info))
   self)
  (:camera_info
   (&optional __camera_info)
   (if __camera_info (setq _camera_info __camera_info)) _camera_info)
  (:serialization-length
   ()
   (+
    ;; string _camera_info
    4 (length _camera_info)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _camera_info
       (write-long (length _camera_info) s) (princ _camera_info s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _camera_info
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _camera_info (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass mm_control_package::CameraResponse
  :super ros::object
  :slots (_location ))

(defmethod mm_control_package::CameraResponse
  (:init
   (&key
    ((:location __location) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _location __location)
   self)
  (:location
   (&optional __location)
   (if __location (setq _location __location)) _location)
  (:serialization-length
   ()
   (+
    ;; float64[] _location
    (* 8    (length _location)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _location
     (write-long (length _location) s)
     (dotimes (i (length _location))
       (sys::poke (elt _location i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _location
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _location (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _location i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass mm_control_package::Camera
  :super ros::object
  :slots ())

(setf (get mm_control_package::Camera :md5sum-) "010a2da2b14923ed7389c831d1e92e1f")
(setf (get mm_control_package::Camera :datatype-) "mm_control_package/Camera")
(setf (get mm_control_package::Camera :request) mm_control_package::CameraRequest)
(setf (get mm_control_package::Camera :response) mm_control_package::CameraResponse)

(defmethod mm_control_package::CameraRequest
  (:response () (instance mm_control_package::CameraResponse :init)))

(setf (get mm_control_package::CameraRequest :md5sum-) "010a2da2b14923ed7389c831d1e92e1f")
(setf (get mm_control_package::CameraRequest :datatype-) "mm_control_package/CameraRequest")
(setf (get mm_control_package::CameraRequest :definition-)
      "string camera_info

---

float64[] location
")

(setf (get mm_control_package::CameraResponse :md5sum-) "010a2da2b14923ed7389c831d1e92e1f")
(setf (get mm_control_package::CameraResponse :datatype-) "mm_control_package/CameraResponse")
(setf (get mm_control_package::CameraResponse :definition-)
      "string camera_info

---

float64[] location
")



(provide :mm_control_package/Camera "010a2da2b14923ed7389c831d1e92e1f")


