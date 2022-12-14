import 'package:FitStack/app/injection/state_providers.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/routing/app_router.dart';
import 'package:FitStack/app/services/analytics_service.dart';
import 'package:FitStack/app/theme/color_theme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';

GetIt locator = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (!kDebugMode) {
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    FirebasePerformance.instance;
    FirebaseAnalytics.instance;
    FirebaseAuth.instance;
  } else {
    FirebasePerformance.instance;
    FirebaseAnalytics.instance;
    FirebaseAuth.instance;
  }

  locator.registerLazySingleton(() => AnalyticsService(debug: true));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  AppRouter? router;

  @override
  Widget build(BuildContext context) {
    return StateProviders(
      child: Builder(
        builder: (context) {
          router ??= AppRouter(navigatorKey: navigatorKey, appBloc: context.read<AppBloc>());

          return MaterialApp.router(
            routerConfig: router?.router,
            theme: FSColorTheme.light(context),
            darkTheme: FSColorTheme.light(context),
          );
        },
      ),
    );
  }
}
