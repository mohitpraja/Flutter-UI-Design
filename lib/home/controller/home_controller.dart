import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_ui_design/models/all_app_list.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  RxList<AllAppList> allAppList = <AllAppList>[].obs;


  @override
  Future<void> onInit() async {
     var allAppJson=await rootBundle.loadString("assets/json/all_app.json");
    allAppList.value= allAppDataResponseFromJson(allAppJson);
    super.onInit();
  }

  List<AllAppList> allAppDataResponseFromJson(String str) => List<AllAppList>.from(json.decode(str).map((x) => AllAppList.fromJson(x)));
  
}