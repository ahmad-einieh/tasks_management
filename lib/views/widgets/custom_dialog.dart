import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tasks_management/controllers/backend/add_user_to_task.dart';
import 'package:tasks_management/controllers/backend/delete_task.dart';
import 'package:tasks_management/controllers/backend/update_complete_task.dart';

customDialog(String title, String content, String taskId) {
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
          TextField(
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
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            addUserToTask(taskId, _emailController.text);
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
            updateTaskComplete(taskId, true);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green,
            ),
            child: const Text(
              'Complete',
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
            deleteTask(taskId);
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
