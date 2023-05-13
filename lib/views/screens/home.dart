import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var data = [
      "Task 1",
      "Task 2",
      "Task 3",
      "Task 4",
      "Task 5",
      "Task 6",
      "Task 7",
      "Task 8",
      "Task 9",
    ];
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: height * 0.05),
            Text(
              "Your Tasks",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: height * 0.3),
            Divider(
              thickness: 1.0,
              color: Colors.black,
              indent: width * 0.05,
              endIndent: width * 0.05,
            ),
            SizedBox(height: height * 0.05),
            data.isEmpty
                ? Image.asset('assets/no.png')
                : Expanded(child: ListView()),
          ],
        ),
      ),
    );
  }
}
