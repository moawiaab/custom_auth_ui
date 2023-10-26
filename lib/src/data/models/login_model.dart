class LoginModel {
  String? email;
  String? password;
  String? deviceName;

  LoginModel({this.email, this.password, this.deviceName});

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    deviceName = json['device_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['device_name'] = deviceName;
    return data;
  }
}
