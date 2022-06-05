import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fitstackapp/core/routing/appRouter.gr.dart';
import 'package:fitstackapp/core/theme/theme.dart';
import 'package:fitstackapp/features/login/presentation/login_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'core/theme/color_Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  final List views = const [
    Login_View(),
  ];

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return kDebugMode != true
        ? MaterialApp.router(
            theme: lightTheme,
            routerDelegate: _appRouter.delegate(
              navigatorObservers: () => [
                AutoRouteObserver(),
                observer,
                FirebaseAnalyticsObserver(analytics: analytics),
              ],
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            routeInformationProvider: _appRouter.routeInfoProvider(),
            darkTheme: FSColorTheme.Dark(context),
          )
        : MaterialApp.router(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: lightTheme,
            routerDelegate: _appRouter.delegate(
              navigatorObservers: () => [
                AutoRouteObserver(),
                observer,
                FirebaseAnalyticsObserver(analytics: analytics),
              ],
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            routeInformationProvider: _appRouter.routeInfoProvider(),
          );
  }
}
