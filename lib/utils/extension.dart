import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';

extension StringExtensions on String {
  String get png => "assets/images/$this.png";

  String get svg => "assets/scalable_vectors/$this.svg";
  String get jpg => "assets/images/$this.jpg";
  String get capitalize => length > 0
      ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
      : this;

  String get capitalizeFirst =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : this;

  String get allInCaps => toUpperCase();

  String get titleCase =>
      split(' ').map((str) => str.capitalizeFirst).join(' ');

  String tr([Map<String, dynamic>? args]) {
    String value = Localization.instance.translate(this);

    if (args != null) {
      for (final key in args.keys) {
        value = value.replaceAll('{$key}', '${args[key]}');
      }
    }

    return value;
  }

  String nr(num count, [Map<String, dynamic>? args]) {
    String value = Localization.instance.plural(this, count);

    if (args != null) {
      for (final key in args.keys) {
        value = value.replaceAll('{$key}', '${args[key]}');
      }
    }

    return value;
  }
}

extension DashBoardEnumExtension on DashboardPages {
  String get titleCase =>
      name.split(' ').map((str) => str.capitalizeFirst).join(' ');
}

extension DoubleExtension on int {
  String get formattedCryptoTime {
    DateTime creationDateTime =
        DateTime.fromMillisecondsSinceEpoch(this * 1000);
    return DateFormat('yyyy-MM-dd • HH:mm').format(creationDateTime);
  }
}

extension PaddingExtensions on Widget {
  Widget paddingAll(double padding) => Padding(
        padding: EdgeInsets.all(
          padding.w,
        ),
        child: this,
      );
  Widget paddingOnly(
          {double left = 0,
          double right = 0,
          double bottom = 0,
          double top = 0}) =>
      Padding(
        padding:
            EdgeInsets.only(left: left, right: right, bottom: bottom, top: top),
        child: this,
      );
  Widget paddingSymmetric({
    double horizontal = 0,
    double vertical = 0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal.w,
          vertical: vertical.h,
        ),
        child: this,
      );

  Widget paddingFromLTRB({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      Padding(
        padding: EdgeInsets.fromLTRB(
          left.w,
          top.h,
          right.w,
          bottom.h,
        ),
        child: this,
      );
}
