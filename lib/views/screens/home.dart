import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tasks_management/controllers/all_tasks_ctr.dart';

import '../../controllers/backend/delete_task.dart';
import '../../controllers/backend/update_complete_task.dart';
import '../../controllers/is_complete_ctr.dart';
import '../styles.dart';
import '../widgets/bottom_sheet.dart';
import '../widgets/custom_dialog.dart';

class Home extends StatelessWidget {
  Home({super.key});
  List<Color> beautifulColors = [
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.teal,
    Colors.cyan,
    Colors.indigo,
    Colors.amber,
    Colors.brown,
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    AllTaskCTR allTaskCTRl = Get.put(AllTaskCTR());
    IsCompleteCTR isCompleteCTRl = Get.put(IsCompleteCTR());

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(height: height * 0.05),
          const Text(
            "Your Tasks",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          Divider(
            thickness: 1.0,
            color: Colors.black,
            indent: width * 0.05,
            endIndent: width * 0.05,
          ),
          Obx(
            () => allTaskCTRl.allTask.isNotEmpty
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
                              onPressed: () {
                                isCompleteCTRl.setIsComplete(false);
                              },
                              child: Text("Not Completed", style: tabTextStyle),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: double.infinity,
                            child: TextButton(
                              onPressed: () {
                                isCompleteCTRl.setIsComplete(true);
                              },
                              child: Text("Completed", style: tabTextStyle),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
          SizedBox(height: height * 0.025),
          Obx(
            () => allTaskCTRl.allTask.isEmpty
                ? Expanded(
                    child: InkWell(
                        onTap: () => allTaskCTRl.setAllTask(),
                        child: Image.asset('assets/no.png')))
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: ListView(
                        children: allTaskCTRl.allTask
                            .where((p0) =>
                                p0.isComplete ==
                                isCompleteCTRl.isComplete.value)
                            .map(
                              (e) => InkWell(
                                onTap: () {
                                  customDialog(
                                      e.title,
                                      e.description,
                                      e.id,
                                      isCompleteCTRl.isComplete.value,
                                      allTaskCTRl);
                                },
                                child: Slidable(
                                  startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    dismissible:
                                        DismissiblePane(onDismissed: () {}),
                                    children: [
                                      SlidableAction(
                                        onPressed: (s) {
                                          deleteTask(e.id);
                                          allTaskCTRl.setAllTask();
                                        },
                                        backgroundColor:
                                            const Color(0xFFFE4A49),
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ],
                                  ),
                                  endActionPane: ActionPane(
                                    motion: const DrawerMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: (s) {
                                          if (isCompleteCTRl.isComplete.value) {
                                            updateTaskComplete(e.id, false);
                                          } else {
                                            updateTaskComplete(e.id, true);
                                          }
                                          allTaskCTRl.setAllTask();
                                        },
                                        backgroundColor:
                                            isCompleteCTRl.isComplete.value
                                                ? const Color(0xFF21B7CA)
                                                : const Color(0xFF7BC043),
                                        foregroundColor: Colors.white,
                                        icon: Icons.done,
                                        label: isCompleteCTRl.isComplete.value
                                            ? 'Not Complete'
                                            : 'Complete',
                                      ),
                                    ],
                                  ),
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    elevation: 2.0,
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      height: height * 0.16,
                                      color: beautifulColors[
                                          allTaskCTRl.allTask.indexOf(e) %
                                              beautifulColors.length],
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e.title,
                                            style: const TextStyle(
                                              fontSize: 24.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // const SizedBox(height: 8.0),
                                          Row(
                                            children: [
                                              Text(
                                                DateFormat('yyyy-MM-dd').format(
                                                  DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                    e.endAt.toInt(),
                                                  ),
                                                ),
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                              ),
                                              SizedBox(width: width * 0.5),
                                              Text(
                                                "${DateTime.fromMillisecondsSinceEpoch(
                                                  e.endAt.toInt(),
                                                ).difference(DateTime.now()).inDays} days",
                                                style: const TextStyle(
                                                    fontSize: 16.0),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (s) {
                return ButtomSheet(
                  width: width,
                  allTaskCTRl: allTaskCTRl,
                );
              }),
          child: const Icon(Icons.add)),
    );
  }
}
