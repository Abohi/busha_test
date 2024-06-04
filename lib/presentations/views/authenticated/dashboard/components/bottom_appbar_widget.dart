import 'package:busha_mobile_test/presentations/views/authenticated/dashboard/components/bottom_nav_widget.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:busha_mobile_test/utils/extension.dart';
import 'package:flutter/material.dart';

import '../../../../view_models/_default_viewmodel/__export__.dart';

class BottomAppbarWidget extends StatelessWidget {
  const BottomAppbarWidget({
    Key? key,
    required this.useAppStateChangeNotifier,
  }) : super(key: key);

  final AppStateNotifier useAppStateChangeNotifier;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      padding: const EdgeInsets.all(0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavWidget(
              title: DashboardPages.explore.titleCase.tr(),
              iconUrl: 'ic_explore',
              isActive: useAppStateChangeNotifier.currentHomePageIndex ==
                  DashboardPages.explore,
              onTap: () {
                useAppStateChangeNotifier
                    .changeCurrentHomePageIndex(DashboardPages.explore);
              },
            ),
            BottomNavWidget(
              title: DashboardPages.portfolio.titleCase.tr(),
              iconUrl: 'ic_portfolio',
              isActive: useAppStateChangeNotifier.currentHomePageIndex ==
                  DashboardPages.portfolio,
              onTap: () {
                useAppStateChangeNotifier
                    .changeCurrentHomePageIndex(DashboardPages.portfolio);
              },
            ),
            BottomNavWidget(
              title: DashboardPages.earn.titleCase.tr(),
              iconUrl: 'ic_earn',
              isActive: useAppStateChangeNotifier.currentHomePageIndex ==
                  DashboardPages.earn,
              onTap: () {
                useAppStateChangeNotifier
                    .changeCurrentHomePageIndex(DashboardPages.earn);
              },
            ),
            BottomNavWidget(
              title: DashboardPages.spend.titleCase.tr(),
              iconUrl: 'ic_spend',
              isActive: useAppStateChangeNotifier.currentHomePageIndex ==
                  DashboardPages.spend,
              onTap: () {
                useAppStateChangeNotifier
                    .changeCurrentHomePageIndex(DashboardPages.spend);
              },
            ),
            BottomNavWidget(
              title: DashboardPages.connect.titleCase.tr(),
              iconUrl: 'ic_connect',
              isActive: useAppStateChangeNotifier.currentHomePageIndex ==
                  DashboardPages.connect,
              onTap: () {
                useAppStateChangeNotifier
                    .changeCurrentHomePageIndex(DashboardPages.connect);
              },
            ),
          ],
        ),
      ),
    );
  }
}
