import 'dart:io';

import 'package:FitStack/app/helpers/firebase_init.dart';
import 'package:FitStack/app/injection/state_providers.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/routing/app_router.dart';
import 'package:FitStack/app/theme/color_Theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (const bool.fromEnvironment("USE_FIREBASE_EMU")) {
    await FitStackFirebase.configureFirebaseAuth();
    await FitStackFirebase.configureFirebaseStorage();
    FitStackFirebase.configureFirebaseFirestore();
  } else {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }

  if (!kDebugMode) FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({key}) : super(key: key);

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
          if (router == null) {
            router = AppRouter(navigatorKey: navigatorKey, appBloc: context.read<AppBloc>());
          }

          return MaterialApp.router(
            routerConfig: router?.router,
            theme: FSColorTheme.Light(context),
            darkTheme: FSColorTheme.Light(context),
          );
        },
      ),
    );
  }
}
