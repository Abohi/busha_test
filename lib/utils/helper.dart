import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:flutter/material.dart';

class Helper {
  static GenericDialogType getDialogTypeByCategory(
      GenericDialogActivityType genericDialogActivityType) {
    switch (genericDialogActivityType) {
      case GenericDialogActivityType.globalProgressIndicator:
        return GenericDialogType.pageDialog;
      case GenericDialogActivityType.successDialog:
        return GenericDialogType.modalDialog;
      case GenericDialogActivityType.logout:
      case GenericDialogActivityType.searchableListDialog:
        return GenericDialogType.bottomSheetDialog;
      default:
        return GenericDialogType.modalDialog;
    }
  }

  static Map<String, dynamic> getToastColor(
      ResponseMessageType toastType, BuildContext context) {
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;
    switch (toastType) {
      case ResponseMessageType.failure:
        return {
          'text': appColorExtension.error600,
          'bgColor': appColorExtension.error25,
          'borderColor': appColorExtension.error600
        };
      case ResponseMessageType.success:
        return {
          'text': appColorExtension.success400,
          'bgColor': appColorExtension.success50,
          'borderColor': appColorExtension.success500
        };
      case ResponseMessageType.warning:
        return {
          'text': appColorExtension.warning500,
          'bgColor': appColorExtension.warning50,
          'borderColor': appColorExtension.warning600
        };
      default:
        return {};
    }
  }

  static String formatCurrency(
    String? price, {
    bool includeKoboBalance = true,
    bool showOnlyKobo = false,
  }) {
    try {
      if (price!.length > 2) {
        var value = price;
        var nairaValue = "0";
        var koboValue = "00";
        List<String> formatableValue = [];

        try {
          value = double.parse(value).toString();
        } catch (e) {
          AppLogger.log(e);
        }

        if (value.contains(".")) {
          formatableValue = (value.split("."));
          nairaValue = formatableValue[0];
          koboValue = formatableValue[1];
        } else {
          nairaValue = value;
        }

        if (showOnlyKobo) {
          return koboValue.padLeft(2, "0");
        } else {
          value = nairaValue.replaceAll(RegExp(r'\D'), '');
          value = nairaValue.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');
          //printInDebug(value.toString());
          String _fvalue = value + "." + koboValue.toString().padRight(2, '0');
          if (includeKoboBalance) {
            return _fvalue;
          } else {
            return value;
          }
        }
      }
      return price;
    } catch (e) {
      return "0";
    }
  }
}
