import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:tasks_management/models/task.dart';
import 'package:tasks_management/other/constant.dart';

getAllTasks() async {
  var box = GetStorage();
  var userId = box.read('userId');
  if (userId == null) {
    return null;
  }
  var url = Uri.parse('$backendLink/task/get_all_tasks?userId=$userId');
  var headers = {
    'accept': 'application/json',
  };

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    List<Task> tasks = allTaskFromJson(response.body);

    return tasks;
  } else {
    return null;
  }
}
