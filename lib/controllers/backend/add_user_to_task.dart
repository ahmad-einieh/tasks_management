import 'package:http/http.dart' as http;
import 'package:tasks_management/other/constant.dart';

addUserToTask(String taskId, String userEmail) async {
  var url = Uri.parse(
      '$backendLink/task/add_user_to_task?taskId=$taskId&userEmail=$userEmail');
  var headers = {'accept': 'application/json'};

  var response = await http.put(url, headers: headers);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
