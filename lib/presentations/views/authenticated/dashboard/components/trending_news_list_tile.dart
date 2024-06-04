import 'package:busha_mobile_test/presentations/custom_designs/__export__.dart';
import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TrendingNewsListTile extends StatelessWidget {
  const TrendingNewsListTile({
    super.key,
    required this.imgUrl,
    required this.description,
    required this.fromTimeStamp,
  });

  final String imgUrl;
  final String description;
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
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: Image.asset(
              imgUrl.toString().png,
              width: 55.w,
              height: 73.h,
              fit: BoxFit.fill,
            ),
          ),
          XMargin(16.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
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
          )
        ],
      ),
    );
  }
}
