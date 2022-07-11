import 'package:FitStack/app/bloc/app_bloc.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/routing/appRouter.gr.dart';
import 'package:FitStack/app/theme/color_Theme.dart';
import 'package:FitStack/presentation/signup/cubit/signup_cubit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() {
  return BlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      final authenticationRepository = AuthenticationRepository();
      await authenticationRepository.user.first;
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
      runApp(
        MyApp(authenticationRepository: authenticationRepository),
      );
    },
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;

  MyApp({required this.authenticationRepository, key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignupCubit(
              authenticationRepository: authenticationRepository,
            ),
          ),
          BlocProvider(
            create: (context) => AppBloc(
              authenticationRepository: authenticationRepository,
            ),
          ),
        ],
        child: MaterialApp.router(
          //TODO: make this bloc dep injec
          theme: FSColorTheme.Light(context),
          darkTheme: FSColorTheme.Dark(context),
          useInheritedMediaQuery: true,
          //!
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
