import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomHorizontalDivider extends StatelessWidget {
  const CustomHorizontalDivider({
    super.key,
    this.dividerHeight,
    this.dividerColor,
  });
  final double? dividerHeight;
  final Color? dividerColor;
  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    return Container(
      width: 1.sw,
      height: dividerHeight ?? 1.h,
      color: dividerColor ?? appColorExtension.grey300,
    );
  }
}
