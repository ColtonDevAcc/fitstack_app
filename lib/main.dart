import 'package:auto_route/auto_route.dart';
import 'package:fitstackapp/core/routing/appRouter.gr.dart';
import 'package:fitstackapp/features/login/presentation/login_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'core/theme/color_Theme.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List views = const [
    Login_View(),
  ];

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return kDebugMode != true
        ? MaterialApp.router(
            theme: FSColorTheme.Light(context),
            routerDelegate: _appRouter.delegate(
              navigatorObservers: () => [AutoRouteObserver()],
            ),
            routeInformationParser: _appRouter.defaultRouteParser(),
            routeInformationProvider: _appRouter.routeInfoProvider(),
            darkTheme: FSColorTheme.Dark(context),
          )
        : MaterialApp.router(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: FSColorTheme.Light(context),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            routeInformationProvider: _appRouter.routeInfoProvider(),
          );
  }
}
