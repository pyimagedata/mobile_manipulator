// Generated by gencpp from file mm_control_package/GoRequest.msg
// DO NOT EDIT!


#ifndef MM_CONTROL_PACKAGE_MESSAGE_GOREQUEST_H
#define MM_CONTROL_PACKAGE_MESSAGE_GOREQUEST_H


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
struct GoRequest_
{
  typedef GoRequest_<ContainerAllocator> Type;

  GoRequest_()
    : position()
    , quaternion()  {
    }
  GoRequest_(const ContainerAllocator& _alloc)
    : position(_alloc)
    , quaternion(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _position_type;
  _position_type position;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _quaternion_type;
  _quaternion_type quaternion;





  typedef boost::shared_ptr< ::mm_control_package::GoRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::mm_control_package::GoRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GoRequest_

typedef ::mm_control_package::GoRequest_<std::allocator<void> > GoRequest;

typedef boost::shared_ptr< ::mm_control_package::GoRequest > GoRequestPtr;
typedef boost::shared_ptr< ::mm_control_package::GoRequest const> GoRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::mm_control_package::GoRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::mm_control_package::GoRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::mm_control_package::GoRequest_<ContainerAllocator1> & lhs, const ::mm_control_package::GoRequest_<ContainerAllocator2> & rhs)
{
  return lhs.position == rhs.position &&
    lhs.quaternion == rhs.quaternion;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::mm_control_package::GoRequest_<ContainerAllocator1> & lhs, const ::mm_control_package::GoRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace mm_control_package

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::mm_control_package::GoRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::mm_control_package::GoRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mm_control_package::GoRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::mm_control_package::GoRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mm_control_package::GoRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::mm_control_package::GoRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::mm_control_package::GoRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "864b5650ed0d2bfd71f96b23c3666fce";
  }

  static const char* value(const ::mm_control_package::GoRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x864b5650ed0d2bfdULL;
  static const uint64_t static_value2 = 0x71f96b23c3666fceULL;
};

template<class ContainerAllocator>
struct DataType< ::mm_control_package::GoRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "mm_control_package/GoRequest";
  }

  static const char* value(const ::mm_control_package::GoRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::mm_control_package::GoRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] position\n"
"float64[] quaternion\n"
"\n"
;
  }

  static const char* value(const ::mm_control_package::GoRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::mm_control_package::GoRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.position);
      stream.next(m.quaternion);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GoRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::mm_control_package::GoRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::mm_control_package::GoRequest_<ContainerAllocator>& v)
  {
    s << indent << "position[]" << std::endl;
    for (size_t i = 0; i < v.position.size(); ++i)
    {
      s << indent << "  position[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.position[i]);
    }
    s << indent << "quaternion[]" << std::endl;
    for (size_t i = 0; i < v.quaternion.size(); ++i)
    {
      s << indent << "  quaternion[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.quaternion[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MM_CONTROL_PACKAGE_MESSAGE_GOREQUEST_H