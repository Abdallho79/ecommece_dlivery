import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:delivery/core/Class/StatusRequest_Class.dart';
import 'package:delivery/core/Constant/Routes_Const.dart';
import 'package:delivery/core/Functions/HandlingDataController_Functions.dart';
import 'package:delivery/core/Services/Services.dart';
import 'package:delivery/data/DataSource/Remote/forgetpassword_data/changeemail_data.dart';

class ChangePasswordController extends GetxController {
  ChangePasswordData changePasswordData = ChangePasswordData(Get.find());
  MyServices myServices = Get.find();
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController? password1;
  TextEditingController? password2;
  bool dontshowpassword1 = true;
  showPassWord1() {
    dontshowpassword1 = dontshowpassword1 == true ? false : true;
    update();
  }

  bool dontshowpassword2 = true;
  showPassWord2() {
    dontshowpassword2 = dontshowpassword2 == true ? false : true;
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    password1 = TextEditingController();
    password2 = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password1!.dispose();
    password2!.dispose();
    super.dispose();
  }

  goToSuccessChangePassword() async {
    if (password1!.text == password2!.text) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await changePasswordData.updateData(email!, password1!.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        // Start backend
        if (response['status'] == "success") {
          Get.offNamed(AppRouts.successChangePassword);
        } else {
          statusRequest = StatusRequest.nodatafailure;
        }
        // End
      } else {
        Get.snackbar("Error", "You must Change your password");
      }
      update();
    } else {
      Get.snackbar("Error", "Password Doesn't Match");
    }
  }
}
