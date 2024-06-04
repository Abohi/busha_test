import 'package:busha_mobile_test/presentations/custom_designs/__export__.dart';
import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomInputfield extends StatefulHookWidget {
  final Function()? editingComplete;
  final String? Function(dynamic)? onValidate;
  final Function(dynamic)? onSaved;
  final bool obscure;
  final bool enabled;
  final String? subtitle;
  final Color? subtitleColor;
  final double subtitleTextSize;
  final String? fieldName;
  final bool isAutoFocus;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final Color? focusColor, hintColor, fillColor, inputBorderColor;
  final bool hasBottomMargin;
  final double padding;
  final String? hintText;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final Function()? onTap;
  final bool? canTap;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Function(dynamic)? onChanged;
  final String? headerTitle;
  final Widget? headerTitleWidget;
  final Widget? headerSuffix;
  final bool hasHeaderTitle;
  final Color? headerTitleColor;
  final FontWeight? headerFontWeight;
  final bool isAlignTop;
  final bool showObscureIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool filled;
  final bool isDropdownField;
  final bool hasDropdownIcon;
  final Color? titleColor;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final bool isRoundField;
  final bool shouldFocusOnFilled;
  final bool shouldFocusWhenTyping;
  final EdgeInsets? contentPadding;
  final double borderRadius;
  final dynamic selectedDropdownItem;
  final bool hasSelectedDropdownItem;
  final List<dynamic> items;
  final List<DropdownMenuItem<dynamic>>? customDropdownItems;
  final bool isValidatingField;
  final bool isValidated;
  final double? bottomMargin;
  final bool hasInitialBorder;
  final Color? initialBorderColor;
  final Widget? eyeClose;
  final Widget? eyeOpened;
  final int errorFontSize;
  final BorderRadius? customBorderRadius;
  final double? headerTitleFontSize;
  const CustomInputfield({
    Key? key,
    this.focusNode,
    this.hintColor,
    this.enabled = true,
    this.isAlignTop = false,
    this.headerTitle,
    this.headerSuffix,
    this.hasHeaderTitle = false,
    this.headerTitleColor,
    this.headerFontWeight,
    this.editingComplete,
    this.fieldName,
    this.isAutoFocus = false,
    this.onSaved,
    this.inputType,
    this.onValidate,
    this.controller,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.focusColor,
    this.padding = 16,
    this.hasBottomMargin = true,
    this.hintText,
    this.suffixWidget,
    this.prefixWidget,
    this.suffixIcon,
    this.prefixIcon,
    this.onTap,
    this.canTap = true,
    this.showObscureIcon = false,
    this.readOnly = false,
    this.obscure = false,
    this.onChanged,
    this.inputFormatters = const [],
    this.filled = true,
    this.isDropdownField = false,
    this.hasDropdownIcon = false,
    this.titleColor,
    this.textAlign = TextAlign.start,
    this.isRoundField = false,
    this.shouldFocusOnFilled = true,
    this.shouldFocusWhenTyping = true,
    this.contentPadding,
    this.borderRadius = 8.0,
    this.selectedDropdownItem = "",
    this.hasSelectedDropdownItem = false,
    this.items = const ["Hello", "World"],
    this.customDropdownItems,
    this.isValidatingField = false,
    this.isValidated = false,
    this.bottomMargin,
    this.hasInitialBorder = false,
    this.initialBorderColor,
    this.fillColor,
    this.inputBorderColor,
    this.subtitle,
    this.subtitleColor,
    this.subtitleTextSize = 8,
    this.errorFontSize = 12,
    this.eyeClose,
    this.eyeOpened,
    this.headerTitleWidget,
    this.customBorderRadius,
    this.headerTitleFontSize,
  }) : super(key: key);

  @override
  _CustomInputfieldState createState() => _CustomInputfieldState();
}

class _CustomInputfieldState extends State<CustomInputfield> {
  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    final isFocused = useState(false);
    final isObscure = useState(true);

    final outlineInputEnabledBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.focusColor ?? appColorExtension.primaryColor,
        width: 0.7,
      ),
      borderRadius: widget.isRoundField
          ? BorderRadius.circular(widget.borderRadius.r)
          : widget.customBorderRadius ??
              BorderRadius.all(
                Radius.circular(widget.borderRadius.r),
              ),
    );

    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: widget.hasInitialBorder
            ? widget.initialBorderColor ?? appColorExtension.primaryColor
            : Colors.transparent,
        width: widget.hasInitialBorder ? 0.7 : 0,
      ),
      borderRadius: widget.isRoundField
          ? BorderRadius.circular(widget.borderRadius.r)
          : widget.customBorderRadius ??
              BorderRadius.all(
                Radius.circular(widget.borderRadius.r),
              ),
    );

    var outlineInputErrorBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: appColorExtension.primaryColor,
      ),
      borderRadius: widget.isRoundField
          ? BorderRadius.circular(widget.borderRadius.r)
          : widget.customBorderRadius ??
              BorderRadius.all(
                Radius.circular(widget.borderRadius.r),
              ),
    );

    Widget _suffixIcon = widget.obscure == false
        ? widget.isDropdownField || widget.hasDropdownIcon
            ? Padding(
                padding: EdgeInsets.only(right: 14.w),
                child: SvgPicture.asset(
                  'ic_dropdown_arrow'.svg,
                ),
              )
            : GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.only(right: 14.w),
                  child: widget.suffixIcon,
                ),
              )
        : isObscure.value == true
            ? widget.showObscureIcon
                ? GestureDetector(
                    onTap: () {
                      isObscure.value = !isObscure.value;
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 14.w),
                      child: Text(
                        'Show',
                        style: CustomStyle.textStyleInter.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: appColorExtension.grey100,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 14.w),
                    child: widget.suffixIcon,
                  )
            : widget.showObscureIcon
                ? GestureDetector(
                    onTap: () {
                      isObscure.value = !isObscure.value;
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 14.w),
                      child: Text(
                        "Show".tr(),
                        style: CustomStyle.textStyleInter.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: appColorExtension.primaryColor,
                        ),
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 14.w),
                    child: widget.suffixIcon,
                  );

    TextStyle _textStyle = CustomStyle.textStyleInter.copyWith(
      fontSize: 14.sp,
      color: widget.titleColor ?? appColorExtension.blackColor,
      fontWeight: FontWeight.w400,
    );

    InputDecoration? _inputDecoration = InputDecoration(
      contentPadding: widget.contentPadding ??
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      counterText: '',
      prefixIconConstraints: BoxConstraints(
        maxHeight: 25.h, //25
        minHeight: 10.h,
        minWidth: 25.w,
      ),
      suffixIconConstraints: BoxConstraints(
        maxHeight: 25.h,
        minHeight: 15.h,
        minWidth: 15.w,
      ),
      fillColor: widget.fillColor ?? appColorExtension.primaryColor,
      filled: true,
      suffix: widget.suffixWidget,
      prefix: widget.prefixWidget,
      suffixIcon: _suffixIcon,
      prefixIcon: widget.prefixIcon != null
          ? Padding(
              padding: EdgeInsets.only(
                left: 5.w,
                right: 10.w,
              ),
              child: widget.prefixIcon!,
            )
          : null,
      hintStyle: CustomStyle.textStyleInter.copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: widget.hintColor ?? appColorExtension.grey250,
      ),
      errorStyle: CustomStyle.textStyleInter.copyWith(
        color: appColorExtension.error600,
        fontSize: widget.errorFontSize.sp,
      ),
      hintText: widget.hintText ?? (isFocused.value ? "" : widget.fieldName),
      border: outlineInputBorder,
      errorBorder: outlineInputErrorBorder,
      focusedErrorBorder: outlineInputErrorBorder,
      focusedBorder: widget.shouldFocusWhenTyping
          ? outlineInputEnabledBorder
          : outlineInputBorder,
      enabledBorder: widget.isAutoFocus
          ? outlineInputEnabledBorder
          : widget.controller != null || widget.hasSelectedDropdownItem == true
              ? widget.controller!.text.isNotEmpty ||
                      widget.hasSelectedDropdownItem == true
                  ? widget.shouldFocusOnFilled
                      ? outlineInputEnabledBorder
                      : outlineInputBorder
                  : outlineInputBorder
              : outlineInputBorder,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.hasHeaderTitle)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: widget.headerTitleWidget ??
                    Text(
                      widget.headerTitle!,
                      style: CustomStyle.textStyleInter.copyWith(
                        fontWeight: widget.headerFontWeight ?? FontWeight.w400,
                        fontSize: widget.headerTitleFontSize ?? 14.sp,
                        color: widget.headerTitleColor ??
                            appColorExtension.grey100,
                      ),
                    ),
              ),
              if (widget.headerSuffix != null) widget.headerSuffix!,
            ],
          ),
        if (widget.subtitle != null)
          Text(
            widget.subtitle!,
            style: CustomStyle.textStyleInter.copyWith(
              fontSize: widget.subtitleTextSize,
              color: widget.subtitleColor ?? appColorExtension.blackColor,
            ),
          ),
        if (widget.hasHeaderTitle) const YMargin(5),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: widget.isValidatingField == false
                    ? widget.bottomMargin ?? 20.0.h
                    : widget.hasBottomMargin
                        ? 20.0.h
                        : 0,
              ),
              child: Focus(
                onFocusChange: (focus) {
                  isFocused.value = focus;
                },
                child: widget.isDropdownField
                    ? DropdownButtonFormField(
                        style: _textStyle,
                        onChanged: widget.onChanged,
                        isExpanded: true,
                        dropdownColor: appColorExtension.primaryColor,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: widget.onValidate,
                        onSaved: widget.onSaved,
                        onTap: widget.onTap,
                        icon: const SizedBox(),
                        decoration: _inputDecoration,
                        value: widget.selectedDropdownItem,
                        items: widget.customDropdownItems ??
                            List<DropdownMenuItem<dynamic>>.from(
                              widget.items.toSet().map(
                                (e) {
                                  return DropdownMenuItem(
                                    child: Text(
                                      e.toString(),
                                      style:
                                          CustomStyle.textStyleInter.copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12.sp,
                                        color: appColorExtension.blackColor,
                                      ),
                                    ),
                                    value: e,
                                  );
                                },
                              ),
                            ),
                      )
                    : TextFormField(
                        focusNode: widget.focusNode,
                        textAlign: widget.textAlign,
                        style: _textStyle,
                        onChanged: (value) async {
                          if (widget.onChanged != null) {
                            widget.onChanged!.call(value);
                          }
                        },
                        inputFormatters: widget.inputFormatters,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: widget.obscure || widget.showObscureIcon
                            ? isObscure.value
                            : false,
                        maxLines: widget.maxLines,
                        minLines: widget.minLines,
                        maxLength: widget.maxLength,
                        readOnly: widget.readOnly,
                        controller: widget.controller,
                        validator: widget.onValidate,
                        keyboardType: widget.inputType,
                        onSaved: widget.onSaved,
                        onEditingComplete: widget.editingComplete,
                        onTap: () {
                          if (widget.canTap == true) {
                            widget.onTap?.call();
                          }
                        },
                        decoration: _inputDecoration,
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
