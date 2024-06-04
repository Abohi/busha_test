import 'package:flutter/material.dart';

class AppColorExtension extends ThemeExtension<AppColorExtension> {
  final Color yellow10;
  final Color grey100;
  final Color grey250;
  final Color yellowAccent;
  final Color orangeAccent;
  final Color orangeAccent10;
  final Color primaryColor;
  final Color primaryColor10;
  final Color whiteColor;
  final Color blackColor;
  final Color disabledFieldColor;
  final Color error500;
  final Color success500;
  final Color success400;
  final Color success50;
  final Color warning50;
  final Color warning500;
  final Color warning600;
  final Color error600;
  final Color error25;
  final Color black90;
  final Color grey300;
  final Color grey500;
  const AppColorExtension(
      {required this.primaryColor,
      required this.whiteColor,
      required this.blackColor,
      required this.disabledFieldColor,
      required this.error500,
      required this.error25,
      required this.error600,
      required this.success50,
      required this.warning50,
      required this.success400,
      required this.success500,
      required this.warning500,
      required this.warning600,
      required this.primaryColor10,
      required this.black90,
      required this.orangeAccent,
      required this.orangeAccent10,
      required this.yellow10,
      required this.yellowAccent,
      required this.grey100,
      required this.grey250,
      required this.grey300,
      required this.grey500});

  @override
  ThemeExtension<AppColorExtension> copyWith({
    Color? primaryColor,
    Color? whiteColor,
    Color? blackColor,
    Color? greyOnWhiteBlack,
    Color? greyOnWhite50,
    Color? mainBackgroundColor,
    Color? neutralColor800,
    Color? grey400,
    Color? grey300,
    Color? grey900,
    Color? grey500,
    Color? grey200,
    Color? disabledFieldColor,
    Color? grey800,
    Color? error500,
    Color? neutralColor500,
    Color? grey600,
    Color? mainColorBlack,
    Color? success500,
    Color? success400,
    Color? success50,
    Color? warning50,
    Color? warning500,
    Color? warning600,
    Color? error600,
    Color? error25,
    Color? primaryColor10,
    Color? black90,
    Color? geanBlue,
    Color? geanBlueAccent,
    Color? orangeAccent,
    Color? orangeAccent10,
    Color? yellow10,
    Color? yellowAccent,
    Color? grey100,
    Color? grey250,
  }) {
    return AppColorExtension(
        primaryColor: primaryColor ?? this.primaryColor,
        whiteColor: whiteColor ?? this.whiteColor,
        blackColor: blackColor ?? this.blackColor,
        disabledFieldColor: disabledFieldColor ?? this.disabledFieldColor,
        error500: error500 ?? this.error500,
        error25: error25 ?? this.error25,
        error600: error600 ?? this.error600,
        success50: success50 ?? this.success50,
        warning50: warning50 ?? this.warning50,
        success400: success400 ?? this.success400,
        success500: success500 ?? this.success500,
        warning500: warning500 ?? this.warning500,
        warning600: warning600 ?? this.warning600,
        primaryColor10: primaryColor10 ?? this.primaryColor10,
        black90: black90 ?? this.black90,
        orangeAccent: orangeAccent ?? this.orangeAccent,
        orangeAccent10: orangeAccent10 ?? this.orangeAccent10,
        yellow10: yellow10 ?? this.yellow10,
        yellowAccent: yellowAccent ?? this.yellowAccent,
        grey100: grey100 ?? this.grey100,
        grey250: grey250 ?? this.grey250,
        grey300: grey300 ?? this.grey300,
        grey500: grey500 ?? this.grey500);
  }

  @override
  ThemeExtension<AppColorExtension> lerp(
      covariant ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) {
      return this;
    }

    return AppColorExtension(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      whiteColor: Color.lerp(whiteColor, other.whiteColor, t)!,
      blackColor: Color.lerp(blackColor, other.blackColor, t)!,
      disabledFieldColor:
          Color.lerp(disabledFieldColor, other.disabledFieldColor, t)!,
      error500: Color.lerp(error500, other.error500, t)!,
      error25: Color.lerp(error25, other.error25, t)!,
      error600: Color.lerp(error600, other.error600, t)!,
      success50: Color.lerp(success50, other.success50, t)!,
      warning50: Color.lerp(warning50, other.warning50, t)!,
      success400: Color.lerp(success400, other.success400, t)!,
      success500: Color.lerp(success500, other.success500, t)!,
      warning500: Color.lerp(warning500, other.warning500, t)!,
      warning600: Color.lerp(warning600, other.warning600, t)!,
      primaryColor10: Color.lerp(primaryColor10, other.primaryColor10, t)!,
      black90: Color.lerp(black90, other.black90, t)!,
      orangeAccent: Color.lerp(orangeAccent, other.orangeAccent, t)!,
      orangeAccent10: Color.lerp(orangeAccent10, other.orangeAccent10, t)!,
      yellow10: Color.lerp(yellow10, other.yellow10, t)!,
      yellowAccent: Color.lerp(yellowAccent, other.yellowAccent, t)!,
      grey100: Color.lerp(grey100, other.grey100, t)!,
      grey250: Color.lerp(grey250, other.grey250, t)!,
      grey300: Color.lerp(grey300, other.grey300, t)!,
      grey500: Color.lerp(grey500, other.grey500, t)!,
    );
  }
}
