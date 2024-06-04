import 'package:busha_mobile_test/models/modal_model/list_model.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:flutter/material.dart';

class RequestModalModel {
  final String? title;
  final String? searchTitle;
  final double containerHeight;
  final Map<String, dynamic>? requestMap;
  final List<ListModel>? listModel;
  final GenericDialogActivityType genericDialogActivityType;
  final GenericDialogType? genericDialogType;
  final Widget? customWidget;
  final Widget? customActions;
  final bool onlyDismissProgrammatically;
  final bool popAllActiveDialog;

  RequestModalModel({
    this.title,
    this.searchTitle,
    this.listModel,
    this.containerHeight = 230,
    this.requestMap,
    required this.genericDialogActivityType,
    this.genericDialogType,
    this.customWidget,
    this.customActions,
    this.onlyDismissProgrammatically = false,
    this.popAllActiveDialog = false,
  });
  factory RequestModalModel.generate({
    required GenericDialogActivityType genericDialogActivityType,
    String? title,
    String? searchTitle,
    final Map<String, dynamic>? requestMap,
    double containerHeight = 230,
    Widget? customWidget,
    Widget? customActions,
    int? designType,
    GenericDialogType? defaultGenericDialogType,
    List<ListModel>? listModel,
    bool onlyDismissProgrammatically = false,
    bool popAllActiveDialog = false,
  }) {
    final GenericDialogType? genericDialogType;
    if (defaultGenericDialogType == null) {
      genericDialogType =
          Helper.getDialogTypeByCategory(genericDialogActivityType);
    } else {
      genericDialogType = defaultGenericDialogType;
    }

    return RequestModalModel(
      genericDialogActivityType: genericDialogActivityType,
      title: title,
      searchTitle: searchTitle,
      listModel: listModel,
      genericDialogType: genericDialogType,
      containerHeight: containerHeight,
      requestMap: requestMap,
      customWidget: customWidget,
      customActions: customActions,
      onlyDismissProgrammatically: onlyDismissProgrammatically,
      popAllActiveDialog: popAllActiveDialog,
    );
  }
}
