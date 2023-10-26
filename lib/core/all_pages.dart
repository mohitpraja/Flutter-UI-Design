import 'package:flutter_ui_design/core/routes.dart';
import 'package:flutter_ui_design/home/binding/home_binding.dart';
import 'package:flutter_ui_design/home/view/home_view.dart';
import 'package:get/get.dart';

List<GetPage> allPages = <GetPage>[
  GetPage(name: Routes.home, page: () => const HomeView(),binding: HomeBinding()),
  ];
