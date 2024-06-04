import 'package:busha_mobile_test/core/services/remote/_default_repositories/_export_.dart';
import 'package:flutter/material.dart';

import '../../../handlers/_export_.dart';
import '../../../utils/_export_.dart';

class BaseChangeNotifier extends ChangeNotifier {
  late DialogHandler dialogHandler;
  late DashBoardRepository dashBoardRepositories;
  BaseChangeNotifier({
    DialogHandler? dialogHandler,
    DashBoardRepository? dashBoardRepositories,
  }) {
    this.dialogHandler = dialogHandler ?? locator();
    this.dashBoardRepositories = dashBoardRepositories ?? locator();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  void showToastMessage({
    required String message,
    required ResponseMessageType responseMessageType,
  }) {
    dialogHandler.showCustomTopToastDialog(
      message: message,
      responseMessageType: responseMessageType,
    );
  }

  ProjectTheme _activeTheme = ProjectTheme.systemDefaultTheme;
  ProjectTheme get activeTheme => _activeTheme;
  set activeTheme(ProjectTheme val) {
    _activeTheme = val;
    notifyListeners();
  }

  void log(Object? e) {
    AppLogger.log("$e");
  }
}
