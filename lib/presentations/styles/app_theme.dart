import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: BushaLightColors.whiteColor,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.white,
    unselectedWidgetColor: Colors.white,
    useMaterial3: true,
    hintColor: Colors.white,
    extensions: <ThemeExtension<dynamic>>{
      AppColorExtension(
          primaryColor: BushaLightColors.primaryColor,
          whiteColor: BushaLightColors.whiteColor,
          blackColor: BushaLightColors.blackColor,
          disabledFieldColor: BushaLightColors.disabledFieldColor,
          error500: BushaLightColors.error500,
          error25: BushaLightColors.error25,
          error600: BushaLightColors.error600,
          success50: BushaLightColors.success50,
          warning50: BushaLightColors.warning50,
          success400: BushaLightColors.success400,
          success500: BushaLightColors.success500,
          warning500: BushaLightColors.warning500,
          warning600: BushaLightColors.warning600,
          primaryColor10: BushaLightColors.primaryColor10,
          black90: BushaLightColors.black90,
          orangeAccent: BushaLightColors.orangeAccent,
          orangeAccent10: BushaLightColors.orangeAccent10,
          yellow10: BushaLightColors.yellow10,
          yellowAccent: BushaLightColors.yellowAccent,
          grey100: BushaLightColors.grey100,
          grey250: BushaLightColors.grey250,
          grey300: BushaLightColors.grey300,
          grey500: BushaLightColors.grey500),
    },
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      thickness: 0.5,
      space: 0.5,
      indent: 10,
      endIndent: 10,
    ),
    textTheme: TextTheme(
      labelLarge: CustomStyle.textStyleInter,
      labelMedium: CustomStyle.textStyleInter,
      labelSmall: CustomStyle.textStyleInter,
      titleLarge: CustomStyle.textStyleInter,
      titleMedium: CustomStyle.textStyleInter,
      titleSmall: CustomStyle.textStyleInter,
      bodyLarge: CustomStyle.textStyleInter,
      bodyMedium: CustomStyle.textStyleInter,
      bodySmall: CustomStyle.textStyleInter,
    ),
    canvasColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: BushaLightColors.primaryColor,
    ),
    fontFamily: 'Inter',
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: BushaDarkColors.whiteColor,
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      secondary: Colors.white,
      onSecondary: Colors.white,
      onBackground: Colors.white,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.white,
    unselectedWidgetColor: Colors.white,
    useMaterial3: true,
    hintColor: Colors.white,
    extensions: <ThemeExtension<dynamic>>{
      AppColorExtension(
          primaryColor: BushaDarkColors.primaryColor,
          whiteColor: BushaDarkColors.whiteColor,
          blackColor: BushaDarkColors.blackColor,
          disabledFieldColor: BushaDarkColors.disabledFieldColor,
          error500: BushaDarkColors.error500,
          error25: BushaDarkColors.error25,
          error600: BushaDarkColors.error600,
          success50: BushaDarkColors.success50,
          warning50: BushaDarkColors.warning50,
          success400: BushaDarkColors.success400,
          success500: BushaDarkColors.success500,
          warning500: BushaDarkColors.warning500,
          warning600: BushaDarkColors.warning600,
          primaryColor10: BushaDarkColors.primaryColor10,
          black90: BushaDarkColors.black90,
          orangeAccent: BushaDarkColors.orangeAccent,
          orangeAccent10: BushaDarkColors.orangeAccent10,
          yellow10: BushaDarkColors.yellow10,
          yellowAccent: BushaDarkColors.yellowAccent,
          grey100: BushaDarkColors.grey100,
          grey250: BushaDarkColors.grey250,
          grey300: BushaDarkColors.grey300,
          grey500: BushaDarkColors.grey500),
    },
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      thickness: 0.5,
      space: 0.5,
      indent: 10,
      endIndent: 10,
    ),
    textTheme: TextTheme(
      labelLarge: CustomStyle.textStyleInter,
      labelMedium: CustomStyle.textStyleInter,
      labelSmall: CustomStyle.textStyleInter,
      titleLarge: CustomStyle.textStyleInter,
      titleMedium: CustomStyle.textStyleInter,
      titleSmall: CustomStyle.textStyleInter,
      bodyLarge: CustomStyle.textStyleInter,
      bodyMedium: CustomStyle.textStyleInter,
      bodySmall: CustomStyle.textStyleInter,
    ),
    canvasColor: Colors.transparent,
    iconTheme: IconThemeData(
      color: BushaDarkColors.primaryColor,
    ),
    fontFamily: 'Inter',
  );
}
