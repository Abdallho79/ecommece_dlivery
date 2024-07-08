import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/controller/auth/forgetpassword/ForgetPasswordChangePassword_Controller.dart';
import 'package:delivery/core/Class/CoustomButtonLimited_Class.dart';
import 'package:delivery/core/Class/CoustomTextFormFieldd_Class.dart';
import 'package:delivery/core/Class/HandlingDataView_Class.dart';
import 'package:delivery/core/Constant/Color_Const.dart';
import 'package:delivery/core/Functions/ValidInput_Functions.dart';
import 'package:delivery/view/widget/login/maintitle.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ChangePasswordController());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: GetBuilder<ChangePasswordController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const CoustomTitle(
                        color: AppColor.grey,
                        text: "Enter New Password",
                        size: 30,
                        alignmentGeometry: Alignment.center,
                        fontWeight: FontWeight.bold),
                    const SizedBox(
                      height: 45,
                    ),
                    // const CoustomTitle(
                    //     color: AppColor.grey2,
                    //     text: "Enter Your Email To Send Digit Code",
                    //     size: 15,
                    //     alignmentGeometry: Alignment.center,
                    //     fontWeight: FontWeight.w300),
                    const SizedBox(
                      height: 30,
                    ),
                    GetBuilder<ChangePasswordController>(
                      builder: (controller) => CoustomTextFormAuth(
                        hinttext: "Enter Your Password",
                        labeltext: "Password",
                        iconData: Icons.lock_outline,
                        mycontroller: controller.password1,
                        valid: (val) {
                          return validInput("password", val!, 5, 50);
                        },
                        isNumber: false,
                        obscureText: controller.dontshowpassword1,
                        onTapIcon: () => controller.showPassWord1(),
                      ),
                    ),
                    GetBuilder<ChangePasswordController>(
                      builder: (controller) => CoustomTextFormAuth(
                        obscureText: controller.dontshowpassword2,
                        onTapIcon: () => controller.showPassWord2(),
                        hinttext: "Enter Your Password Again",
                        labeltext: "Password",
                        iconData: Icons.lock_outlined,
                        mycontroller: controller.password2,
                        valid: (val) {
                          return validInput("password", val!, 5, 50);
                        },
                        isNumber: false,
                      ),
                    ),
                    CoustomButton(
                      text: "Confrim",
                      paddinglenth: 80,
                      width: 100,
                      onPressed: () {
                        controller.goToSuccessChangePassword();
                      },
                    )
                  ],
                ),
              ))),
    );
  }
}
