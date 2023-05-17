import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasks_management/models/user.dart';
import 'package:tasks_management/other/constant.dart';

Future<User?>? loginUser(
    {required String email, required String password}) async {
  var url = Uri.parse('$backendLink/auth/login');
  var headers = {
    'accept': 'application/json',
    'Content-Type': 'application/json',
  };
  var body = jsonEncode({
    'email': email,
    'password': password,
  });

  var response = await http.post(url, headers: headers, body: body);

  if (response.statusCode == 200) {
    return userFromJson(response.body);
  } else {
    return null;
  }
}
