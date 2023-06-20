// import 'package:data_base/screen/AddCate/AddCate.dart';
// import 'package:data_base/screen/read_screen/read_screen.dart';
// import 'package:data_base/screen/student_data/view/stud_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/get_navigation.dart';
//
// void main() {
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       getPages: [
//         GetPage(
//           name: '/',
//           page: () => Student_Screen(),
//         ),
//         GetPage(
//           name: '/read',
//           page: () => Read_Screen(),
//         ),
//         GetPage(
//           name: '/addCate',
//           page: () => AddCateScreen(),
//         ),
//       ],
//     ),
//   );
// }

import 'package:data_base/income_expense/home_screen/view/home_screen.dart';
import 'package:data_base/income_expense/splsh_screen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/',
          page: () => Splash_Screen(),
        ),
        GetPage(
          name: '/Home',
          page: () => HomeScreen(),
        ),
      ],
    ),
  );
}
