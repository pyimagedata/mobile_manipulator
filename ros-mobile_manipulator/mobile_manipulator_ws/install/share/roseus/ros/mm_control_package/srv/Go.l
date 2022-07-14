;; Auto-generated. Do not edit!


(when (boundp 'mm_control_package::Go)
  (if (not (find-package "MM_CONTROL_PACKAGE"))
    (make-package "MM_CONTROL_PACKAGE"))
  (shadow 'Go (find-package "MM_CONTROL_PACKAGE")))
(unless (find-package "MM_CONTROL_PACKAGE::GO")
  (make-package "MM_CONTROL_PACKAGE::GO"))
(unless (find-package "MM_CONTROL_PACKAGE::GOREQUEST")
  (make-package "MM_CONTROL_PACKAGE::GOREQUEST"))
(unless (find-package "MM_CONTROL_PACKAGE::GORESPONSE")
  (make-package "MM_CONTROL_PACKAGE::GORESPONSE"))

(in-package "ROS")





(defclass mm_control_package::GoRequest
  :super ros::object
  :slots (_position _quaternion ))

(defmethod mm_control_package::GoRequest
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

(defclass mm_control_package::GoResponse
  :super ros::object
  :slots (_go_to_target ))

(defmethod mm_control_package::GoResponse
  (:init
   (&key
    ((:go_to_target __go_to_target) nil)
    )
   (send-super :init)
   (setq _go_to_target __go_to_target)
   self)
  (:go_to_target
   (&optional (__go_to_target :null))
   (if (not (eq __go_to_target :null)) (setq _go_to_target __go_to_target)) _go_to_target)
  (:serialization-length
   ()
   (+
    ;; bool _go_to_target
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _go_to_target
       (if _go_to_target (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _go_to_target
     (setq _go_to_target (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass mm_control_package::Go
  :super ros::object
  :slots ())

(setf (get mm_control_package::Go :md5sum-) "7da200ae649da6f1d67321388542aa84")
(setf (get mm_control_package::Go :datatype-) "mm_control_package/Go")
(setf (get mm_control_package::Go :request) mm_control_package::GoRequest)
(setf (get mm_control_package::Go :response) mm_control_package::GoResponse)

(defmethod mm_control_package::GoRequest
  (:response () (instance mm_control_package::GoResponse :init)))

(setf (get mm_control_package::GoRequest :md5sum-) "7da200ae649da6f1d67321388542aa84")
(setf (get mm_control_package::GoRequest :datatype-) "mm_control_package/GoRequest")
(setf (get mm_control_package::GoRequest :definition-)
      "float64[] position
float64[] quaternion

---

bool go_to_target
")

(setf (get mm_control_package::GoResponse :md5sum-) "7da200ae649da6f1d67321388542aa84")
(setf (get mm_control_package::GoResponse :datatype-) "mm_control_package/GoResponse")
(setf (get mm_control_package::GoResponse :definition-)
      "float64[] position
float64[] quaternion

---

bool go_to_target
")



(provide :mm_control_package/Go "7da200ae649da6f1d67321388542aa84")


