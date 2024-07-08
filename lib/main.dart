import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delivery/Routes.dart';
import 'package:delivery/binding/IntialBindings.dart';
import 'package:delivery/core/Localization/Translation_Localization.dart';
import 'package:delivery/core/Localization/language_Controller.dart';
import 'package:delivery/core/Services/Services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  LanguageController controller = Get.put(LanguageController());

  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      theme: controller.apptheme,
      locale: controller.language,
      translations: MyLocaleTranslations(),
      debugShowCheckedModeBanner: false,
      getPages: getPages,
    );
  }
}
