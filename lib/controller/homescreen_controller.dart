import 'package:delivery/view/screen/orders/accepte_Screen.dart';
import 'package:delivery/view/screen/orders/bending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;

  List<Widget> listPage = [
    const BendingOrders(),
    const AccepteOrders(),
    // SettingsScreen(),
  ];

  List titlebottomappbar = [
    {"icon": Icons.home, "name": "binding"},
    {"icon": Icons.card_travel, "name": "Accepted"},
    // {"icon": Icons.settings, "name": "Seetongs"},
  ];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }
}
