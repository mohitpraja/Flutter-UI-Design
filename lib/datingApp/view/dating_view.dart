import 'package:flutter/material.dart';
import 'package:flutter_ui_design/core/utils/font_family.dart';
import 'package:flutter_ui_design/datingApp/controller/dating_conroller.dart';
import 'package:flutter_ui_design/datingApp/view/dating_profile_view.dart';
import 'package:get/get.dart';

class DatingView extends GetView<DatingController> {
  const DatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'SELECT',
                style: TextStyle(
                    letterSpacing: 1.5,
                    fontSize: 13,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Super Liked Me',
                style: TextStyle(
                  fontSize: 22.5,
                  fontFamily: FF.raleway,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                elevation: 8.0,
                shadowColor: Colors.black54,
                borderRadius: BorderRadius.circular(5),
                child: TextField(
                  autocorrect: true,
                  onChanged: (value) {
                    controller.runFilter(value);
                  },
                  decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      hintText: 'Search Friends',
                      border: InputBorder.none),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text('Super Likes'),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.deepOrange, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Obx(() => Text(
                            '${controller.personList.length}',
                            style: const TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
              ),
              Obx(() => Flexible(
                    child: controller.personList.isEmpty
                        ? const Center(
                            child: Text(
                              'No Data Found',
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            itemCount: controller.personList.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Get.to(() => DatingProfileView(
                                    controller.personList[index])),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Material(
                                    elevation: 8.0,
                                    shadowColor: Colors.black54,
                                    borderRadius: BorderRadius.circular(5),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 60,
                                            height: 60,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                      controller
                                                          .personList[index]
                                                          .image!,
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(controller
                                                    .personList[index].name!),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.location_on_sharp,
                                                      size: 12,
                                                      color: Colors.grey,
                                                    ),
                                                    Text(controller
                                                        .personList[index]
                                                        .address!),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                controller.personList[index]
                                                        .isOnline!
                                                    ? 'ONLINE'
                                                    : 'OFFLINE',
                                                style: TextStyle(
                                                    letterSpacing: 1.5,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    color: controller
                                                            .personList[index]
                                                            .isOnline!
                                                        ? Colors.green
                                                        : Colors.red),
                                              ),
                                              Icon(
                                                controller.personList[index]
                                                        .isSaved!
                                                    ? Icons.star
                                                    : Icons.star_outline,
                                                color: controller
                                                        .personList[index]
                                                        .isSaved!
                                                    ? Colors.blue
                                                    : Colors.grey,
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
