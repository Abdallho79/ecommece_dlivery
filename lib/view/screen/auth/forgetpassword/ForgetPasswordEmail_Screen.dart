import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/controller/auth/forgetpassword/ForgetPasswordEmail_Controller.dart';
import 'package:delivery/core/Class/CoustomButtonLimited_Class.dart';
import 'package:delivery/core/Class/CoustomTextFormFieldd_Class.dart';
import 'package:delivery/core/Class/HandlingDataView_Class.dart';
import 'package:delivery/core/Constant/Color_Const.dart';
import 'package:delivery/core/Functions/ValidInput_Functions.dart';
import 'package:delivery/view/widget/login/maintitle.dart';

class ForgetPasswordEmailScreen extends StatelessWidget {
  const ForgetPasswordEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordEmailController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: GetBuilder<ForgetPasswordEmailController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const CoustomTitle(
                          color: AppColor.grey,
                          text: "Enter Your Email",
                          size: 30,
                          alignmentGeometry: Alignment.center,
                          fontWeight: FontWeight.bold),
                      const SizedBox(
                        height: 30,
                      ),
                      const CoustomTitle(
                          color: AppColor.grey2,
                          text: "Enter Your Email To Send Digit Code",
                          size: 15,
                          alignmentGeometry: Alignment.center,
                          fontWeight: FontWeight.w300),
                      const SizedBox(
                        height: 30,
                      ),
                      CoustomTextFormAuth(
                        hinttext: "Enter Your Email",
                        labeltext: "Email",
                        iconData: Icons.email_outlined,
                        mycontroller: controller.email,
                        valid: (val) {
                          return validInput("email", val!, 5, 50);
                        },
                        isNumber: false,
                      ),
                      CoustomButton(
                        text: "Confrim",
                        paddinglenth: 80,
                        width: 100,
                        onPressed: () {
                          controller.goToForgetPasswordVerifyCode();
                        },
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
