import 'package:get/get.dart';

class PassWordShowCTR extends GetxController {
  bool isHide;

  PassWordShowCTR({this.isHide = true});

  updateShow() {
    isHide = !isHide;
    update();
  }
}
