import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/backend/create_user.dart';
import 'login.dart';

class Register extends StatelessWidget {
  Register({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Register',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.075),
            SizedBox(
              width: width * 0.95,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name",
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
            SizedBox(height: height * 0.05),
            SizedBox(
              width: width * 0.95,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
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
            SizedBox(height: height * 0.05),
            SizedBox(
              width: width * 0.95,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",
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
            SizedBox(height: height * 0.05),
            SizedBox(
              height: height * 0.075,
              width: width * 0.66,
              child: ElevatedButton(
                onPressed: () async {
                  if (emailController.text.trim().isEmpty ||
                      passwordController.text.trim().isEmpty ||
                      nameController.text.trim().isEmpty) {
                    Get.snackbar("Error", "Please fill all the fields");
                    return;
                  }
                  bool isCreated = false;
                  try {
                    isCreated = await createUser(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        name: nameController.text.trim(),
                        createdAt:
                            DateTime.now().microsecondsSinceEpoch.toDouble());
                  } catch (_) {
                    Get.snackbar("Error", "User creation failed");
                    return;
                  }
                  if (isCreated) {
                    Get.snackbar("Success", "User created successfully");
                    Get.offAll(() => Login());
                  } else {
                    Get.snackbar("Error", "User creation failed");
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text("Register"),
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Get.offAll(() => Login());
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
