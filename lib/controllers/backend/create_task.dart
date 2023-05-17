import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tasks_management/other/constant.dart';

Future<bool> createTask({
  required String title,
  required String description,
  bool isComplete = false,
  required double createdAt,
  required double endAt,
}) async {
  var box = GetStorage();
  var userId = box.read('userId');

  var url = Uri.parse('$backendLink/task/create_task');
  var headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
  };
  var body = jsonEncode({
    'id': 'auto',
    'title': title,
    'description': description,
    'isComplete': false,
    'userId': [userId],
    'created_at': createdAt,
    'end_at': endAt
  });

  var response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
