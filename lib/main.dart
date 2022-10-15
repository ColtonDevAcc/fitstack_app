import 'dart:developer';

import 'package:FitStack/app/injection/dependency_injection.dart';
import 'package:FitStack/app/injection/development_dependencies.dart';
import 'package:FitStack/app/injection/state_providers.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/routing/app_router.dart';
import 'package:FitStack/app/theme/color_Theme.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'firebase_options.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(storageDirectory: kIsWeb ? HydratedStorage.webStorageDirectory : await getTemporaryDirectory());
  await DevelopmentDependencies().init();

  HydratedBlocOverrides.runZoned(
    () async {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      runApp(MyApp());
    },
    storage: storage,
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey(debugLabel: "ScaffoldMessengerKey");
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: "GlobalNavigatorKey");
    return StateProviders(
      child: BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          log("hot reload");
          if (state.status != AuthenticationStatus.authenticated) {
            getIt<AuthenticationRepository>().persistLogin();
          }
          final router = AppRouter(authStatus: state.status, navigatorKey: navigatorKey);
          return MaterialApp.router(
            scaffoldMessengerKey: scaffoldMessengerKey,
            theme: FSColorTheme.Light(context),
            darkTheme: FSColorTheme.Dark(context),
            routerDelegate: router.router.routerDelegate,
            routeInformationParser: router.router.routeInformationParser,
            routeInformationProvider: router.router.routeInformationProvider,
          );
        },
      ),
    );
  }
}

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
