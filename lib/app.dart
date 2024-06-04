import 'package:busha_mobile_test/presentations/styles/_export_.dart';
import 'package:busha_mobile_test/presentations/view_models/_default_viewmodel/__export__.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'handlers/_export_.dart';
import 'presentations/routes/__export__.dart';
import 'utils/_export_.dart';

class App extends HookConsumerWidget {
  const App({Key? key, this.bannerTitle}) : super(key: key);
  final String? bannerTitle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = locator<AppRouter>();
    final appFlavour = locator<AppFlavor>();
    final useAppStateChangeNotifier = ref.watch(appStateChangeNotifier);
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    final localizationDelegate = LocalizedApp.of(context).delegate;
    final localizationState = LocalizationProvider.of(context).state;
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return LocalizationProvider(
          state: localizationState,
          child: MaterialApp.router(
            supportedLocales: localizationDelegate.supportedLocales,
            locale: localizationDelegate.currentLocale,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              localizationDelegate,
            ],
            routerConfig: appRouter.config(),
            debugShowCheckedModeBanner: false,
            title: 'Busha',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: useAppStateChangeNotifier.activeTheme ==
                    ProjectTheme.systemDefaultTheme
                ? isDarkMode
                    ? ThemeMode.dark
                    : ThemeMode.dark
                : useAppStateChangeNotifier.activeTheme ==
                        ProjectTheme.darkTheme
                    ? ThemeMode.dark
                    : ThemeMode.light,
            builder: (context, wg) {
              return Navigator(
                onGenerateRoute: (settings) => CupertinoPageRoute(
                  builder: (context) => DialogManager(
                    child: appFlavour == AppFlavor.production
                        ? wg!
                        : bannerTitle != null
                            ? Banner(
                                message: bannerTitle!,
                                location: BannerLocation.topEnd,
                                child: wg!,
                              )
                            : wg!,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
