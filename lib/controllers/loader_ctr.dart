import 'package:get/get.dart';

class LoaderCTR extends GetxController {
  bool isLoading = false;
  updateLoading() {
    isLoading = !isLoading;
    update();
  }

  customUpadateLoading(bool outIsLoading) {
    isLoading = outIsLoading;
    update();
  }
}
