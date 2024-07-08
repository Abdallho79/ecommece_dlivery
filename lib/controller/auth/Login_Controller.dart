import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/core/Class/StatusRequest_Class.dart';
import 'package:delivery/core/Constant/Routes_Const.dart';
import 'package:delivery/core/Functions/HandlingDataController_Functions.dart';
import 'package:delivery/core/Services/Services.dart';
import 'package:delivery/data/DataSource/Remote/login_data.dart';

class LoginController extends GetxController {
  TextEditingController? email;
  TextEditingController? password;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  MyServices myServices = Get.find();
  bool dontshowpasword = true;
  LoginData loginData = LoginData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];

  getData() async {}

  showPassword() {
    dontshowpasword = dontshowpasword == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  goToHome() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.checkData(email!.text, password!.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print("===========${response}===========");
          if (response["data"]["delivery_approve"].toString() == "1") {
            myServices.sharedPreferences
                .setString("id", response["data"]["delivery_id"].toString());
            String id = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences.setString(
                "email", response["data"]["delivery_email"].toString());
            myServices.sharedPreferences.setString(
                "phone", response["data"]["delivery_phone"].toString());
            myServices.sharedPreferences.setString(
                "password", response["data"]["delivery_password"].toString());
            myServices.sharedPreferences.setString(
                "name", response["data"]["delivery_name"].toString());
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic("delivery");
            FirebaseMessaging.instance.subscribeToTopic("delivery${id}");
            Get.offAllNamed(AppRouts.home);
          } else {
            Get.snackbar("Error", "Email is Not Verfy please talk to owner");
            // Get.toNamed(AppRouts.verifyCodeSignUp,
            //     arguments: {"email": email!.text});
          }
        } else {
          Get.snackbar("Error", "Email or Password are not correct");
          statusRequest = StatusRequest.none;
        }
      }
      update();
    }
  }

  // goToSignUp() {
  //   Get.offAllNamed(AppRouts.signUp);
  // }

  goToForgetPassword() {
    Get.toNamed(AppRouts.forgetPassword);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email!.dispose();
    password!.dispose();
    super.dispose();
  }
}
