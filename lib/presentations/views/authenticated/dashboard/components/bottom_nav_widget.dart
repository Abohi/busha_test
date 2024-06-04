import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../custom_designs/__export__.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    Key? key,
    required this.iconUrl,
    required this.title,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  final String iconUrl;
  final String title;
  final bool isActive;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    Color activeColor = appColorExtension.blackColor.withOpacity(0.95);
    Color inactiveColor = appColorExtension.blackColor.withOpacity(0.32);

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconUrl.svg,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
                isActive ? activeColor : inactiveColor, BlendMode.srcIn),
          ),
          YMargin(9.5.h),
          Text(
            title,
            style: CustomStyle.textStyleInter.copyWith(
              color: isActive ? activeColor : inactiveColor,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
