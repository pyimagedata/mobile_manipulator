// Generated by gencpp from file mm_control_package/PointCloud.msg
// DO NOT EDIT!


#ifndef MM_CONTROL_PACKAGE_MESSAGE_POINTCLOUD_H
#define MM_CONTROL_PACKAGE_MESSAGE_POINTCLOUD_H

#include <ros/service_traits.h>


#include <mm_control_package/PointCloudRequest.h>
#include <mm_control_package/PointCloudResponse.h>


namespace mm_control_package
{

struct PointCloud
{

typedef PointCloudRequest Request;
typedef PointCloudResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct PointCloud
} // namespace mm_control_package


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::mm_control_package::PointCloud > {
  static const char* value()
  {
    return "e47fc7672505a60e4643aad82531f7f9";
  }

  static const char* value(const ::mm_control_package::PointCloud&) { return value(); }
};

template<>
struct DataType< ::mm_control_package::PointCloud > {
  static const char* value()
  {
    return "mm_control_package/PointCloud";
  }

  static const char* value(const ::mm_control_package::PointCloud&) { return value(); }
};


// service_traits::MD5Sum< ::mm_control_package::PointCloudRequest> should match
// service_traits::MD5Sum< ::mm_control_package::PointCloud >
template<>
struct MD5Sum< ::mm_control_package::PointCloudRequest>
{
  static const char* value()
  {
    return MD5Sum< ::mm_control_package::PointCloud >::value();
  }
  static const char* value(const ::mm_control_package::PointCloudRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::mm_control_package::PointCloudRequest> should match
// service_traits::DataType< ::mm_control_package::PointCloud >
template<>
struct DataType< ::mm_control_package::PointCloudRequest>
{
  static const char* value()
  {
    return DataType< ::mm_control_package::PointCloud >::value();
  }
  static const char* value(const ::mm_control_package::PointCloudRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::mm_control_package::PointCloudResponse> should match
// service_traits::MD5Sum< ::mm_control_package::PointCloud >
template<>
struct MD5Sum< ::mm_control_package::PointCloudResponse>
{
  static const char* value()
  {
    return MD5Sum< ::mm_control_package::PointCloud >::value();
  }
  static const char* value(const ::mm_control_package::PointCloudResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::mm_control_package::PointCloudResponse> should match
// service_traits::DataType< ::mm_control_package::PointCloud >
template<>
struct DataType< ::mm_control_package::PointCloudResponse>
{
  static const char* value()
  {
    return DataType< ::mm_control_package::PointCloud >::value();
  }
  static const char* value(const ::mm_control_package::PointCloudResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // MM_CONTROL_PACKAGE_MESSAGE_POINTCLOUD_H
