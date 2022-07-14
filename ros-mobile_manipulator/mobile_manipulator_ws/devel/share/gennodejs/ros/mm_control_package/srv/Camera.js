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

class CameraRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.camera_info = null;
    }
    else {
      if (initObj.hasOwnProperty('camera_info')) {
        this.camera_info = initObj.camera_info
      }
      else {
        this.camera_info = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CameraRequest
    // Serialize message field [camera_info]
    bufferOffset = _serializer.string(obj.camera_info, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CameraRequest
    let len;
    let data = new CameraRequest(null);
    // Deserialize message field [camera_info]
    data.camera_info = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.camera_info);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mm_control_package/CameraRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e3d1d45cc9c0eb0e6e9ef36bbe24bcd4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string camera_info
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CameraRequest(null);
    if (msg.camera_info !== undefined) {
      resolved.camera_info = msg.camera_info;
    }
    else {
      resolved.camera_info = ''
    }

    return resolved;
    }
};

class CameraResponse {
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
    // Serializes a message object of type CameraResponse
    // Serialize message field [location]
    bufferOffset = _arraySerializer.float64(obj.location, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CameraResponse
    let len;
    let data = new CameraResponse(null);
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
    return 'mm_control_package/CameraResponse';
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
    const resolved = new CameraResponse(null);
    if (msg.location !== undefined) {
      resolved.location = msg.location;
    }
    else {
      resolved.location = []
    }

    return resolved;
    }
};

module.exports = {
  Request: CameraRequest,
  Response: CameraResponse,
  md5sum() { return '010a2da2b14923ed7389c831d1e92e1f'; },
  datatype() { return 'mm_control_package/Camera'; }
};
