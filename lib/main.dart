import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasks_management/views/screens/home.dart';
import 'package:tasks_management/views/screens/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  // GetStorage().erase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    var box = GetStorage();
    var userId = box.read("userId");

    return GetMaterialApp(
      home: userId != null ? Home() : Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
