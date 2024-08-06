import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/controller/auth/Login_Controller.dart';
import 'package:delivery/core/Class/CoustomButtonLimited_Class.dart';
import 'package:delivery/core/Class/CoustomTextFormFieldd_Class.dart';
import 'package:delivery/core/Class/HandlingDataView_Class.dart';
import 'package:delivery/core/Constant/Color_Const.dart';
import 'package:delivery/core/Functions/AlertExitApp_Functions.dart';
import 'package:delivery/core/Functions/ValidInput_Functions.dart';
import 'package:delivery/view/widget/login/logoLogin.dart';
import 'package:delivery/view/widget/login/maintitle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const CoustomTitle(
              color: AppColor.grey,
              text: "Sign In",
              size: 35,
              alignmentGeometry: Alignment.center,
              fontWeight: FontWeight.bold)),
      backgroundColor: AppColor.backgroundcolor,
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<LoginController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Form(
                    key: controller.formState,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: ListView(
                        children: [
                          // const SizedBox(
                          //   height: 30,
                          // ),
                          const Logo(),
                          const SizedBox(
                            height: 40,
                          ),
                          const CoustomTitle(
                              color: Colors.black,
                              text: "Welcome Back",
                              size: 30,
                              alignmentGeometry: Alignment.center,
                              fontWeight: FontWeight.bold),
                          const SizedBox(
                            height: 50,
                          ),
                          CoustomTextFormAuth(
                              hinttext: "Enter Your Email",
                              labeltext: "Email",
                              iconData: Icons.person,
                              mycontroller: controller.email,
                              valid: (val) {
                                return validInput("email", val!, 4, 50);
                              },
                              isNumber: false),

                          const SizedBox(
                            height: 10,
                          ),
                          GetBuilder<LoginController>(
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
                          InkWell(
                            onTap: controller.goToForgetPassword,
                            child: const CoustomTitle(
                                color: AppColor.grey,
                                text: "Forget password",
                                size: 15,
                                alignmentGeometry: Alignment.centerRight,
                                fontWeight: FontWeight.normal),
                          ),
                          CoustomButton(
                            text: "Login",
                            paddinglenth: 50,
                            onPressed: () {
                              controller.goToHome();
                            },
                            width: Get.width / 1.2,
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                          // NewUser(
                          //   text1: "New user? ",
                          //   text2: "Sign up",
                          //   onTap: () {
                          //     controller.goToSignUp();
                          //   },
                          // ),
                          // const SizedBox(
                          //   height: 25,
                          // ),
                          // const OrDivider(),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     SocialIcon(
                          //       logo: AppImageAsset.apple,
                          //       name: "Apple",
                          //       witdh80facebool60any: 60,
                          //       onTap: () {},
                          //     ),
                          //     SocialIcon(
                          //       logo: AppImageAsset.facebook,
                          //       name: "FaceBook",
                          //       witdh80facebool60any: 80,
                          //       onTap: () {},
                          //     ),
                          //     SocialIcon(
                          //       logo: AppImageAsset.google,
                          //       name: "Google",
                          //       witdh80facebool60any: 70,
                          //       onTap: () {},
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  )))),
    );
  }
}


// Container(
              //   width: Get.width / 1.3,
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   margin: EdgeInsets.all(2),
              //   decoration: BoxDecoration(
              //       color: Colors.blue,
              //       borderRadius: BorderRadius.circular(50)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Text(
              //         "Join with Facebook",
              //         style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //       Image.asset(
              //         AppImageAsset.facebook,
              //         width: 35,
              //         height: 35,
              //         fit: BoxFit.fill,
              //       )
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 5,
              // ),
              // Container(
              //   width: Get.width / 1.3,
              //   padding: EdgeInsets.symmetric(vertical: 10),
              //   margin: EdgeInsets.all(2),
              //   decoration: BoxDecoration(
              //       color: Colors.red, borderRadius: BorderRadius.circular(50)),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Text(
              //         "Join with Google",
              //         style: TextStyle(
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white),
              //       ),
              //       Image.asset(
              //         AppImageAsset.google,
              //         width: 35,
              //         height: 35,
              //         fit: BoxFit.fill,
              //       )
              //     ],
              //   ),
              // )