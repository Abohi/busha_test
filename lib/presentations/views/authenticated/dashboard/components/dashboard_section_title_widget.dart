import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardSectionTitleWidget extends StatelessWidget {
  const DashBoardSectionTitleWidget({
    required this.titleLeft,
    required this.titleRight,
    this.onSeeAllTapped,
  });
  final String titleLeft;
  final String titleRight;

  final Function? onSeeAllTapped;

  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    return GestureDetector(
      onTap: () {
        onSeeAllTapped?.call();
      },
      child: SizedBox(
        width: 1.sw,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              titleLeft.tr(),
              style: CustomStyle.textStyleInter.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16.sp,
                color: appColorExtension.blackColor.withOpacity(0.95),
              ),
            ),
            Text(
              titleRight.tr(),
              style: CustomStyle.textStyleInter.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: appColorExtension.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
