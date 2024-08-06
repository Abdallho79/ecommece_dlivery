import 'package:get/get.dart';

class MyLocaleTranslations implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    "en" : {"1" : "English"  , "2" : "Arabic" , "3" : "Choose Language" },
    "ar" : {"1" : "الانجليزيه" , "2" : "العربيه" , "3" : "اختر اللغه"}
  };

}