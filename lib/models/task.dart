import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

List<Task> allTaskFromJson(String str) =>
    List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String allTaskToJson(List<Task> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  final String? id;
  final String? title;
  final String? description;
  final bool isComplete;
  final List<String?> userId;
  final num createdAt;
  final num endAt;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.isComplete,
    required this.userId,
    required this.createdAt,
    required this.endAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        isComplete: json["isComplete"],
        userId: List<String>.from(json["userId"].map((x) => x)),
        createdAt: json["created_at"],
        endAt: json["end_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "isComplete": isComplete,
        "userId": List<dynamic>.from(userId.map((x) => x)),
        "created_at": createdAt,
        "end_at": endAt,
      };
}
