import 'package:get/get.dart';
import 'package:delivery/core/Class/CRUD_Class.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
