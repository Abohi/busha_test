import 'package:busha_mobile_test/core/services/remote/_default_repositories/_export_.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../handlers/_export_.dart';
import '../presentations/routes/__export__.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({
  AppFlavor flavor = AppFlavor.dev,
}) async {
  locator.registerSingleton<AppFlavor>(flavor);

  //Register App Router
  final appRouter = AppRouter();
  locator.registerSingleton(appRouter);

  ///Handlers
  locator.registerLazySingleton<DialogHandler>(
    () => DialogHandler.instance,
  );

  locator.registerLazySingleton(
    () => Dio(),
  );

  ///Register Dashboard Repositories
  locator.registerLazySingleton<DashBoardRepository>(
    () => DashBoardRepository(),
  );

  // Register Dio and API Request Helpers
  // locator.registerLazySingleton<ApiRequestHelpers>(
  //   () => ApiRequestHelpers(
  //     dio: locator(),
  //     baseUrl: baseApi,
  //   ),
  // );
}
