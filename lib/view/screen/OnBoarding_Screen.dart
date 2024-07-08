import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/controller/OnBoarding_Controller.dart';
import 'package:delivery/core/Constant/Color_Const.dart';
import 'package:delivery/view/widget/onBoarding/button.dart';
import 'package:delivery/view/widget/onBoarding/dots.dart';
import 'package:delivery/view/widget/onBoarding/slider.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingCOntroller());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: Column(children: [
        const Expanded(flex: 4, child: OnBoardingSlider()),
        Expanded(
            flex: 1,
            child: Column(
              children: [
                GetBuilder<OnBoardingCOntroller>(
                    builder: (controller) => const OnBoardingDots()),
                const OnBoardingButton()
              ],
            ))
      ]),
    );
  }
}
