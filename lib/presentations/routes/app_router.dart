import 'package:auto_route/auto_route.dart';
import 'package:busha_mobile_test/presentations/routes/__export__.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: LoginScreen.page,
      path: Routes.loginScreenRoute,
    ),
    AutoRoute(
      page: DashBoardScreen.page,
      path: Routes.dashBoardScreenRoute,
    ),
    AutoRoute(
      page: TransactionScreen.page,
      path: Routes.transactionScreenRoute,
    ),
    AutoRoute(
      page: TransactionDetailScreen.page,
      path: Routes.transactionDetailScreenRoute,
    ),
    AutoRoute(
      page: NativeWebview.page,
      path: Routes.nativeWebViewScreenRoute,
    ),
  ];
}
