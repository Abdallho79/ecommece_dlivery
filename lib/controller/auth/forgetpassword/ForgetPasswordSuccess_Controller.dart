import 'package:get/get.dart';
import 'package:delivery/core/Constant/Routes_Const.dart';

class ForgetPasswordSuccessController extends GetxController {
  goToLogin() {
    Get.offAllNamed(AppRouts.logIn);
  }
}
