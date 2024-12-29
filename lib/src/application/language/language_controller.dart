import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  var currentLocale = const Locale('en').obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLocale();
  }

  Future<void> _loadLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language_code');
    if (languageCode != null) {
      currentLocale.value = Locale(languageCode);
    }
  }

  Future<void> changeLocale(Locale locale) async {
    print("Changing locale to: ${locale.languageCode}");
    isLoading.value = true;
    currentLocale.value = locale;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language_code', locale.languageCode);
    isLoading.value = false;
    print("Locale changed to: ${currentLocale.value}");
    Get.forceAppUpdate();
    print("Locale changed to: ${currentLocale.value}");
    Get.updateLocale(locale);
    //Get.reset();


  }
}




// import 'package:get/get.dart';
// import 'language_controller.dart';
//
// // Change to Danish
// Get.find<LanguageController>().changeLocale(Locale('da'));
//
// // Change to English
// Get.find<LanguageController>().changeLocale(Locale('en'));
