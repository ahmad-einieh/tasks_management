import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:tasks_management/controllers/date_selector_ctr.dart';

import '../../controllers/all_tasks_ctr.dart';
import '../../controllers/backend/create_task.dart';

class ButtomSheet extends StatelessWidget {
  ButtomSheet({Key? key, required this.width, required this.allTaskCTRl})
      : super(key: key);

  final double width;
  final AllTaskCTR allTaskCTRl;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final DateSelectorCTR dateSelectorCTR = Get.put(DateSelectorCTR());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        child: GetBuilder<DateSelectorCTR>(
          builder: (dateValue) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 32),
                  SizedBox(
                    width: width * 0.95,
                    child: TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Enter Task Title",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: width * 0.95,
                    child: TextField(
                      controller: descriptionController,
                      decoration: InputDecoration(
                        hintText: "Enter Task Description",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 20.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 111,
                    child: ScrollDatePicker(
                      options: const DatePickerOptions(isLoop: false),
                      selectedDate: DateTime.fromMillisecondsSinceEpoch(
                          dateValue.selectedDate.toInt()),
                      minimumDate: DateTime(DateTime.now().year - 1),
                      maximumDate: DateTime(2222),
                      locale: const Locale('en'),
                      onDateTimeChanged: (DateTime value) {
                        dateValue.setSelectedDate(
                            value.millisecondsSinceEpoch.toDouble());
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 48,
                    width: width * 0.66,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool isCreated = await createTask(
                          title: titleController.text,
                          description: descriptionController.text,
                          createdAt:
                              DateTime.now().millisecondsSinceEpoch.toDouble(),
                          endAt: dateValue.selectedDate,
                        );
                        if (isCreated) {
                          allTaskCTRl.setAllTask();
                          Get.back();
                        } else {
                          Get.snackbar("Error", "Something went wrong");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text("Add Task"),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  static void show(BuildContext context, double width, AllTaskCTR allTaskCTRl) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => ButtomSheet(width: width, allTaskCTRl: allTaskCTRl),
    );
  }
}
