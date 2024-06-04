import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../custom_designs/__export__.dart';

class TrendingNewsCard extends StatelessWidget {
  const TrendingNewsCard({
    super.key,
    required this.imgUrl,
    required this.desc,
    required this.fromTimeStamp,
  });

  final String imgUrl;
  final String desc;
  final String fromTimeStamp;

  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    return Container(
      decoration: BoxDecoration(
          color: appColorExtension.whiteColor,
          border: Border(
            bottom: BorderSide(color: appColorExtension.grey300),
          )),
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.asset(
              imgUrl.toString().png,
              width: 1.sw,
              height: 166.h,
              fit: BoxFit.fill,
            ),
          ),
          YMargin(16.h),
          Text(
            desc,
            style: CustomStyle.textStyleInter.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: appColorExtension.blackColor,
            ),
          ),
          YMargin(8.h),
          Text(
            fromTimeStamp,
            style: CustomStyle.textStyleInter.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: appColorExtension.grey500,
            ),
          ),
        ],
      ),
    );
  }
}
