import 'package:fahad_flutter/src/application/state_holder.dart';
import 'package:fahad_flutter/src/application/theme_data/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class Trimber extends StatefulWidget {
  const Trimber({super.key});

  @override
  State<Trimber> createState() => _TrimberState();
}

class _TrimberState extends State<Trimber> {
 // final LanguageController languageController = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
    //  print("Current locale: ${languageController.currentLocale.value}");
      return GetMaterialApp(
        title: 'Flutter Demo',
        // localizationsDelegates: const [
        //   AppLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // locale: languageController.currentLocale.value,
        fallbackLocale: const Locale('en'),
        supportedLocales: const [Locale("en"), Locale("da")],
        theme: AppThemeData.lightThemeData(context),
//home: const SplashScreen(),
        initialBinding: StateHolderBinder(),
      );
    });
  }
}
