import 'package:get/get.dart';

import 'backend/get_all_tasks.dart';

class AllTaskCTR extends GetxController {
  @override
  void onInit() {
    super.onInit();
    setAllTask();
  }

  var allTask = [].obs;

  Future<void> setAllTask() async {
    var temp = allTask.value;
    allTask.value = [];
    try {
      allTask.value = await getAllTasks();
    } catch (e) {
      allTask.value = temp;
    }
    print(allTask.value.length);
  }
}
