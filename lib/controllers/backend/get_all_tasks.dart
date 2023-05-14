import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tasks_management/models/task.dart';
import 'package:tasks_management/other/constant.dart';

getAllTasks(String userId) async {
  var url = Uri.parse('$backendLink/task/get_all_tasks?userId=$userId');
  var headers = {
    'accept': 'application/json',
  };

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    var tasks = [];

    for (var item in data) {
      tasks.add(taskFromJson(item));
    }

    return tasks;
  } else {
    return null;
  }
}
