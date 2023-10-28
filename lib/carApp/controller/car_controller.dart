import 'package:flutter/material.dart';
import 'package:flutter_ui_design/models/car_model.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  RxInt currCourselIndex = 0.obs;
  RxBool isExpanded = false.obs;

  List offerDetails = [
    {'icon': Icons.wifi, 'name': 'Wi-Fi'},
    {'icon': Icons.usb, 'name': 'USB Port'},
    {'icon': Icons.power_settings_new, 'name': 'Keyless'},
    {'icon': Icons.wifi, 'name': 'Wi-Fi'},
  ];
  List features = [
    {'icon': Icons.bluetooth, 'name': 'Bluetooth'},
    {'icon': Icons.chair, 'name': '4 Seats'},
    {'icon': Icons.location_pin, 'name': '6.4 L'},
    {'icon': Icons.bluetooth, 'name': 'Bluetooth'},
  ];
  List specifications = [
    {
      'icon': Icons.speed,
      'name': 'Milage(upto)',
      'value': '14.2 kmpl'
    },
    {
      'icon': Icons.power,
      'name': 'Engine(upto)',
      'value': '3996 cc'
    },
    {
      'icon': Icons.wifi_tethering_error_rounded_rounded,
      'name': 'BHP',
      'value': '700'
    },
    {
      'icon': Icons.speed,
      'name': 'Milage(upto)',
      'value': '14.2 kmpl'
    },
  ];

  CarModel carModel = CarModel(carImages: [
    'assets/car/car_6.png',
    'assets/car/car_2.png',
    'assets/car/car_3.png',
    'assets/car/car_4.png',
    'assets/car/car_5.png',
    'assets/car/car_1.png',
  ], name: 'Chevrolet', speed: '1200');
}
