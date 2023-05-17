import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasks_management/models/user.dart';
import 'package:tasks_management/views/screens/home.dart';

import '../../controllers/backend/login_user.dart';
import 'register.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              'Login',
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: height * 0.075),
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
                  final box = GetStorage();

                  if (emailController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) {
                    User? user;
                    try {
                      user = await loginUser(
                          email: emailController.text,
                          password: passwordController.text);
                    } catch (_) {
                      Get.snackbar("Error", "Can not connect to server");
                      return;
                    }
                    if (user != null) {
                      box.write("user", user);
                      box.write("userId", user.id);
                    } else {
                      Get.snackbar("Error",
                          "Invalid email or password or can not connect to server");
                      return;
                    }
                  } else {
                    Get.snackbar("Error", "Please fill all the fields");
                    return;
                  }
                  Get.offAll(() => const Home());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: const Text("LogIn"),
              ),
            ),
            SizedBox(height: height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    Get.offAll(() => Register());
                  },
                  child: const Text("Register"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
