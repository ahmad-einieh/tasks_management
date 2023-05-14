import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  final String id;
  final String email;

  User({
    required this.id,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
      };
}
