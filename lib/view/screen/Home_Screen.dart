import 'package:delivery/controller/homescreen_controller.dart';
import 'package:delivery/core/Functions/AlertExitApp_Functions.dart';
import 'package:delivery/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text("Orders"),
              ),
              bottomNavigationBar: const CustomBottomAppBarHome(),
              // ignore: deprecated_member_use
              body: WillPopScope(
                  onWillPop: alertExitApp,
                  child: controller.listPage.elementAt(controller.currentpage)),
            ));
  }
}
