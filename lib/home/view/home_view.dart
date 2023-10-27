import 'package:flutter/material.dart';
import 'package:flutter_ui_design/core/routes.dart';
import 'package:flutter_ui_design/home/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Designs'),
      ),
      body: Column(
        children: [
          Expanded(
              child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1.6),
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Get.toNamed(Routes.datingApp),
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
                  alignment: AlignmentDirectional.bottomStart,
                  decoration: BoxDecoration(
                    color: Colors.primaries[index],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Stack(
                    children: [
                      Center(
                          child: Image.asset('assets/images/mail.png',
                              fit: BoxFit.cover, alignment: Alignment.center)),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            width: Get.width*0.945,
                              decoration: BoxDecoration(
                                color: Colors.black54.withOpacity(0.5),
                                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10),),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Dating App',style: TextStyle(color: Colors.white,letterSpacing: 0.5),),
                              ))),
                    ],
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
