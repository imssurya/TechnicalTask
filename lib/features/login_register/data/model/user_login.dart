class UserLogin {
  int phno;
  int countryCode;
  UserLogin({this.phno, this.countryCode});

  Map<String, dynamic> toDatabaseJson() => {
        "phoneNumber": this.phno.toString(),
        "countryCode": countryCode.toString()
      };
}
