import 'package:delivery/core/Constant/Routes_Const.dart';
import 'package:delivery/core/Services/Services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  MyServices myServices = Get.find();
  logOut() {
    FirebaseMessaging.instance.unsubscribeFromTopic("delivery");
    FirebaseMessaging.instance.unsubscribeFromTopic(
        "delivery${myServices.sharedPreferences.getString("id")}");
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRouts.logIn);
  }
}
