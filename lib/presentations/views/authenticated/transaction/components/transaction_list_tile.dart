import 'package:busha_mobile_test/presentations/custom_designs/__export__.dart';
import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({
    super.key,
    required this.walletAddress,
    required this.timeStamp,
    this.onTransactionItemTapped,
  });

  final String walletAddress;
  final String timeStamp;

  final Function? onTransactionItemTapped;
  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    return GestureDetector(
      onTap: () {
        onTransactionItemTapped?.call();
      },
      child: Container(
        decoration: BoxDecoration(
            color: appColorExtension.whiteColor,
            border: Border(
              bottom: BorderSide(color: appColorExtension.grey300),
            )),
        padding: EdgeInsets.only(bottom: 16.h),
        margin: EdgeInsets.only(bottom: 16.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    walletAddress.length > 30
                        ? "${walletAddress.substring(0, 30)}..."
                        : walletAddress,
                    style: CustomStyle.textStyleInter.copyWith(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: appColorExtension.blackColor.withOpacity(0.95),
                    ),
                  ),
                ),
                SvgPicture.asset('ic_arrow_right'.svg)
              ],
            ),
            YMargin(8.h),
            Text(
              timeStamp,
              style: CustomStyle.textStyleInter.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                color: appColorExtension.blackColor.withOpacity(0.56),
              ),
            )
          ],
        ),
      ),
    );
  }
}
