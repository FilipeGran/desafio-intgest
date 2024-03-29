import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  String? objectId;
  String? userName;
  String? email;
  String? password;
  String? name;
  String? phone;
  String? token;

  User({
    this.objectId,
    this.userName,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.token,
  });

  @override
  String toString() {
    return 'User(objectId: $objectId, userName: $userName, email: $email, password: $password name: $name, phone: $phone)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'objectId': objectId,
      'userName': userName,
      'email': email,
      'password': password,
      'name': name,
      'phone': phone,
      'token': token,
    };
  }

  factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      objectId: map['objectId'] != null ? map['objectId'] as String : null,
      userName: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
