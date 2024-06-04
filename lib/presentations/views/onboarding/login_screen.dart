import 'package:auto_route/annotations.dart';
import 'package:busha_mobile_test/handlers/_export_.dart';
import 'package:busha_mobile_test/presentations/custom_designs/app_bar_widget.dart';
import 'package:busha_mobile_test/presentations/routes/__export__.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:busha_mobile_test/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/_export_.dart';
import '../../custom_designs/__export__.dart';
import '../../styles/_export_.dart';

@RoutePage(name: 'LoginScreen')
class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    final emailTextEditingController = useTextEditingController();
    final passwordTextEditingController = useTextEditingController();
    final _formKey = useMemoized(() => GlobalKey<FormState>());

    return BaseScaffold(
      includeHorizontalPadding: true,
      backgroundColor: appColorExtension.whiteColor,
      safeBottom: true,
      safeTop: true,
      builder: (size, icontext) {
        return Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBarWidget(),
              YMargin(16.h),
              Text(
                'Log in to your account'.tr(),
                style: CustomStyle.textStyleInter.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: appColorExtension.blackColor.withOpacity(0.95),
                ),
              ),
              YMargin(8.h),
              Text(
                'Welcome back! Please enter your registered email address to continue'
                    .tr(),
                style: CustomStyle.textStyleInter.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  color: appColorExtension.blackColor.withOpacity(0.60),
                ),
              ),
              YMargin(24.h),
              CustomInputfield(
                hintText: 'hello@busha.co'.tr(),
                headerTitle: 'Email address'.tr(),
                headerTitleColor: appColorExtension.grey100,
                hasHeaderTitle: true,
                bottomMargin: 16.h,
                inputType: TextInputType.text,
                controller: emailTextEditingController,
                isAutoFocus: false,
                hasInitialBorder: true,
                onValidate: Validators.validateRequired,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 12.w),
                initialBorderColor: appColorExtension.grey250,
                fillColor: appColorExtension.whiteColor,
                hintColor: appColorExtension.blackColor.withOpacity(0.32),
              ),
              CustomInputfield(
                hintText: 'Enter password'.tr(),
                headerTitle: 'Password'.tr(),
                headerTitleColor: appColorExtension.grey100,
                hasHeaderTitle: true,
                obscure: true,
                showObscureIcon: true,
                inputType: TextInputType.emailAddress,
                controller: passwordTextEditingController,
                onValidate: Validators.validateRequired,
                isAutoFocus: false,
                hasInitialBorder: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 0, horizontal: 12.w),
                initialBorderColor: appColorExtension.grey250,
                fillColor: appColorExtension.whiteColor,
                hintColor: appColorExtension.blackColor.withOpacity(0.32),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    buttonLabel: 'Continue'.tr(),
                    onTap: () {
                      if (!_formKey!.currentState!.validate()) {
                        return;
                      }
                      if (passwordTextEditingController.text.isEmpty ||
                          emailTextEditingController.text.isEmpty) {
                        return;
                      }
                      if (passwordTextEditingController.text.toString() !=
                          "password@1") {
                        locator<DialogHandler>().showCustomTopToastDialog(
                            message: "Password is not correct",
                            responseMessageType: ResponseMessageType.failure);
                        return;
                      }
                      if (emailTextEditingController.text.toString() !=
                          "evans@busha.co") {
                        locator<DialogHandler>().showCustomTopToastDialog(
                            message: "Email is not correct",
                            responseMessageType: ResponseMessageType.failure);
                        return;
                      }
                      locator<AppRouter>()
                          .navigateNamed(Routes.dashBoardScreenRoute);
                    },
                  ),
                ),
              ),
              YMargin(40.h)
            ],
          ),
        );
      },
    );
  }
}
