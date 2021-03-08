class OTPSuccessResponse {
  bool success;
  int statusCode;
  String timestamp;
  Data data;

  OTPSuccessResponse(
      {this.success, this.statusCode, this.timestamp, this.data});

  OTPSuccessResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    timestamp = json['timestamp'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['timestamp'] = this.timestamp;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String authToken;
  String refreshToken;
  User user;
  bool isNewUser;

  Data({this.authToken, this.refreshToken, this.user, this.isNewUser});

  Data.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
    refreshToken = json['refreshToken'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    isNewUser = json['isNewUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authToken'] = this.authToken;
    data['refreshToken'] = this.refreshToken;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['isNewUser'] = this.isNewUser;
    return data;
  }
}

class User {
  int id;
  String countryCode;
  String phoneNumber;

  User({this.id, this.countryCode, this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['countryCode'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['countryCode'] = this.countryCode;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
