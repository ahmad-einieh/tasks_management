import 'package:get/get.dart';

class DateSelectorCTR extends GetxController {
  double selectedDate = DateTime.now()
      .subtract(const Duration(days: 365))
      .microsecondsSinceEpoch
      .toDouble();

  void setSelectedDate(double date) {
    selectedDate = date;
    update();
  }
}
