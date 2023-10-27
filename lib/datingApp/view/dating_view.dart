import 'package:flutter/material.dart';
import 'package:flutter_ui_design/core/utils/font_family.dart';
import 'package:flutter_ui_design/datingApp/controller/dating_conroller.dart';
import 'package:get/get.dart';

class DatingView extends GetView<DatingController> {
  const DatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Super Liked Me',style: TextStyle(
              fontSize: 22.5,
              fontFamily: FF.raleway,
              fontWeight: FontWeight.bold,
            ),),
            TextField(
              autocorrect: true,
              decoration: InputDecoration(
                hintText: 'Search Friends'
              ),
            )
          ],
        ),
      ),
    );
  }
}
