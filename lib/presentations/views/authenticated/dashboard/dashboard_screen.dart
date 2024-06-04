import 'package:auto_route/auto_route.dart';
import 'package:busha_mobile_test/presentations/custom_designs/__export__.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../styles/_export_.dart';
import '../../../view_models/_default_viewmodel/__export__.dart';
import 'components/bottom_appbar_widget.dart';
import 'pages/__export__.dart';

@RoutePage(name: 'DashBoardScreen')
class DashBoardScreen extends HookConsumerWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final useAppStateChangeNotifier = ref.watch(appStateChangeNotifier);
    final appColorExtension = Theme.of(context).extension<AppColorExtension>()!;

    final List<Widget> pages = [
      const ExplorePage(),
      const PortfolioPage(),
      const EarnPage(),
      const SpendPage(),
      const ConnectPage(),
    ];

    return BaseScaffold(
      includeHorizontalPadding: false,
      safeTop: true,
      backgroundColor: appColorExtension.whiteColor,
      onWillPop: () {
        if (useAppStateChangeNotifier.currentHomePageIndex !=
            DashboardPages.explore) {
          useAppStateChangeNotifier
              .changeCurrentHomePageIndex(DashboardPages.explore);
        }
      },
      builder: (size, icontext) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child:
                  pages[useAppStateChangeNotifier.currentHomePageIndex.index],
            )
          ],
        );
      },
      bottomNavBar: BottomAppbarWidget(
          useAppStateChangeNotifier: useAppStateChangeNotifier),
    );
  }
}
