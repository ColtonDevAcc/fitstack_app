import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:fitstackapp/core/bloc/auth/auth_bloc.dart';
import 'package:fitstackapp/core/repository/auth_repository.dart';
import 'package:fitstackapp/core/routing/appRouter.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/theme/color_Theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  BlocOverrides.runZoned(
    () => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
        ],
        child: kDebugMode != true
            ? MaterialApp.router(
                theme: FSColorTheme.Light(context),
                darkTheme: FSColorTheme.Dark(context),
                routerDelegate: _appRouter.delegate(
                  navigatorObservers: () => [
                    AutoRouteObserver(),
                    observer,
                    FirebaseAnalyticsObserver(analytics: analytics),
                  ],
                ),
                routeInformationParser: _appRouter.defaultRouteParser(),
                routeInformationProvider: _appRouter.routeInfoProvider(),
              )
            : MaterialApp.router(
                theme: FSColorTheme.Light(context),
                darkTheme: FSColorTheme.Dark(context),
                useInheritedMediaQuery: true,
                locale: DevicePreview.locale(context),
                builder: DevicePreview.appBuilder,
                routerDelegate: _appRouter.delegate(
                  navigatorObservers: () => [
                    AutoRouteObserver(),
                    observer,
                    FirebaseAnalyticsObserver(analytics: analytics),
                  ],
                ),
                routeInformationParser: _appRouter.defaultRouteParser(),
                routeInformationProvider: _appRouter.routeInfoProvider(),
              ),
      ),
    );
  }
}

/// Custom [BlocObserver] that observes all bloc and cubit state changes.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (bloc is Cubit) print(change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
