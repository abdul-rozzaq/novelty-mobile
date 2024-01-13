import 'dart:convert';

import 'package:novelty/models/location_models.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  String id;
  String firstName;
  String lastName;
  String phone;
  DateTime created;
  District? district;

  String get getFullName => "$firstName $lastName";

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.created,
    this.district,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        created: DateTime.parse(json["created"]),
        district: json['district'] == null ? null : District.fromJson(json["district"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "created": created.toIso8601String(),
        "district": district?.toJson(),
      };
}
