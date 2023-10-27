import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_ui_design/models/dating_model.dart';
import 'package:get/get.dart';

class DatingController extends GetxController {
  RxList<DatingModel> personList = <DatingModel>[].obs;
  RxList<DatingModel> tempList = <DatingModel>[].obs;

  @override
  Future<void> onInit() async {
    var datingJson=await rootBundle.loadString("assets/json/dating_data.json");
    personList.value= datingDataResponseFromJson(datingJson);
    tempList.value= datingDataResponseFromJson(datingJson);
    super.onInit();

  }

  runFilter(name){
    List<DatingModel> result=tempList;
    if(name.isEmpty||name==''){
      personList.value=tempList;
    }else{
      result=tempList.where((p0) => p0.name!.toLowerCase().toUpperCase().contains(name.toLowerCase().toUpperCase())).toList();
    }
    personList.value=result;
  }





  List<DatingModel> datingDataResponseFromJson(String str) => List<DatingModel>.from(json.decode(str).map((x) => DatingModel.fromJson(x)));
}
