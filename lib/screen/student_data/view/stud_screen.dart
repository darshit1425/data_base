import 'package:data_base/utils/db_helper.dart';
import 'package:flutter/material.dart';

class Student_Screen extends StatefulWidget {
  const Student_Screen({Key? key}) : super(key: key);

  @override
  State<Student_Screen> createState() => _Student_ScreenState();
}

class _Student_ScreenState extends State<Student_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            onPressed: () {
              DBHelper dbHelper = DBHelper();
              dbHelper.insertData(
                category: "Food",
                amount: "20,000",
                notes: "Dinner",
                paytypes: "GPay",
                status: 1,
              );
            },
            child: Text(
              "Show Data",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}