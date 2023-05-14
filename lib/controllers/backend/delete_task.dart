import 'package:http/http.dart' as http;

import '../../other/constant.dart';

deleteTask(String taskId) async {
  var url = Uri.parse('$backendLink/task/delete_task?taskId=$taskId');
  var headers = {
    'accept': 'application/json',
  };

  var response = await http.delete(url, headers: headers);

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}
