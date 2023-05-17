import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:tasks_management/controllers/all_tasks_ctr.dart';

import '../../controllers/backend/delete_task.dart';
import '../../controllers/backend/update_complete_task.dart';
import '../../controllers/is_complete_ctr.dart';
import '../styles.dart';
import '../widgets/bottom_sheet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
                ? Expanded(child: Image.asset('assets/no.png'))
                : Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: ListView(
                        children: allTaskCTRl.allTask
                            .where((p0) =>
                                p0.isComplete ==
                                isCompleteCTRl.isComplete.value)
                            .map(
                              (e) => Slidable(
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
                                      backgroundColor: const Color(0xFFFE4A49),
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
                                        DateTime.now().timeZoneOffset;
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
                                child: SizedBox(
                                  height: height * 0.1,
                                  width: double.infinity,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    elevation: 2.0,
                                    child: Container(
                                      padding: const EdgeInsets.all(16.0),
                                      height: height * 0.1,
                                      child: Text(
                                        e.title,
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
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
