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
  Student_Controller controller = Get.put(Student_Controller());
  TextEditingController txtCategory = TextEditingController();
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtNotes = TextEditingController();
  TextEditingController txtPaytypes = TextEditingController();
  TextEditingController txtStatus = TextEditingController();
  TextEditingController txtDate = TextEditingController(
      text:
          "${DateTime.now().day}/ ${DateTime.now().month}/ ${DateTime.now().year}");
  TextEditingController txtTime = TextEditingController(
      text: "${TimeOfDay.now().hour}:${TimeOfDay.now().minute}");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Income Expense"),
          leading: Icon(Icons.save_as_sharp),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: txtCategory,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    label: Text(
                      "category",
                      style: TextStyle(color: Colors.blueAccent.shade700),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtAmount,
                  onChanged: (value) {},
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text(
                      "Amount",
                      style: TextStyle(color: Colors.blueAccent.shade700),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtNotes,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    label: Text(
                      "Notes",
                      style: TextStyle(color: Colors.blueAccent.shade700),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // TextField(
                //   controller: txtPaytypes,
                //   onChanged: (value) {},
                //   decoration: InputDecoration(
                //     label: Text(
                //       "Payments",
                //       style: TextStyle(color: Colors.blueAccent.shade700),
                //     ),
                //     border: OutlineInputBorder(),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(
                //         width: 2,
                //         color: Colors.blueAccent.shade700,
                //       ),
                //     ),
                //   ),
                // ),
                Obx(
                  () => DropdownButton(
                    isExpanded: true,
                    value: controller.ChangePayment.value,
                    items: [
                      DropdownMenuItem(
                        child: Text("Offline"),
                        value: "Offline",
                      ),
                      DropdownMenuItem(
                        child: Text("Online"),
                        value: "Online",
                      ),
                    ],
                    onChanged: (value) {
                      controller.ChangePayment.value = value!;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtStatus,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    label: Text(
                      "Status",
                      style: TextStyle(color: Colors.blueAccent.shade700),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtTime,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    label: Text(
                      "Time",
                      style: TextStyle(color: Colors.blueAccent.shade700),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtDate,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    label: Text(
                      "Date",
                      style: TextStyle(color: Colors.blueAccent.shade700),
                    ),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.blueAccent.shade700,
                      ),
                    ),
                  ),
                ),
                // Obx(
                //   () => ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: student_controller.DataList.length,
                //     itemBuilder: (context, index) {
                //       return ListTile(
                //         title: Text(
                //             "${student_controller.DataList[index]['notes']}"),
                //         trailing: IconButton(
                //           onPressed: () {
                //
                //           },
                //           icon: Icon(Icons.delete),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () async {
                          print("${txtTime.text}   ${txtDate.text}");
                          DBHelper.dbHelper.insertData(
                            category: txtCategory.text,
                            amount: txtAmount.text,
                            notes: txtNotes.text,
                            paytypes: controller.ChangePayment.value,
                            status: txtStatus.text,
                            date: txtDate.text,
                            time: txtTime.text,
                          );

                          // student_controller.DataList.value =
                          //     await DBHelper.dbHelper.ReadData();
                        },
                        child: const Text(
                          "Insert",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: () async {
                          print("${txtTime.text}   ${txtDate.text}");
                          // DBHelper.dbHelper.insertData(
                          //   category: txtCategory.text,
                          //   amount: txtAmount.text,
                          //   notes: txtNotes.text,
                          //   paytypes: txtPaytypes.text,
                          //   status: txtStatus.text,
                          //   date: txtDate.text,
                          //   time: txtTime.text,
                          // );

                          controller.DataList.value =
                              await DBHelper.dbHelper.ReadData();
                        },
                        child: const Text(
                          "Read Data",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed('/read');
                  },
                  child: Text("Next"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
