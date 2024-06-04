import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '__export__.dart';

final appStateChangeNotifier = ChangeNotifierProvider<AppStateNotifier>((ref) {
  return AppStateNotifier();
});

class AppStateNotifier extends BaseChangeNotifier {
  DashboardPages _currentHomePageIndex = DashboardPages.explore;
  DashboardPages get currentHomePageIndex => _currentHomePageIndex;
  void changeCurrentHomePageIndex(DashboardPages newPage) {
    if (_currentHomePageIndex != newPage) {
      _currentHomePageIndex = newPage;
      notifyListeners();
    }
  }
}
