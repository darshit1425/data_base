import 'package:data_base/utils/db_helper.dart';
import 'package:get/get.dart';

class Student_Controller extends GetxController {
  RxList<Map> DataList = <Map>[].obs;


  RxInt filter = 2.obs;
  RxString ChangePayment = "Offline".obs;

  Future<void> readTransaction() async {
    DataList.value = await DBHelper.dbHelper.ReadData();
  }

  void deleteData({required id}) {
    DBHelper.dbHelper.deleteData(id: id);
  }

  Future<void> filterData({required status}) async {
    DataList.value = await DBHelper.dbHelper.FilterData(status: status);
  }
}
