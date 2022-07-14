// Auto-generated. Do not edit!

// (in-package mm_control_package.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class PointCloudRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.location = null;
    }
    else {
      if (initObj.hasOwnProperty('location')) {
        this.location = initObj.location
      }
      else {
        this.location = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PointCloudRequest
    // Serialize message field [location]
    bufferOffset = _arraySerializer.float64(obj.location, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PointCloudRequest
    let len;
    let data = new PointCloudRequest(null);
    // Deserialize message field [location]
    data.location = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.location.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mm_control_package/PointCloudRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f04249726d50d6a4bb44712fe2cef43f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] location
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PointCloudRequest(null);
    if (msg.location !== undefined) {
      resolved.location = msg.location;
    }
    else {
      resolved.location = []
    }

    return resolved;
    }
};

class PointCloudResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position = null;
      this.quaternion = null;
    }
    else {
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = [];
      }
      if (initObj.hasOwnProperty('quaternion')) {
        this.quaternion = initObj.quaternion
      }
      else {
        this.quaternion = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PointCloudResponse
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float64(obj.position, buffer, bufferOffset, null);
    // Serialize message field [quaternion]
    bufferOffset = _arraySerializer.float64(obj.quaternion, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PointCloudResponse
    let len;
    let data = new PointCloudResponse(null);
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [quaternion]
    data.quaternion = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.position.length;
    length += 8 * object.quaternion.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mm_control_package/PointCloudResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '864b5650ed0d2bfd71f96b23c3666fce';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    float64[] position
    float64[] quaternion
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PointCloudResponse(null);
    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = []
    }

    if (msg.quaternion !== undefined) {
      resolved.quaternion = msg.quaternion;
    }
    else {
      resolved.quaternion = []
    }

    return resolved;
    }
};

module.exports = {
  Request: PointCloudRequest,
  Response: PointCloudResponse,
  md5sum() { return 'e47fc7672505a60e4643aad82531f7f9'; },
  datatype() { return 'mm_control_package/PointCloud'; }
};
