import 'dart:async';

import 'package:busha_mobile_test/models/modal_model/_export_.dart';
import 'package:flutter/material.dart';

import '../utils/_export_.dart';

class DialogHandler {
  static bool _isDialogVisible = false;
  static bool _canDismissDialog = false;
  static GenericDialogType? _genericDialogTypeOnDisplay;
  static final _dialogMemory = DialogStack<RequestModalModel>();

  static final instance = DialogHandler();

  late Function({
    RequestModalModel? requestModalModel,
  }) _globalProgressIndicator;

  late Function({
    required String message,
    required ResponseMessageType responseMessageType,
  }) _showCustomTopToast;

  late Function(
      {required Widget widget,
      required RequestModalModel requestModalModel}) _showWidgetDialog;

  late Function({required RequestModalModel requestModalModel})
      _showGenericActivityDialog;

  late Completer<Map<String, dynamic>> _genericActivityDialogCompleter;

  late Function(bool isDialogVisible, GenericDialogType? genericDialogType)
      _dismissDialog;

  void registerWidgetDialog(
      Function(
              {required Widget widget,
              required RequestModalModel requestModalModel})
          showWidgetDialog) {
    _showWidgetDialog = showWidgetDialog;
  }

  void showWidgetDialog({required Widget widget}) {
    RequestModalModel? requestModalModel = RequestModalModel.generate(
      genericDialogActivityType: GenericDialogActivityType.widgetDialog,
      defaultGenericDialogType: GenericDialogType.modalDialog,
    );

    /// NEW IMPL
    _dialogMemory.push(requestModalModel);

    _genericActivityDialogCompleter = Completer<Map<String, dynamic>>();
    _isDialogVisible = true;
    _canDismissDialog = true;
    _genericDialogTypeOnDisplay = requestModalModel.genericDialogType;

    _showWidgetDialog(widget: widget, requestModalModel: requestModalModel);
  }

  void registerCustomTopToastDialog(
      Function(
              {required String message,
              required ResponseMessageType responseMessageType})
          showCustomTopToast) {
    _showCustomTopToast = showCustomTopToast;
  }

  void showCustomTopToastDialog(
      {required String message,
      required ResponseMessageType responseMessageType}) {
    // _isDialogVisible = true;
    _showCustomTopToast(
      message: message,
      responseMessageType: responseMessageType,
    );
  }

  void registerGenericActivityDialog(
      Function({
        required RequestModalModel requestModalModel,
      }) genericActivityDialog) {
    _showGenericActivityDialog = genericActivityDialog;
  }

  Future<Map<String, dynamic>> showGenericActivityDialog({
    required RequestModalModel requestModalModel,
  }) {
    /// NEW IMPL
    _dialogMemory.push(requestModalModel);

    _genericActivityDialogCompleter = Completer<Map<String, dynamic>>();
    _isDialogVisible = true;
    if (requestModalModel.onlyDismissProgrammatically) {
      _canDismissDialog = false;
    } else {
      _canDismissDialog = true;
    }
    _genericDialogTypeOnDisplay = requestModalModel.genericDialogType;
    _showGenericActivityDialog(
      requestModalModel: requestModalModel,
    );
    return _genericActivityDialogCompleter.future;
  }

  void genericActivityDialogCompleter(
    Map<String, dynamic> responseData, {
    bool returnCompleter = true,
  }) {
    if (returnCompleter) {
      _genericActivityDialogCompleter.complete(responseData);
    }
    _isDialogVisible = false;
    _genericActivityDialogCompleter = Completer<Map<String, dynamic>>();
  }

  void registerDismissDialog(
      Function(bool isDialogVisible, GenericDialogType? genericDialogType,
              {bool dismissAllDialog})
          dismissDialog) {
    _dismissDialog = dismissDialog;
  }

  Future<void> dismissDialog({
    bool dismissAllDialog = false,
  }) async {
    _dismissDialog(
      _isDialogVisible,
      _genericDialogTypeOnDisplay,
    );
    _genericDialogTypeOnDisplay = null;
    _isDialogVisible = false;
    _canDismissDialog = true;
  }

  static void invalidateDialog() {
    _genericDialogTypeOnDisplay = null;
    _isDialogVisible = false;
    _canDismissDialog = true;
  }

  bool isDialogVisible() {
    return _dialogMemory.allItems.isNotEmpty;
  }

  static DialogStack<RequestModalModel> dialogMemory() {
    return _dialogMemory;
  }

  bool canDismissDialog() {
    return _canDismissDialog;
  }

  void registerGlobalProgressIndicatorDialog(
      Function({
        RequestModalModel? requestModalModel,
      }) globalProgressIndicator) {
    _globalProgressIndicator = globalProgressIndicator;
  }

  void showGlobalProgressIndicator({
    RequestModalModel? requestModalModel,
  }) {
    // dismissDialog();

    RequestModalModel? requestModalModel = RequestModalModel.generate(
      genericDialogActivityType:
          GenericDialogActivityType.globalProgressIndicator,
      defaultGenericDialogType: GenericDialogType.pageOverlayDialog,
    );

    /// NEW IMPL
    _dialogMemory.push(requestModalModel);

    _genericActivityDialogCompleter = Completer<Map<String, dynamic>>();
    _isDialogVisible = true;
    _canDismissDialog = false;
    // _genericDialogTypeOnDisplay = GenericDialogType.pageDialog;
    _genericDialogTypeOnDisplay = requestModalModel.genericDialogType;
    _globalProgressIndicator();
  }
}

class DialogStack<T> {
  final _list = <T>[];

  bool get isEmpty => _list.isEmpty;
  bool get isNotEmpty => _list.isNotEmpty;

  void push(T value) => _list.add(value);

  T? pop() => (isEmpty) ? null : _list.removeLast();

  T? popAtIndex(index) => (isEmpty) ? null : _list.removeAt(index);

  T? get peek => (isEmpty) ? null : _list.last;

  List<T> get allItems => _list;

  /// To Check list Content for Dry Run purposes
  @override
  String toString() => _list.toString();
}
