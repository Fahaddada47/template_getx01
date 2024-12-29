
import 'package:fahad_flutter/src/application/styling/app_colors.dart';
import 'package:fahad_flutter/src/application/styling/text_styles.dart';
import 'package:flutter/material.dart';


class AppThemeData {
  static ThemeData lightThemeData(BuildContext context) => _themeData;

  static final ThemeData _themeData = ThemeData(
     fontFamily: "Geist",
      scaffoldBackgroundColor: white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(double.infinity, 40),
          textStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w700, color: white),
          backgroundColor: skobeloffGreen,
          disabledBackgroundColor: buttonbg,
          disabledForegroundColor: buttonbg,
          padding: const EdgeInsets.symmetric(vertical: 0),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: viridian,
        background: white,
        error: Colors.red,
      ),
      appBarTheme: _appBarTheme,
      floatingActionButtonTheme: _floatingActionButtonThemeData,
      dialogTheme:
          const DialogTheme(backgroundColor: white, surfaceTintColor: white));

  static final AppBarTheme _appBarTheme = AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black,
      size: 14,
    ),
    toolbarHeight: 64,
    elevation: 0,
    titleTextStyle: TextStyles.appBar.copyWith(color: black),
    surfaceTintColor: white,
    centerTitle: false,
  );


  static final FloatingActionButtonThemeData _floatingActionButtonThemeData = FloatingActionButtonThemeData(
    backgroundColor: skobeloffGreen,
    iconSize: 32,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50)
    )
  );
}
