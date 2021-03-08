class OTPPost {
  String phoneNumber;
  String countryCode;
  String otp;
  DeviceInfo deviceInfo;

  OTPPost({this.phoneNumber, this.countryCode, this.otp, this.deviceInfo});

  OTPPost.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    countryCode = json['countryCode'];
    otp = json['otp'];
    deviceInfo = json['deviceInfo'] != null
        ? new DeviceInfo.fromJson(json['deviceInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['countryCode'] = this.countryCode;
    data['otp'] = this.otp;
    if (this.deviceInfo != null) {
      data['deviceInfo'] = this.deviceInfo.toJson();
    }
    return data;
  }
}

class DeviceInfo {
  String deviceId;
  String osVersion;
  String appVersion;
  String platform;
  String ip;
  String pushToken;

  DeviceInfo(
      {this.deviceId,
      this.osVersion,
      this.appVersion,
      this.platform,
      this.ip,
      this.pushToken});

  DeviceInfo.fromJson(Map<String, dynamic> json) {
    deviceId = json['deviceId'];
    osVersion = json['osVersion'];
    appVersion = json['appVersion'];
    platform = json['platform'];
    ip = json['ip'];
    pushToken = json['pushToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deviceId'] = this.deviceId;
    data['osVersion'] = this.osVersion;
    data['appVersion'] = this.appVersion;
    data['platform'] = this.platform;
    data['ip'] = this.ip;
    data['pushToken'] = this.pushToken;
    return data;
  }
}
