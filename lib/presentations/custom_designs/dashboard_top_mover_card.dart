import 'package:busha_mobile_test/presentations/custom_designs/__export__.dart';
import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardTopMoverCard extends StatelessWidget {
  const DashBoardTopMoverCard({
    super.key,
    required this.imgUrl,
    required this.cryptoAssetName,
    required this.trendPercentage,
    required this.isUpwardTrend,
  });

  final String imgUrl;
  final String cryptoAssetName;
  final bool isUpwardTrend;
  final String trendPercentage;

  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    return Container(
      padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
      margin: EdgeInsets.only(right: 8.w),
      width: 0.4.sw,
      decoration: BoxDecoration(
          color: appColorExtension.whiteColor,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
              color: appColorExtension.blackColor.withOpacity(0.12), width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: imgUrl.toString().isNotEmpty ? imgUrl.toString() : "",
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                radius: 20.r,
                backgroundImage: imageProvider,
              );
            },
            errorWidget: (context, url, error) {
              return CircleAvatar(
                radius: 20.r,
                backgroundColor: appColorExtension.whiteColor,
                child: Image.asset(
                  imgUrl.toString().png,
                  width: 40.w,
                  height: 40.h,
                ),
              );
            },
          ),
          YMargin(8.h),
          Text(
            cryptoAssetName,
            style: CustomStyle.textStyleInter.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: appColorExtension.blackColor,
            ),
          ),
          YMargin(8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                  (isUpwardTrend ? 'ic_arrow_up_right' : 'ic_arrow_down_right')
                      .svg),
              Text(
                trendPercentage,
                style: CustomStyle.textStyleInter.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: isUpwardTrend
                      ? appColorExtension.primaryColor
                      : appColorExtension.error500,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
