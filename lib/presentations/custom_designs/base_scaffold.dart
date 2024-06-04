import 'package:busha_mobile_test/handlers/_export_.dart';
import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    Key? key,
    required this.builder,
    this.appBar,
    this.scaffoldKey,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    this.safeTop = true,
    this.safeBottom = true,
    this.onWillPop,
    this.bottomNavBar,
    this.includeHorizontalPadding = true,
    this.floatingActionButton,
    this.childHasCustomHeader = false,
    this.useChildHeightWidth = false,
    this.persistenceFooter,
    this.bodyTapped,
  }) : super(key: key);

  final AppBar? appBar;
  final Key? scaffoldKey;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final Widget? persistenceFooter;
  final bool safeTop;
  final bool safeBottom;
  final VoidCallback? onWillPop;
  final Widget? bottomNavBar;
  final bool includeHorizontalPadding;
  final Widget? floatingActionButton;
  final bool childHasCustomHeader;
  final bool useChildHeightWidth;

  final Function()? bodyTapped;
  final Widget Function(Size size, BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    return LayoutBuilder(
      builder: (context, constraint) {
        Size constraints = Size(constraint.maxWidth, constraint.maxHeight);
        return WillPopScope(
          onWillPop: () async {
            final isDialogVisible = locator<DialogHandler>().isDialogVisible();
            final canDismissDialog =
                locator<DialogHandler>().canDismissDialog();

            if (canDismissDialog) {
              if (isDialogVisible) {
                locator<DialogHandler>().dismissDialog();
              } else {
                onWillPop?.call();
              }
            }

            return Future.value(true);
          },
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              bodyTapped?.call();
            },
            child: Scaffold(
              backgroundColor: backgroundColor ?? appColorExtension.whiteColor,
              key: scaffoldKey,
              appBar: appBar,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              bottomNavigationBar: bottomNavBar,
              floatingActionButton: floatingActionButton,
              persistentFooterButtons:
                  persistenceFooter == null ? null : [persistenceFooter!],
              body: SafeArea(
                top: childHasCustomHeader == true ? false : safeTop,
                bottom: safeBottom,
                child: Builder(
                  builder: (_) => Container(
                    width: constraints.width,
                    height: constraints.height,
                    margin: includeHorizontalPadding
                        ? EdgeInsets.symmetric(
                            horizontal: 16.w,
                          )
                        : EdgeInsets.zero,
                    child: builder(constraints, context),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
