import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_ui_design/models/dating_model.dart';
import 'package:get/get.dart';

class DatingController extends GetxController {
  RxList<DatingModel> personList = <DatingModel>[].obs;

  @override
  Future<void> onInit() async {
    var datingJson=await rootBundle.loadString("assets/json/dating_data.json");
    personList.value= datingDataResponseFromJson(datingJson);
    super.onInit();

  }
  List<DatingModel> datingDataResponseFromJson(String str) => List<DatingModel>.from(json.decode(str).map((x) => DatingModel.fromJson(x)));
}
