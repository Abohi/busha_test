import 'package:busha_mobile_test/presentations/custom_designs/__export__.dart';
import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardAssetCard extends StatelessWidget {
  const DashBoardAssetCard({
    super.key,
    required this.imgUrl,
    required this.cryptoAssetName,
    required this.cryptoAssetCode,
    required this.amount,
    required this.isUpwardTrend,
    required this.trendPercentage,
    this.onDashBoardAssetTapped,
  });
  final String imgUrl;
  final String cryptoAssetName;
  final String cryptoAssetCode;
  final String amount;
  final bool isUpwardTrend;
  final String trendPercentage;
  final Function? onDashBoardAssetTapped;

  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    return GestureDetector(
      onTap: () {
        onDashBoardAssetTapped?.call();
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 16.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
            XMargin(16.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cryptoAssetName,
                    style: CustomStyle.textStyleInter.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: appColorExtension.blackColor,
                    ),
                  ),
                  YMargin(2.h),
                  Text(
                    cryptoAssetCode,
                    style: CustomStyle.textStyleInter.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                      color: appColorExtension.grey500,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: CustomStyle.textStyleInter.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: appColorExtension.blackColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset((isUpwardTrend
                              ? 'ic_arrow_up_right'
                              : 'ic_arrow_down_right')
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
            )
          ],
        ),
      ),
    );
  }
}
