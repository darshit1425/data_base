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
    super.initState();
    controller.readTransaction();
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
                    controller.readTransaction();
                  },
                  child: Text("All Data"),
                ),
                TextButton(
                  onPressed: () {
                    controller.filterData(status: 0);
                  },
                  child: Text("Income"),
                ),
                TextButton(
                  onPressed: () {
                    controller.filterData(status: 1);
                  },
                  child: Text("Expence"),
                ),
              ],
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      color: controller.DataList[index]['status'] == 0
                          ? Colors.green.shade100
                          : Colors.red.shade100,
                      child: Row(
                        children: [
                          Text("${controller.DataList[index]['id']}"),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("${controller.DataList[index]['category']}"),
                              Text("${controller.DataList[index]['amount']}"),
                            ],
                          ),
                          IconButton(onPressed: () {

                          }, icon: Icon(Icons.edit)),
                          IconButton(
                            onPressed: () {
                              controller.deleteData(id: controller.DataList[index]['id']);
                              controller.readTransaction();
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: controller.DataList.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
