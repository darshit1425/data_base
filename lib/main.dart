import 'package:data_base/screen/student_data/view/stud_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(

          name: '/',
          page: () => Student_Screen(),


        ),
      ],
    ),
  );
}
