import 'package:FitStack/app/bloc/app_bloc.dart';
import 'package:FitStack/app/injection/dependency_injection.dart';
import 'package:FitStack/app/injection/development_dependencies.dart';
import 'package:FitStack/app/injection/state_providers.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/repository/user_repository.dart';
import 'package:FitStack/app/routing/appRouter.gr.dart';
import 'package:FitStack/app/theme/color_Theme.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'firebase_options.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory());
  await DevelopmentDependencies().init();

  HydratedBlocOverrides.runZoned(
    () async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      runApp(
        MyApp(),
      );
    },
    storage: storage,
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    getIt<AuthenticationRepository>().persistLogin();

    return StateProviders(
      child: MaterialApp.router(
        //TODO: make this bloc dep injec
        theme: FSColorTheme.Light(context),
        darkTheme: FSColorTheme.Dark(context),
        useInheritedMediaQuery: true,
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
