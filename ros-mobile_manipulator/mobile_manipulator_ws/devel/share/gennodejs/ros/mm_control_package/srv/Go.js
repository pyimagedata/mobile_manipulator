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

class GoRequest {
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
    // Serializes a message object of type GoRequest
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float64(obj.position, buffer, bufferOffset, null);
    // Serialize message field [quaternion]
    bufferOffset = _arraySerializer.float64(obj.quaternion, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoRequest
    let len;
    let data = new GoRequest(null);
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
    return 'mm_control_package/GoRequest';
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
    const resolved = new GoRequest(null);
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

class GoResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.go_to_target = null;
    }
    else {
      if (initObj.hasOwnProperty('go_to_target')) {
        this.go_to_target = initObj.go_to_target
      }
      else {
        this.go_to_target = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoResponse
    // Serialize message field [go_to_target]
    bufferOffset = _serializer.bool(obj.go_to_target, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoResponse
    let len;
    let data = new GoResponse(null);
    // Deserialize message field [go_to_target]
    data.go_to_target = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'mm_control_package/GoResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cc60057baede889bc8a3509f0b2bc102';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    bool go_to_target
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoResponse(null);
    if (msg.go_to_target !== undefined) {
      resolved.go_to_target = msg.go_to_target;
    }
    else {
      resolved.go_to_target = false
    }

    return resolved;
    }
};

module.exports = {
  Request: GoRequest,
  Response: GoResponse,
  md5sum() { return '7da200ae649da6f1d67321388542aa84'; },
  datatype() { return 'mm_control_package/Go'; }
};
