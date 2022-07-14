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

class NavigationRequest {
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
    // Serializes a message object of type NavigationRequest
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float64(obj.position, buffer, bufferOffset, null);
    // Serialize message field [quaternion]
    bufferOffset = _arraySerializer.float64(obj.quaternion, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavigationRequest
    let len;
    let data = new NavigationRequest(null);
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
    return 'mm_control_package/NavigationRequest';
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
    const resolved = new NavigationRequest(null);
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

class NavigationResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.is_reached = null;
    }
    else {
      if (initObj.hasOwnProperty('is_reached')) {
        this.is_reached = initObj.is_reached
      }
      else {
        this.is_reached = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavigationResponse
    // Serialize message field [is_reached]
    bufferOffset = _serializer.bool(obj.is_reached, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavigationResponse
    let len;
    let data = new NavigationResponse(null);
    // Deserialize message field [is_reached]
    data.is_reached = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mm_control_package/NavigationResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '92a498b18e821e639be1d4885d80f04c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool is_reached
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavigationResponse(null);
    if (msg.is_reached !== undefined) {
      resolved.is_reached = msg.is_reached;
    }
    else {
      resolved.is_reached = false
    }

    return resolved;
    }
};

module.exports = {
  Request: NavigationRequest,
  Response: NavigationResponse,
  md5sum() { return 'e8dc8bb776a8b70bff7d250ee9716417'; },
  datatype() { return 'mm_control_package/Navigation'; }
};
