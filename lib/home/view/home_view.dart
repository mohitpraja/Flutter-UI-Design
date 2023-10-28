import 'package:flutter/material.dart';
import 'package:flutter_ui_design/core/utils/colors.dart';
import 'package:flutter_ui_design/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Designs'),
        actions: [IconButton(onPressed: () {
          
        }, icon: const Icon(Icons.texture_sharp))],
      ),
      body: Column(
        children: [
          Expanded(
              child: Obx(() => GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, childAspectRatio: 1.6),
                          itemCount: controller.allAppList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => Get.toNamed(controller.allAppList[index].route!),
                              child: Container(
                                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                                alignment: AlignmentDirectional.bottomStart,
                  decoration: BoxDecoration(
                    color: const Color(0xfff1f1f1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Center(
                          child: Image.asset(controller.allAppList[index].image!,
                              fit: BoxFit.cover, alignment: Alignment.center)),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            width: Get.width*0.945,
                              decoration: BoxDecoration(
                                color: lightBlack.withOpacity(0.5),
                                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10),),
                              ),
                              child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(controller.allAppList[index].name.toString(),style: const TextStyle(color: white,letterSpacing: 0.5),),
                              ))),
                    ],
                  ),
                ),
              );
            },
          )))
        ],
      ),
    );
  }
}
