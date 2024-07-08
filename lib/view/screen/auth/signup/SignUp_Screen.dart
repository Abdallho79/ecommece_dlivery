import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/controller/auth/signup/SignUp_Controller.dart';
import 'package:delivery/core/Class/CoustomButtonLimited_Class.dart';
import 'package:delivery/core/Class/CoustomTextFormFieldd_Class.dart';
import 'package:delivery/core/Class/HandlingDataView_Class.dart';
import 'package:delivery/core/Constant/Color_Const.dart';
import 'package:delivery/core/Functions/AlertExitApp_Functions.dart';
import 'package:delivery/core/Functions/ValidInput_Functions.dart';
import 'package:delivery/view/widget/login/logoLogin.dart';
import 'package:delivery/view/widget/login/maintitle.dart';
import 'package:delivery/view/widget/login/newUser.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
        backgroundColor: AppColor.backgroundcolor,
        body: GetBuilder<SignUpController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: WillPopScope(
                      onWillPop: alertExitApp,
                      child: Form(
                        key: controller.formState,
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: ListView(
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Logo(),
                              const SizedBox(
                                height: 30,
                              ),
                              const CoustomTitle(
                                  color: Colors.black,
                                  text: "Creat An Account",
                                  size: 25,
                                  alignmentGeometry: Alignment.center,
                                  fontWeight: FontWeight.bold),
                              const SizedBox(
                                height: 30,
                              ),
                              CoustomTextFormAuth(
                                  hinttext: "Enter Your  Email",
                                  labeltext: "Email",
                                  iconData: Icons.email_outlined,
                                  mycontroller: controller.email,
                                  valid: (val) {
                                    return validInput("email", val!, 10, 50);
                                  },
                                  isNumber: false),
                              const SizedBox(
                                height: 10,
                              ),
                              CoustomTextFormAuth(
                                  hinttext: "Phone",
                                  labeltext: "Enter Your Phone",
                                  iconData: Icons.phone_outlined,
                                  mycontroller: controller.phone,
                                  valid: (val) {
                                    return validInput("phone", val!, 3, 20);
                                  },
                                  isNumber: true),
                              const SizedBox(
                                height: 10,
                              ),
                              CoustomTextFormAuth(
                                  hinttext: "Username",
                                  labeltext: "Enter Your Name",
                                  iconData: Icons.person_outline,
                                  mycontroller: controller.name,
                                  valid: (val) {
                                    return validInput("name", val!, 2, 20);
                                  },
                                  isNumber: false),
                              const SizedBox(
                                height: 10,
                              ),
                              GetBuilder<SignUpController>(
                                builder: (controller) => CoustomTextFormAuth(
                                    obscureText: controller.dontshowpasword,
                                    onTapIcon: () => controller.showPassword(),
                                    hinttext: "Enter Your Password",
                                    labeltext: "Password",
                                    iconData: Icons.lock_outline,
                                    mycontroller: controller.password,
                                    valid: (val) {
                                      return validInput("none", val!, 4, 50);
                                    },
                                    isNumber: false),
                              ),
                              CoustomButton(
                                text: "SignUp",
                                paddinglenth: 50,
                                onPressed: () {
                                  controller.goToVerifyCode();
                                },
                                width: Get.width / 1.2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              NewUser(
                                text1: "Have account? ",
                                text2: "Login",
                                onTap: () {
                                  controller.goToLogin();
                                },
                              ),
                            ],
                          ),
                        ),
                      )),
                )));
  }
}
