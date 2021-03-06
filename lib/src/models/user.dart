import 'dart:convert';

import 'package:delivery_app/src/models/role.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String email;
  String name;
  String lastname;
  String phone;
  String? password;
  String? image;
  String? sessionToken;
  List<Role>? roles;

  User({
    this.id,
    required this.email,
    required this.name,
    required this.lastname,
    required this.phone,
    this.roles,
    this.password,
    this.image,
    this.sessionToken
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] is int ? json["id"].toString() : json["id"],
    name: json["name"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
    password: json["password"],
    sessionToken: json["session_token"],
    image: json["image"],
    roles: json["roles"] == null ? [] : List<Role>.from(json["roles"].map((model) => Role.fromJson(model)))
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "lastname": lastname,
    "email": email,
    "phone": phone,
    "password": password,
    "session_token": sessionToken,
    "image": image,
    "roles": roles
  };
}
