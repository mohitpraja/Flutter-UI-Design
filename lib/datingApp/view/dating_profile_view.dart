import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_design/core/widgets/radial_progress.dart';
import 'package:flutter_ui_design/models/dating_model.dart';
import 'package:get/get.dart';

class DatingProfileView extends GetView {
  const DatingProfileView(
    this.datingModel, {
    super.key,
  });
  final DatingModel datingModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      opaqueImage(datingModel.image),
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                  onTap: () => Get.back(),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'My Profile',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              myInfo()
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 5,
                  child: Container(
                    margin: const EdgeInsets.only(top: 60),
                    child: Table(
                      children: [
                        TableRow(children: [
                          infoBigCard(
                              count: datingModel.newMatches.toString(),
                              icon: Icons.star,
                              text: 'New Matches'),
                          infoBigCard(
                              count: datingModel.unMatched.toString(),
                              icon: Icons.emoji_emotions,
                              text: 'Unmatched'),
                        ]),
                        TableRow(children: [
                          infoBigCard(
                              count: datingModel.allMatches.toString(),
                              icon: Icons.featured_play_list,
                              text: 'All Matches'),
                          infoBigCard(
                              count: datingModel.reMatches.toString(),
                              icon: Icons.cached,
                              text: 'Rematches'),
                        ]),
                        TableRow(children: [
                          infoBigCard(
                              count: datingModel.profileViews.toString(),
                              icon: Icons.remove_red_eye,
                              text: 'Profile Views'),
                          infoBigCard(
                              count: datingModel.superLikes.toString(),
                              icon: CupertinoIcons.heart_circle,
                              text: 'Super Likes'),
                        ])
                      ],
                    ),
                  )),
            ],
          ),
          Positioned(
            top: Get.height * (4 / 9) - 80 / 2,
            child: SizedBox(
              height: 96,
              width:Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: infoCard(count: '${(datingModel.progress! * 100).toStringAsFixed(0)}%', text: 'Progress'),),
                  infoCard(count: '', text: '',showImage: true),
                  Expanded(child: infoCard(count: datingModel.level.toString(), text: 'Level'))
                ],
              )))
        ],
      ),
    );
  }

  infoBigCard({
    required IconData icon,
    required String count,
    required String text,
  }) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Material(
        elevation: 10,
        shadowColor: Colors.black54,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            top: 6,
            bottom: 20,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  icon,
                  color: Colors.blue,
                ),
              ),
              Text(
                count,
                style: const TextStyle(fontSize: 20),
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }

  infoCard({required String count, required String text, bool? showImage}) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 80,
      width: 80,
      child: Material(
        elevation: 10,
        shadowColor: Colors.black54,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: showImage == true
              ? const Icon(Icons.auto_graph,color: Colors.deepOrange,size: 25,)
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      count,
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(text),
                  ],
                ),
        ),
      ),
    );
  }

  opaqueImage(image) {
    return Stack(
      children: [
        Image.asset(
          image,
          fit: BoxFit.fill,
          height: double.maxFinite,
          width: double.maxFinite,
        ),
        Container(
          color: Colors.deepOrange.withOpacity(0.75),
        )
      ],
    );
  }

  myInfo() {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: RadialProgress(
            width: 3,
            goalCompleted: datingModel.progress!,
            child: ClipOval(
              child: Image.asset(
                datingModel.image!,
                width: 100,
                height: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          datingModel.name!,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_pin,
              color: Colors.white,
              size: 14,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(datingModel.address!,
                style: const TextStyle(color: Colors.white, fontSize: 16)),
          ],
        )
      ],
    ));
  }
}
