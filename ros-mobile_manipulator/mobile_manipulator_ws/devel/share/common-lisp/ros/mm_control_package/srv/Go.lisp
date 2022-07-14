; Auto-generated. Do not edit!


(cl:in-package mm_control_package-srv)


;//! \htmlinclude Go-request.msg.html

(cl:defclass <Go-request> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (quaternion
    :reader quaternion
    :initarg :quaternion
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Go-request (<Go-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Go-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Go-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mm_control_package-srv:<Go-request> is deprecated: use mm_control_package-srv:Go-request instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <Go-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mm_control_package-srv:position-val is deprecated.  Use mm_control_package-srv:position instead.")
  (position m))

(cl:ensure-generic-function 'quaternion-val :lambda-list '(m))
(cl:defmethod quaternion-val ((m <Go-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mm_control_package-srv:quaternion-val is deprecated.  Use mm_control_package-srv:quaternion instead.")
  (quaternion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Go-request>) ostream)
  "Serializes a message object of type '<Go-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'position))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'quaternion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'quaternion))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Go-request>) istream)
  "Deserializes a message object of type '<Go-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'quaternion) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'quaternion)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Go-request>)))
  "Returns string type for a service object of type '<Go-request>"
  "mm_control_package/GoRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Go-request)))
  "Returns string type for a service object of type 'Go-request"
  "mm_control_package/GoRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Go-request>)))
  "Returns md5sum for a message object of type '<Go-request>"
  "7da200ae649da6f1d67321388542aa84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Go-request)))
  "Returns md5sum for a message object of type 'Go-request"
  "7da200ae649da6f1d67321388542aa84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Go-request>)))
  "Returns full string definition for message of type '<Go-request>"
  (cl:format cl:nil "float64[] position~%float64[] quaternion~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Go-request)))
  "Returns full string definition for message of type 'Go-request"
  (cl:format cl:nil "float64[] position~%float64[] quaternion~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Go-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'quaternion) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Go-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Go-request
    (cl:cons ':position (position msg))
    (cl:cons ':quaternion (quaternion msg))
))
;//! \htmlinclude Go-response.msg.html

(cl:defclass <Go-response> (roslisp-msg-protocol:ros-message)
  ((go_to_target
    :reader go_to_target
    :initarg :go_to_target
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Go-response (<Go-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Go-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Go-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mm_control_package-srv:<Go-response> is deprecated: use mm_control_package-srv:Go-response instead.")))

(cl:ensure-generic-function 'go_to_target-val :lambda-list '(m))
(cl:defmethod go_to_target-val ((m <Go-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mm_control_package-srv:go_to_target-val is deprecated.  Use mm_control_package-srv:go_to_target instead.")
  (go_to_target m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Go-response>) ostream)
  "Serializes a message object of type '<Go-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'go_to_target) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Go-response>) istream)
  "Deserializes a message object of type '<Go-response>"
    (cl:setf (cl:slot-value msg 'go_to_target) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Go-response>)))
  "Returns string type for a service object of type '<Go-response>"
  "mm_control_package/GoResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Go-response)))
  "Returns string type for a service object of type 'Go-response"
  "mm_control_package/GoResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Go-response>)))
  "Returns md5sum for a message object of type '<Go-response>"
  "7da200ae649da6f1d67321388542aa84")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Go-response)))
  "Returns md5sum for a message object of type 'Go-response"
  "7da200ae649da6f1d67321388542aa84")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Go-response>)))
  "Returns full string definition for message of type '<Go-response>"
  (cl:format cl:nil "~%bool go_to_target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Go-response)))
  "Returns full string definition for message of type 'Go-response"
  (cl:format cl:nil "~%bool go_to_target~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Go-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Go-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Go-response
    (cl:cons ':go_to_target (go_to_target msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Go)))
  'Go-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Go)))
  'Go-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Go)))
  "Returns string type for a service object of type '<Go>"
  "mm_control_package/Go")