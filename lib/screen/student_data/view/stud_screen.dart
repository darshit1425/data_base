import 'package:data_base/screen/student_data/contoller/student_controller.dart';
import 'package:data_base/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Student_Screen extends StatefulWidget {
  const Student_Screen({Key? key}) : super(key: key);

  @override
  State<Student_Screen> createState() => _Student_ScreenState();
}

class _Student_ScreenState extends State<Student_Screen> {
  Student_Controller student_controller = Get.put(Student_Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: student_controller.DataList.length,
                itemBuilder: (context, index) => Text("${student_controller.DataList[index]['notes']}"),
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () async {

                  DBHelper.dbHelper.insertData(
                    category: "Food",
                    amount: "20,000",
                    notes: "Dinner",
                    paytypes: "GPay",
                    status: 1,
                  );
                  student_controller.DataList.value = await DBHelper.dbHelper.ReadData();
                },
                child: Text(
                  "Show Data",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
