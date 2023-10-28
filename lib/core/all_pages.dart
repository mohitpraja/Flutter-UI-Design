import 'package:flutter_ui_design/carApp/binding/car_binding.dart';
import 'package:flutter_ui_design/carApp/view/car_view.dart';
import 'package:flutter_ui_design/core/routes.dart';
import 'package:flutter_ui_design/datingApp/binding/dating_binding.dart';
import 'package:flutter_ui_design/datingApp/view/dating_view.dart';
import 'package:flutter_ui_design/home/binding/home_binding.dart';
import 'package:flutter_ui_design/home/view/home_view.dart';
import 'package:get/get.dart';

List<GetPage> allPages = <GetPage>[
  GetPage(name: Routes.home, page: () => const HomeView(),binding: HomeBinding()),
  GetPage(name: Routes.datingApp, page: () => const DatingView(),binding: DatingBinding()),
  GetPage(name: Routes.carApp, page: () => const CarView(),binding: CarBinding()),
];
