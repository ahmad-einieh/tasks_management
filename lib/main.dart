import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasks_management/views/screens/home.dart';
import 'package:tasks_management/views/screens/login.dart';
import 'package:tasks_management/views/screens/register.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
