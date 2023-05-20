import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_management/controllers/backend/add_user_to_task.dart';
import 'package:tasks_management/controllers/backend/delete_task.dart';
import 'package:tasks_management/controllers/backend/update_complete_task.dart';

import '../../controllers/all_tasks_ctr.dart';

customDialog(String title, String content, String taskId, bool isComplete,
    AllTaskCTR allTaskCTRl) {
  TextEditingController _emailController = TextEditingController();
  Get.dialog(
    AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.blue,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            content,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 16),
          !isComplete
              ? TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Enter new user email',
                    labelStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 12,
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            bool isAdded = await addUserToTask(taskId, _emailController.text);
            if (isAdded) {
              Get.snackbar(
                'Done',
                'User added successfully',
                backgroundColor: Colors.green,
                colorText: Colors.white,
              );
              await Future.delayed(const Duration(seconds: 4));
              Get.back();
            } else {
              Get.snackbar(
                'Error',
                'User not found',
                backgroundColor: Colors.red,
                colorText: Colors.white,
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.blue,
            ),
            child: const Text(
              'Add User',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            updateTaskComplete(taskId, !isComplete);
            allTaskCTRl.setAllTask();
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: Text(
              isComplete ? 'Not Complete' : 'Complete',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            deleteTask(taskId);
            allTaskCTRl.setAllTask();
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.red,
            ),
            child: const Text(
              'Delete',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            child: const Text(
              'Close',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 24,
      ),
    ),
  );
}
