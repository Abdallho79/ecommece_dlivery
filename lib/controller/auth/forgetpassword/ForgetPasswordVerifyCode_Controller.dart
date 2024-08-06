import 'package:get/get.dart';
import 'package:delivery/core/Class/StatusRequest_Class.dart';
import 'package:delivery/core/Constant/Routes_Const.dart';
import 'package:delivery/core/Functions/HandlingDataController_Functions.dart';
import 'package:delivery/data/DataSource/Remote/forgetpassword_data/forgetCode_data.dart';

class ForgetPasswordVerifyCodeController extends GetxController {
  late String email;
  StatusRequest statusRequest = StatusRequest.none;
  VerfiyCodeForgetPassData verfiyCodeForgetPassdata =
      VerfiyCodeForgetPassData(Get.find());
  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  goToChangePassword(String code1) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeForgetPassdata.checkData(email, code1);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.snackbar("Success", "Correct Verification Code");
        Get.offNamed(AppRouts.changePassword, arguments: {"email": email});
      } else {
        Get.snackbar("Failure", "inCorrect Verification Code");
      }
    }
    update();
  }
}
