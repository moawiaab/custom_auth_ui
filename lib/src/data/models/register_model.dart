class RegisterModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? deviceName;

  RegisterModel({this.email, this.password, this.deviceName, this.phone, this.name});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    deviceName = json['device_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['device_name'] = deviceName;
    return data;
  }
}
// TODO Implement this library.