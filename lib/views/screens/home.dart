import 'package:flutter/material.dart';

import '../styles.dart';

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
            const Text(
              "Your Tasks",
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            // SizedBox(height: height * 0.3),
            Divider(
              thickness: 1.0,
              color: Colors.black,
              indent: width * 0.05,
              endIndent: width * 0.05,
            ),
            data.isNotEmpty
                ? SizedBox(
                    height: height * 0.075,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: double.infinity,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Current",
                                style: tab_text_style,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: double.infinity,
                            child: TextButton(
                              onPressed: () {},
                              child: Text("Completed", style: tab_text_style),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: double.infinity,
                            child: TextButton(
                              onPressed: () {},
                              child:
                                  Text("Not Completed", style: tab_text_style),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            data.isEmpty
                ? Expanded(child: Image.asset('assets/no.png'))
                : Expanded(
                    child: ListView(
                      children: data
                          .map((e) => Container(
                              height: 300, color: Colors.amber, child: Text(e)))
                          .toList(),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
