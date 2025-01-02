
(cl:in-package :asdf)

(defsystem "mm_control_package-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Camera" :depends-on ("_package_Camera"))
    (:file "_package_Camera" :depends-on ("_package"))
    (:file "Go" :depends-on ("_package_Go"))
    (:file "_package_Go" :depends-on ("_package"))
    (:file "Navigation" :depends-on ("_package_Navigation"))
    (:file "_package_Navigation" :depends-on ("_package"))
    (:file "PointCloud" :depends-on ("_package_PointCloud"))
    (:file "_package_PointCloud" :depends-on ("_package"))
  ))