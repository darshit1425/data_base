import 'package:data_base/utils/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCateScreen extends StatefulWidget {
  const AddCateScreen({Key? key}) : super(key: key);

  @override
  State<AddCateScreen> createState() => _AddCateScreenState();
}

class _AddCateScreenState extends State<AddCateScreen> {
  TextEditingController txtcate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: txtcate,
                decoration: InputDecoration(
                  hintText: "category",
                  prefixIcon: Icon(Icons.category_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  DBHelper.dbHelper.insertCate(
                    cate: txtcate.text,
                  );

                  Get.back();
                },
                child: Text(
                  "Submit",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
