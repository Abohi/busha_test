import 'package:busha_mobile_test/presentations/custom_designs/__export__.dart';
import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionDetailScreenCard extends StatelessWidget {
  const TransactionDetailScreenCard({
    super.key,
    required this.description,
    required this.label,
  });

  final String label;
  final String description;
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
      margin: EdgeInsets.only(bottom: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: CustomStyle.textStyleInter.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: appColorExtension.blackColor.withOpacity(0.60),
            ),
          ),
          XMargin(40.w),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.end,
              style: CustomStyle.textStyleInter.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: appColorExtension.blackColor.withOpacity(0.95),
              ),
            ),
          )
        ],
      ),
    );
  }
}
