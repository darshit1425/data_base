import 'package:data_base/abc/abc_helper/abc_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class AddControllor extends GetxController {

  TextEditingController id = TextEditingController();
  TextEditingController PName = TextEditingController();
  TextEditingController Pprice = TextEditingController();
  TextEditingController Ptype = TextEditingController();
  TextEditingController Pdate = TextEditingController();
  TextEditingController Ptime = TextEditingController();
  TextEditingController Pstastus = TextEditingController();


  RxList<Map> ProductList = <Map>[].obs;

  Future<void> ReadData() async {
    dbHelper dbhelper = dbHelper();

    ProductList.value = await dbhelper.ReadData();
  }
}