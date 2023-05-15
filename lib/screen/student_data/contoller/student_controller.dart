import 'package:data_base/utils/db_helper.dart';
import 'package:get/get.dart';

class Student_Controller extends GetxController {
  RxList<Map> DataList = <Map>[].obs;

  var filter=0;


  Future<void> readTransaction() async {
    DataList.value = await DBHelper.dbHelper.ReadData();
  }
}
