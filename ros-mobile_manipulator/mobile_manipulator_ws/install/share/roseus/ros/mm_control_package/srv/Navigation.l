;; Auto-generated. Do not edit!


(when (boundp 'mm_control_package::Navigation)
  (if (not (find-package "MM_CONTROL_PACKAGE"))
    (make-package "MM_CONTROL_PACKAGE"))
  (shadow 'Navigation (find-package "MM_CONTROL_PACKAGE")))
(unless (find-package "MM_CONTROL_PACKAGE::NAVIGATION")
  (make-package "MM_CONTROL_PACKAGE::NAVIGATION"))
(unless (find-package "MM_CONTROL_PACKAGE::NAVIGATIONREQUEST")
  (make-package "MM_CONTROL_PACKAGE::NAVIGATIONREQUEST"))
(unless (find-package "MM_CONTROL_PACKAGE::NAVIGATIONRESPONSE")
  (make-package "MM_CONTROL_PACKAGE::NAVIGATIONRESPONSE"))

(in-package "ROS")





(defclass mm_control_package::NavigationRequest
  :super ros::object
  :slots (_position _quaternion ))

(defmethod mm_control_package::NavigationRequest
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

(defclass mm_control_package::NavigationResponse
  :super ros::object
  :slots (_is_reached ))

(defmethod mm_control_package::NavigationResponse
  (:init
   (&key
    ((:is_reached __is_reached) nil)
    )
   (send-super :init)
   (setq _is_reached __is_reached)
   self)
  (:is_reached
   (&optional (__is_reached :null))
   (if (not (eq __is_reached :null)) (setq _is_reached __is_reached)) _is_reached)
  (:serialization-length
   ()
   (+
    ;; bool _is_reached
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _is_reached
       (if _is_reached (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _is_reached
     (setq _is_reached (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass mm_control_package::Navigation
  :super ros::object
  :slots ())

(setf (get mm_control_package::Navigation :md5sum-) "e8dc8bb776a8b70bff7d250ee9716417")
(setf (get mm_control_package::Navigation :datatype-) "mm_control_package/Navigation")
(setf (get mm_control_package::Navigation :request) mm_control_package::NavigationRequest)
(setf (get mm_control_package::Navigation :response) mm_control_package::NavigationResponse)

(defmethod mm_control_package::NavigationRequest
  (:response () (instance mm_control_package::NavigationResponse :init)))

(setf (get mm_control_package::NavigationRequest :md5sum-) "e8dc8bb776a8b70bff7d250ee9716417")
(setf (get mm_control_package::NavigationRequest :datatype-) "mm_control_package/NavigationRequest")
(setf (get mm_control_package::NavigationRequest :definition-)
      "float64[] position
float64[] quaternion

---

bool is_reached
")

(setf (get mm_control_package::NavigationResponse :md5sum-) "e8dc8bb776a8b70bff7d250ee9716417")
(setf (get mm_control_package::NavigationResponse :datatype-) "mm_control_package/NavigationResponse")
(setf (get mm_control_package::NavigationResponse :definition-)
      "float64[] position
float64[] quaternion

---

bool is_reached
")



(provide :mm_control_package/Navigation "e8dc8bb776a8b70bff7d250ee9716417")


