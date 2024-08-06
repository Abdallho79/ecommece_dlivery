import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:delivery/core/Class/StatusRequest_Class.dart';
import 'package:delivery/core/Constant/Routes_Const.dart';
import 'package:delivery/core/Functions/HandlingDataController_Functions.dart';
import 'package:delivery/data/DataSource/Remote/forgetpassword_data/checkemail_data.dart';

class ForgetPasswordEmailController extends GetxController {
  TextEditingController? email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email!.dispose();
    super.dispose();
  }

  goToForgetPasswordVerifyCode() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await checkEmailData.checkData(email!.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(AppRouts.verifyCodeForgetPassword,
              arguments: {"email": email!.text});
        } else {
          Get.snackbar("Failure", "Email doesn't exist");
          statusRequest = StatusRequest.nodatafailure;
        }
        // End
      } else {
      }
      update();
    }
  }
}
