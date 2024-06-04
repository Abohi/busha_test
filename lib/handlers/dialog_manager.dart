import 'package:another_flushbar/flushbar.dart';
import 'package:busha_mobile_test/handlers/_export_.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/modal_model/_export_.dart';
import '../presentations/custom_designs/gradient_circular_progress_indicator.dart';
import '../presentations/styles/_export_.dart';

class DialogManager extends StatefulWidget {
  final Widget child;

  const DialogManager({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<DialogManager> createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  late DialogHandler _dialogHandler;
  OverlayEntry? _overlayEntry;

  @override
  void initState() {
    super.initState();

    // _dialogHandler = locator<DialogHandler>();
    _dialogHandler = DialogHandler.instance;
    _dialogHandler.registerCustomTopToastDialog(showCustomTopToast);
    _dialogHandler.registerWidgetDialog(showWidgetDialog);
    _dialogHandler.registerGenericActivityDialog(showGenericActivityDialog);
    _dialogHandler.registerDismissDialog(dismissDialog);
    _dialogHandler.registerGlobalProgressIndicatorDialog(showGlobalIndicator);
  }

  void showGlobalIndicator({
    RequestModalModel? requestModalModel,
  }) {
    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        color: Colors.black.withOpacity(.65),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GradientCircularProgressIndicator(
                value: 0.9,
                size: 100.0,
                strokeWidth: 15.0,
              )
            ],
          ),
        ),
      ),
    );

    if (_overlayEntry != null) {
      Overlay.of(context).insert(_overlayEntry!);
    }
  }

  void showCustomTopToast({
    required String message,
    required ResponseMessageType responseMessageType,
  }) async {
    await Flushbar(
      messageText: Text(
        message,
        style: CustomStyle.textStyleInter.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color: Helper.getToastColor(responseMessageType, context)['text'],
        ),
      ),
      icon: SvgPicture.asset(
        "ic_warning_icon".svg,
        colorFilter: ColorFilter.mode(
            Helper.getToastColor(responseMessageType, context)['borderColor'],
            BlendMode.srcIn),
      ),
      flushbarStyle: FlushbarStyle.GROUNDED,
      titleSize: 14.sp,
      borderRadius: BorderRadius.circular(16.r),
      duration: const Duration(seconds: 2, milliseconds: 300),
      flushbarPosition: FlushbarPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      backgroundColor: Colors.transparent,
      borderColor:
          Helper.getToastColor(responseMessageType, context)['borderColor'],
      animationDuration: const Duration(milliseconds: 400),
    ).show(context);
  }

  void showWidgetDialog({
    required Widget widget,
    required RequestModalModel requestModalModel,
  }) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                width: MediaQuery.of(context).size.width,
                child: widget,
              )
            ],
          ),
        );
      },
    ).then((value) async {
      if (value == null) {
        _dialogHandler
            .genericActivityDialogCompleter({}, returnCompleter: false);
      }
    });
  }

  void showGenericActivityDialog({
    required RequestModalModel requestModalModel,
  }) async {
    switch (requestModalModel.genericDialogType) {
      case GenericDialogType.bottomSheetDialog:
      case GenericDialogType.modalDialog:
        showSheetActivityDialog(
          requestModalModel: requestModalModel,
        );
        break;
      case GenericDialogType.pageDialog:
        showFullPageDialog(requestModalModel: requestModalModel);
        break;
      case GenericDialogType.pageOverlayDialog:
        _overlayEntry = OverlayEntry(
          builder: (context) => Material(
            color: Colors.black.withOpacity(0.2),
            child: InkWell(
              onTap: () {
                // _overlayEntry?.remove();
                if (requestModalModel.onlyDismissProgrammatically == false) {
                  dismissDialog(true, requestModalModel.genericDialogType);
                }
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                child: getDialogActivityByType(
                  genericDialogActivityType:
                      requestModalModel.genericDialogActivityType,
                  context: context,
                  requestModalModel: requestModalModel,
                ),
              ),
            ),
          ),
        );

        if (_overlayEntry != null) {
          Overlay.of(context).insert(_overlayEntry!);
        }
        break;
      default:
        break;
    }
  }

  Future<void> showFullPageDialog({
    required RequestModalModel requestModalModel,
  }) async {
    await showGeneralDialog(
      context: context,
      // transitionDuration: const Duration(milliseconds: 2),
      barrierDismissible: false,
      pageBuilder: (context, __, ___) {
        return Material(
          color: Colors.black.withOpacity(.45),
          child: getDialogActivityByType(
            genericDialogActivityType:
                requestModalModel.genericDialogActivityType,
            context: context,
            requestModalModel: requestModalModel,
          ),
        );
      },
    ).then((value) async {
      if (value == null) {
        _dialogHandler
            .genericActivityDialogCompleter({}, returnCompleter: false);
      }
    });
  }

  Future<void> showSheetActivityDialog({
    required RequestModalModel requestModalModel,
  }) async {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    switch (requestModalModel.genericDialogActivityType) {
      case GenericDialogActivityType.searchableListDialog:
        return await showModalBottomSheet(
            context: context,
            backgroundColor: appColorExtension.whiteColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r))),
            builder: (context) {
              return SizedBox.shrink();
            });
      case GenericDialogActivityType.successDialog:
        return await showDialog(
          context: context,
          builder: (context) {
            return SizedBox.shrink();
          },
        ).then((value) async {
          if (value == null) {
            _dialogHandler
                .genericActivityDialogCompleter({}, returnCompleter: false);
          }
        });
      default:
        break;
    }
  }

  Widget getDialogActivityByType({
    required GenericDialogActivityType genericDialogActivityType,
    required BuildContext context,
    required RequestModalModel requestModalModel,
  }) {
    switch (genericDialogActivityType) {
      case GenericDialogActivityType.successDialog:
        return SizedBox.shrink();
      default:
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: Colors.red,
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: InkWell(
                  onTap: () {
                    _dialogHandler
                        .genericActivityDialogCompleter({'Hello': 'World'});
                    // _overlayEntry?.remove();
                    dismissDialog(true, requestModalModel.genericDialogType,
                        dismissWithCompleter: false);
                  },
                  child: const Text('Hello world'),
                ),
              ),
            ],
          ),
        );
    }
  }

  void _singleDialogDismiss({
    bool dismissWithCompleter = true,
  }) {
    DialogStack<RequestModalModel> dialogMemory = DialogHandler.dialogMemory();

    RequestModalModel? _dMemory;

    List<RequestModalModel> allAvailableDialogs = dialogMemory.allItems;

    for (RequestModalModel requestModalModel in allAvailableDialogs) {
      int index = allAvailableDialogs.indexOf(requestModalModel);
      if (requestModalModel.genericDialogType ==
          GenericDialogType.pageOverlayDialog) {
        _dMemory = dialogMemory.popAtIndex(index);
        break;
      }
    }

    _dMemory ??= dialogMemory.pop();

    if (_dMemory != null) {
      if (_dMemory.genericDialogType != GenericDialogType.pageOverlayDialog) {
        if (Navigator.canPop(context)) {
          _dialogHandler
              .genericActivityDialogCompleter({}, returnCompleter: false);
          Navigator.of(context).pop(false);
        }
      } else {
        if (_overlayEntry != null) {
          if (dismissWithCompleter) {
            _dialogHandler.genericActivityDialogCompleter({'Hello': 'World'});
          }
          _overlayEntry?.remove();
        }
      }
    }
  }

  void dismissDialog(
    isDialogVisible,
    genericDialogTypeOnDisplay, {
    bool dismissWithCompleter = true,
    bool dismissAllDialog = false,
  }) {
    if (dismissAllDialog) {
      DialogStack<RequestModalModel> dialogMemory =
          DialogHandler.dialogMemory();
      int totalAvailableDialogs = dialogMemory.allItems.length;

      /// LOOP THROUGH ALL AVAILABLE DIALOG TO DISMISS
      for (int i = 0; i < totalAvailableDialogs; i++) {
        _singleDialogDismiss();
      }
    } else {
      _singleDialogDismiss();
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
