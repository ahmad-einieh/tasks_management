import 'package:get/get.dart';

class ShowWidgets extends GetxController {
  @override
  void onReady() {
    super.onReady();
    updateBigContainerTime();
  }

  bool showNumberTow = false;

  bool isBigContainer = true;

  updateShow() {
    showNumberTow = !showNumberTow;
    update();
  }

  updateBigContainer() {
    isBigContainer = !isBigContainer;
    update();
  }

  updateBigContainerTime() async {
    await Future.delayed(const Duration(seconds: 5));
    isBigContainer = false;
    update();
  }
}
