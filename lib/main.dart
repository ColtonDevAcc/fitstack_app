import 'package:FitStack/app/injection/state_providers.dart';
import 'package:FitStack/app/models/muscle/muscle_model.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/routing/app_router.dart';
import 'package:FitStack/app/services/analytics_service.dart';
import 'package:FitStack/app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'firebase_options.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart';

GetIt locator = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  locator.registerLazySingleton(() => AnalyticsService(debug: true));
  Hive.init(appDocumentDir.path);
  Hive
    ..registerAdapter(MuscleAdapter())
    ..registerAdapter(MuscleGroupAdapter());

  // ignore: prefer_const_constructors
  runApp(MyApp());
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
