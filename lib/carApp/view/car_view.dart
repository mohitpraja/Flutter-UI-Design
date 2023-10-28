import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_design/carApp/controller/car_controller.dart';
import 'package:flutter_ui_design/core/utils/colors.dart';
import 'package:flutter_ui_design/core/utils/font_family.dart';
import 'package:get/get.dart';

class CarView extends GetView<CarController> {
  const CarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        iconTheme: const IconThemeData(color: white),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(CupertinoIcons.heart),
          )
        ],
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(
                                fontSize: 25,
                                fontFamily: FF.raleway,
                                letterSpacing: 1.3),
                            children: [
                          TextSpan(text: controller.carModel.name),
                          const TextSpan(text: '\n'),
                          const TextSpan(
                              text: 'Corvette',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, height: 1.3))
                        ])),
                    const SizedBox(
                      height: 10,
                    ),
                    RichText(
                        text: TextSpan(
                            style: const TextStyle(color: grey),
                            children: [
                          TextSpan(text: controller.carModel.speed),
                          TextSpan(
                              text: ' / day',
                              style: TextStyle(color: Colors.grey.shade100))
                        ])),
                    slider()
                  ],
                ),
              )),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Obx(() => GestureDetector(
                  onTap: () {
                    controller.isExpanded.toggle();
                  },
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity! < 0.0) {
                      controller.isExpanded.value = true;
                    } else if (details.primaryVelocity! > 0.0) {
                      controller.isExpanded.value = false;
                    } else {
                      return;
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: controller.isExpanded.value
                        ? Get.height * 0.87
                        : Get.height * 0.4,
                    width: Get.width,
                    decoration:  const BoxDecoration(
                        color: Color(0xfff1f1f1),
                        borderRadius: BorderRadiusDirectional.only(
                            topStart: Radius.circular(25),
                            topEnd: Radius.circular(25))),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 30,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 25),
                            height: 3,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: const Color(0xffd9dbdb)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                            child: ListView(
                          children: [
                            offDetails(),
                            const SizedBox(height: 15,),
                            specifications(),
                            const SizedBox(height: 15,),
                            features()
                            ],
                        ))
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }

  slider() {
    return Obx(() => Column(
          children: [
            CarouselSlider(
                items: controller.carModel.carImages.map((e) {
                  return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: FittedBox(
                          child: Image.asset(
                        e,
                      )));
                }).toList(),
                options: CarouselOptions(
                    onPageChanged: (index, reason) =>
                        controller.currCourselIndex.value = index,
                    enlargeCenterPage: true,
                    height: 250,
                    viewportFraction: 1.3)),
            Row(
              children: List.generate(
                  controller.carModel.carImages.length,
                  (index) => Container(
                        width: 15,
                        margin: const EdgeInsets.all(0.3),
                        height: 2,
                        color: controller.currCourselIndex.value == index
                            ? Colors.grey[100]
                            : Colors.grey[600],
                      )),
            )
          ],
        ));
  }

  offDetails() {
    return Container(
       margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Off Details',style: TextStyle(fontSize: 16,fontFamily: FF.raleway,fontWeight: FontWeight.w800),),
          const SizedBox(height: 10,),
          SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.offerDetails.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    width: 100,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(controller.offerDetails[index]['icon'],size: 30,),
                      const SizedBox(height: 10,),
                      Text(controller.offerDetails[index]['name'])
                    
                    ],));
                },
              ))
        ],
      ),
    );
  }
  
  specifications() {
     return Container(
       margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Specifications',style: TextStyle(fontSize: 16,fontFamily: FF.raleway,fontWeight: FontWeight.w800),),
          const SizedBox(height: 10,),
          SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.specifications.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.all(5),
                    width: 100,
                    decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(controller.specifications[index]['icon'],size: 30,),
                      const SizedBox(height: 10,),
                      Text(controller.specifications[index]['name'],style: const TextStyle(fontSize: 11,color: grey),),
                      const SizedBox(height: 2,),
                      Text(controller.specifications[index]['value'])
                    
                    ],));
                },
              ))
        ],
      ),
    );
  }
  
  features() {
    return Container(
       margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Features',style: TextStyle(fontSize: 16,fontFamily: FF.raleway,fontWeight: FontWeight.w800),),
          const SizedBox(height: 10,),
          SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.features.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(15),
                    width: 100,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(5)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(controller.features[index]['icon'],size: 30,),
                      const SizedBox(height: 10,),
                      Text(controller.features[index]['name'])
                    
                    ],));
                },
              ))
        ],
      ),
    );
  }
  
}
