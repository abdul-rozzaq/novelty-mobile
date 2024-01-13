class Token {
  String key;
  String user;
  DateTime created;

  Token({
    required this.key,
    required this.user,
    required this.created,
  });

  factory Token.fromJson(Map<String, dynamic> json) => Token(
        key: json["key"],
        user: json["user"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "user": user,
        "created": created.toIso8601String(),
      };
}
