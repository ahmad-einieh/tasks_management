import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
                onPressed: () {},
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
                    Get.offAll(() => const Login());
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
