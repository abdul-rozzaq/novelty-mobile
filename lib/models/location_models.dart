// To parse this JSON data, do
//
//     final region = regionFromJson(jsonString);

import 'dart:convert';

List<Region> regionFromJson(String str) => List<Region>.from(json.decode(str).map((x) => Region.fromJson(x)));

String regionToJson(List<Region> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Region {
  int id;
  String name;
  List<District> districts;

  Region({
    required this.id,
    required this.name,
    required this.districts,
  });

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        id: json["id"],
        name: json["name"],
        districts: List<District>.from(json["districts"].map((x) => District.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "districts": List<dynamic>.from(districts.map((x) => x.toJson())),
      };
}

class District {
  int id;
  String name;

  District({
    required this.id,
    required this.name,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  @override
  bool operator ==(Object other) => identical(this, other) || other is District && runtimeType == other.runtimeType && id == other.id && name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
