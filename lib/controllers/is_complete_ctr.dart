import 'package:get/get.dart';

class IsCompleteCTR extends GetxController {
  var isComplete = false.obs;
  void setIsComplete(value) {
    isComplete.value = value;
  }
}
