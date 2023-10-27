import 'package:flutter_ui_design/datingApp/controller/dating_conroller.dart';
import 'package:get/get.dart';

class DatingBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DatingController());
  }

}