;; Auto-generated. Do not edit!


(when (boundp 'mm_control_package::PointCloud)
  (if (not (find-package "MM_CONTROL_PACKAGE"))
    (make-package "MM_CONTROL_PACKAGE"))
  (shadow 'PointCloud (find-package "MM_CONTROL_PACKAGE")))
(unless (find-package "MM_CONTROL_PACKAGE::POINTCLOUD")
  (make-package "MM_CONTROL_PACKAGE::POINTCLOUD"))
(unless (find-package "MM_CONTROL_PACKAGE::POINTCLOUDREQUEST")
  (make-package "MM_CONTROL_PACKAGE::POINTCLOUDREQUEST"))
(unless (find-package "MM_CONTROL_PACKAGE::POINTCLOUDRESPONSE")
  (make-package "MM_CONTROL_PACKAGE::POINTCLOUDRESPONSE"))

(in-package "ROS")





(defclass mm_control_package::PointCloudRequest
  :super ros::object
  :slots (_location ))

(defmethod mm_control_package::PointCloudRequest
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

(defclass mm_control_package::PointCloudResponse
  :super ros::object
  :slots (_position _quaternion ))

(defmethod mm_control_package::PointCloudResponse
  (:init
   (&key
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:quaternion __quaternion) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _position __position)
   (setq _quaternion __quaternion)
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:quaternion
   (&optional __quaternion)
   (if __quaternion (setq _quaternion __quaternion)) _quaternion)
  (:serialization-length
   ()
   (+
    ;; float64[] _position
    (* 8    (length _position)) 4
    ;; float64[] _quaternion
    (* 8    (length _quaternion)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _quaternion
     (write-long (length _quaternion) s)
     (dotimes (i (length _quaternion))
       (sys::poke (elt _quaternion i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _quaternion
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _quaternion (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _quaternion i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass mm_control_package::PointCloud
  :super ros::object
  :slots ())

(setf (get mm_control_package::PointCloud :md5sum-) "e47fc7672505a60e4643aad82531f7f9")
(setf (get mm_control_package::PointCloud :datatype-) "mm_control_package/PointCloud")
(setf (get mm_control_package::PointCloud :request) mm_control_package::PointCloudRequest)
(setf (get mm_control_package::PointCloud :response) mm_control_package::PointCloudResponse)

(defmethod mm_control_package::PointCloudRequest
  (:response () (instance mm_control_package::PointCloudResponse :init)))

(setf (get mm_control_package::PointCloudRequest :md5sum-) "e47fc7672505a60e4643aad82531f7f9")
(setf (get mm_control_package::PointCloudRequest :datatype-) "mm_control_package/PointCloudRequest")
(setf (get mm_control_package::PointCloudRequest :definition-)
      "float64[] location

---

float64[] position
float64[] quaternion
")

(setf (get mm_control_package::PointCloudResponse :md5sum-) "e47fc7672505a60e4643aad82531f7f9")
(setf (get mm_control_package::PointCloudResponse :datatype-) "mm_control_package/PointCloudResponse")
(setf (get mm_control_package::PointCloudResponse :definition-)
      "float64[] location

---

float64[] position
float64[] quaternion
")



(provide :mm_control_package/PointCloud "e47fc7672505a60e4643aad82531f7f9")


