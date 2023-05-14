import 'package:http/http.dart' as http;
import 'package:tasks_management/other/constant.dart';

updateTaskComplete(String taskId, bool isComplete) async {
  String url =
      '$backendLink/task/update_task_complete?taskId=$taskId&isComplete=$isComplete';

  Map<String, String> headers = {'accept': 'application/json'};

  http.Response response = await http.put(Uri.parse(url), headers: headers);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
