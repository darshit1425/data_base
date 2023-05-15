import 'package:data_base/screen/student_data/contoller/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Read_Screen extends StatefulWidget {
  const Read_Screen({Key? key}) : super(key: key);

  @override
  State<Read_Screen> createState() => _Read_ScreenState();
}

class _Read_ScreenState extends State<Read_Screen> {
  @override
  void initState() {
    controller.readTransaction();

    super.initState();
  }

  Student_Controller controller = Get.put(Student_Controller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    controller.filter.value = 2;
                  },
                  child: Text("All Data"),
                ),
                TextButton(
                  onPressed: () {
                    controller.filter.value = 0;
                  },
                  child: Text("Income"),
                ),
                TextButton(
                  onPressed: () {
                    controller.filter.value = 1;
                  },
                  child: Text("Expence"),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return controller.filter == controller.DataList[index]
                      ? Container(
                          color: Colors.blue,
                        )
                      : Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          color: controller.DataList[index]['status'] == 0
                              ? Colors.green.shade100
                              : Colors.red.shade100,
                          child: Row(
                            children: [
                              Text("${controller.DataList[index]}"),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("${controller.DataList[index]}"),
                                ],
                              )
                            ],
                          ),
                        );
                },
                itemCount: controller.DataList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
