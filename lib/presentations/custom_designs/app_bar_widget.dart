import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.appBarTitle,
    this.appBarTitleStyle,
    this.onBackTap,
  });

  final String? appBarTitle;
  final TextStyle? appBarTitleStyle;

  final Function? onBackTap;

  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    return GestureDetector(
      onTap: () {
        onBackTap?.call();
      },
      child: SizedBox(
        width: 1.sw,
        height: 44.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: appColorExtension.blackColor.withOpacity(0.95),
            ),
            if (appBarTitle != null) ...[
              Expanded(
                child: Text(
                  appBarTitle!,
                  style: appBarTitleStyle ??
                      CustomStyle.textStyleInter.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: appColorExtension.blackColor.withOpacity(0.95),
                      ),
                  textAlign: TextAlign.center,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
