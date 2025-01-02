; Auto-generated. Do not edit!


(cl:in-package mm_control_package-srv)


;//! \htmlinclude Navigation-request.msg.html

(cl:defclass <Navigation-request> (roslisp-msg-protocol:ros-message)
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

(cl:defclass Navigation-request (<Navigation-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Navigation-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Navigation-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mm_control_package-srv:<Navigation-request> is deprecated: use mm_control_package-srv:Navigation-request instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <Navigation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mm_control_package-srv:position-val is deprecated.  Use mm_control_package-srv:position instead.")
  (position m))

(cl:ensure-generic-function 'quaternion-val :lambda-list '(m))
(cl:defmethod quaternion-val ((m <Navigation-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mm_control_package-srv:quaternion-val is deprecated.  Use mm_control_package-srv:quaternion instead.")
  (quaternion m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Navigation-request>) ostream)
  "Serializes a message object of type '<Navigation-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Navigation-request>) istream)
  "Deserializes a message object of type '<Navigation-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Navigation-request>)))
  "Returns string type for a service object of type '<Navigation-request>"
  "mm_control_package/NavigationRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Navigation-request)))
  "Returns string type for a service object of type 'Navigation-request"
  "mm_control_package/NavigationRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Navigation-request>)))
  "Returns md5sum for a message object of type '<Navigation-request>"
  "e8dc8bb776a8b70bff7d250ee9716417")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Navigation-request)))
  "Returns md5sum for a message object of type 'Navigation-request"
  "e8dc8bb776a8b70bff7d250ee9716417")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Navigation-request>)))
  "Returns full string definition for message of type '<Navigation-request>"
  (cl:format cl:nil "float64[] position~%float64[] quaternion~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Navigation-request)))
  "Returns full string definition for message of type 'Navigation-request"
  (cl:format cl:nil "float64[] position~%float64[] quaternion~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Navigation-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'quaternion) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Navigation-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Navigation-request
    (cl:cons ':position (position msg))
    (cl:cons ':quaternion (quaternion msg))
))
;//! \htmlinclude Navigation-response.msg.html

(cl:defclass <Navigation-response> (roslisp-msg-protocol:ros-message)
  ((is_reached
    :reader is_reached
    :initarg :is_reached
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Navigation-response (<Navigation-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Navigation-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Navigation-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mm_control_package-srv:<Navigation-response> is deprecated: use mm_control_package-srv:Navigation-response instead.")))

(cl:ensure-generic-function 'is_reached-val :lambda-list '(m))
(cl:defmethod is_reached-val ((m <Navigation-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mm_control_package-srv:is_reached-val is deprecated.  Use mm_control_package-srv:is_reached instead.")
  (is_reached m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Navigation-response>) ostream)
  "Serializes a message object of type '<Navigation-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_reached) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Navigation-response>) istream)
  "Deserializes a message object of type '<Navigation-response>"
    (cl:setf (cl:slot-value msg 'is_reached) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Navigation-response>)))
  "Returns string type for a service object of type '<Navigation-response>"
  "mm_control_package/NavigationResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Navigation-response)))
  "Returns string type for a service object of type 'Navigation-response"
  "mm_control_package/NavigationResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Navigation-response>)))
  "Returns md5sum for a message object of type '<Navigation-response>"
  "e8dc8bb776a8b70bff7d250ee9716417")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Navigation-response)))
  "Returns md5sum for a message object of type 'Navigation-response"
  "e8dc8bb776a8b70bff7d250ee9716417")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Navigation-response>)))
  "Returns full string definition for message of type '<Navigation-response>"
  (cl:format cl:nil "~%bool is_reached~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Navigation-response)))
  "Returns full string definition for message of type 'Navigation-response"
  (cl:format cl:nil "~%bool is_reached~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Navigation-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Navigation-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Navigation-response
    (cl:cons ':is_reached (is_reached msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Navigation)))
  'Navigation-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Navigation)))
  'Navigation-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Navigation)))
  "Returns string type for a service object of type '<Navigation>"
  "mm_control_package/Navigation")