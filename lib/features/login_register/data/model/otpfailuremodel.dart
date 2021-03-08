class OTPFailureResponse {
  bool success;
  int statusCode;
  String timestamp;
  Error error;
  String stack;

  OTPFailureResponse(
      {this.success, this.statusCode, this.timestamp, this.error, this.stack});

  OTPFailureResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    timestamp = json['timestamp'];
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
    stack = json['stack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['timestamp'] = this.timestamp;
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    data['stack'] = this.stack;
    return data;
  }
}

class Error {
  String name;
  int statusCode;
  String message;

  Error({this.name, this.statusCode, this.message});

  Error.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    statusCode = json['statusCode'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    return data;
  }
}
