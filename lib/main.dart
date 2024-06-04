import 'package:busha_mobile_test/app.dart';
import 'package:busha_mobile_test/utils/_export_.dart';
import 'package:busha_mobile_test/utils/localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main({
  bool tourLaunch = false,
}) async {
  WidgetsFlutterBinding.ensureInitialized();

  final delegate = await LocalizationDelegate.create(
    fallbackLocale: 'en',
    preferences: TranslatePreferences(),
    supportedLocales: ['en'],
  );

  await setupLocator(
    flavor: AppFlavor.dev,
  );
  await dotenv.load(fileName: ".env");
  AppLogger.setLogger(showLogs: true);

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (val) {
      runApp(
        LocalizedApp(
          delegate,
          const ProviderScope(
            child: App(
              bannerTitle: 'DEV',
            ),
          ),
        ),
      );
    },
  );
}
