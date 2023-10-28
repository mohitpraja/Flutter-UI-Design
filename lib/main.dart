import 'package:flutter/material.dart';
import 'package:flutter_ui_design/core/all_pages.dart';
import 'package:flutter_ui_design/core/routes.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter UI Designs',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        useMaterial3: true,
      ),
      initialRoute: Routes.home,
      getPages: allPages,
    );
  }
}
