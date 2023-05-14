import 'package:http/http.dart' as http;
import 'package:tasks_management/models/task.dart';
import 'package:tasks_management/other/constant.dart';

Future<Task?>? getTask(String taskId) async {
  var url = Uri.parse('$backendLink/task/get_task?taskId=d$taskId');
  var headers = {
    'accept': 'application/json',
  };

  var response = await http.get(url, headers: headers);

  if (response.statusCode == 200) {
    return taskFromJson(response.body);
  } else {
    return null;
  }
}
