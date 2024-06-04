import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.buttonLabel,
    required this.onTap,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonBgColor,
    this.buttonBorderColor,
    this.buttonCornerRadius,
    this.buttonLabelColor,
    this.buttonLabelStyle,
    this.buttonSize,
    this.buttonWeight,
    this.isOutlineButton = false,
    this.isDisabled = false,
    this.customButtonLabel,
  });

  final double? buttonWidth;
  final double? buttonSize;
  final double? buttonHeight;
  final double? buttonCornerRadius;
  final Color? buttonBgColor;
  final Color? buttonBorderColor;
  final Color? buttonLabelColor;
  final TextStyle? buttonLabelStyle;
  final String buttonLabel;
  final FontWeight? buttonWeight;
  final Widget? customButtonLabel;
  final bool isOutlineButton;
  final bool isDisabled;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    return GestureDetector(
      onTap: () {
        if (isDisabled) {
          return;
        }

        onTap.call();
      },
      child: Container(
        width: buttonWidth ?? 1.sw,
        height: buttonHeight ?? 48.h,
        decoration: BoxDecoration(
            color: isDisabled == true
                ? appColorExtension.disabledFieldColor
                : isOutlineButton
                    ? Colors.transparent
                    : (buttonBgColor ?? appColorExtension.primaryColor),
            borderRadius: BorderRadius.circular(buttonCornerRadius ?? 8.r),
            border: Border.all(
                color: buttonBorderColor != null
                    ? buttonBorderColor!
                    : isOutlineButton
                        ? buttonLabelColor ?? appColorExtension.primaryColor
                        : Colors.transparent,
                width: 1)),
        child: Center(
          child: customButtonLabel ??
              Text(
                buttonLabel,
                style: buttonLabelStyle ??
                    CustomStyle.textStyleInter.copyWith(
                      fontWeight: buttonWeight ?? FontWeight.w500,
                      fontSize: buttonSize ?? 14.sp,
                      color: isOutlineButton
                          ? (buttonBgColor ?? appColorExtension.primaryColor)
                          : (buttonLabelColor ?? appColorExtension.whiteColor),
                    ),
              ),
        ),
      ),
    );
  }
}
