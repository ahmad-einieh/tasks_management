import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasks_management/other/constant.dart';

Future<bool> createUser(
    {required String name,
    required String email,
    required String password,
    required double createdAt}) async {
  var url = Uri.parse('$backendLink/user/create_user');
  var headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
  };
  var body = jsonEncode({
    'id': 'auto',
    'name': name,
    'email': email,
    'password': password,
    'created_at': createdAt,
  });

  var response = await http.post(url, headers: headers, body: body);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
