// Generated by gencpp from file mm_control_package/PointCloudRequest.msg
// DO NOT EDIT!


#ifndef MM_CONTROL_PACKAGE_MESSAGE_POINTCLOUDREQUEST_H
#define MM_CONTROL_PACKAGE_MESSAGE_POINTCLOUDREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace mm_control_package
{
template <class ContainerAllocator>
struct PointCloudRequest_
{
  typedef PointCloudRequest_<ContainerAllocator> Type;

  PointCloudRequest_()
    : location()  {
    }
  PointCloudRequest_(const ContainerAllocator& _alloc)
    : location(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _location_type;
  _location_type location;





  typedef boost::shared_ptr< ::mm_control_package::PointCloudRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mm_control_package::PointCloudRequest_<ContainerAllocator> const> ConstPtr;

}; // struct PointCloudRequest_

typedef ::mm_control_package::PointCloudRequest_<std::allocator<void> > PointCloudRequest;

typedef boost::shared_ptr< ::mm_control_package::PointCloudRequest > PointCloudRequestPtr;
typedef boost::shared_ptr< ::mm_control_package::PointCloudRequest const> PointCloudRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mm_control_package::PointCloudRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mm_control_package::PointCloudRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mm_control_package::PointCloudRequest_<ContainerAllocator1> & lhs, const ::mm_control_package::PointCloudRequest_<ContainerAllocator2> & rhs)
{
  return lhs.location == rhs.location;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mm_control_package::PointCloudRequest_<ContainerAllocator1> & lhs, const ::mm_control_package::PointCloudRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mm_control_package

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mm_control_package::PointCloudRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mm_control_package::PointCloudRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mm_control_package::PointCloudRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mm_control_package::PointCloudRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mm_control_package::PointCloudRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mm_control_package::PointCloudRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mm_control_package::PointCloudRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "f04249726d50d6a4bb44712fe2cef43f";
  }

  static const char* value(const ::mm_control_package::PointCloudRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xf04249726d50d6a4ULL;
  static const uint64_t static_value2 = 0xbb44712fe2cef43fULL;
};

template<class ContainerAllocator>
struct DataType< ::mm_control_package::PointCloudRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mm_control_package/PointCloudRequest";
  }

  static const char* value(const ::mm_control_package::PointCloudRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mm_control_package::PointCloudRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] location\n"
"\n"
;
  }

  static const char* value(const ::mm_control_package::PointCloudRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mm_control_package::PointCloudRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.location);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct PointCloudRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mm_control_package::PointCloudRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mm_control_package::PointCloudRequest_<ContainerAllocator>& v)
  {
    s << indent << "location[]" << std::endl;
    for (size_t i = 0; i < v.location.size(); ++i)
    {
      s << indent << "  location[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.location[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MM_CONTROL_PACKAGE_MESSAGE_POINTCLOUDREQUEST_H
