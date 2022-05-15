import 'package:fitstackapp/app/views/login/login_view.dart';
import 'package:fitstackapp/core/routing/appRouter.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

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

  @override
  Widget build(BuildContext context) {
    final _appRouter = AppRouter();

    return kDebugMode != true
        ? MaterialApp.router(
            theme: ThemeData(
              backgroundColor: Color.fromRGBO(249, 249, 249, 1),
              primaryColor: Colors.redAccent,
              colorScheme: ColorScheme(
                surface: Colors.white,
                background: Color.fromRGBO(249, 249, 249, 1),
                brightness: Brightness.light,
                error: Color.fromRGBO(242, 82, 82, 1),
                onBackground: Colors.black,
                onError: Colors.white,
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                onSurface: Colors.black,
                primary: Color.fromRGBO(254, 99, 71, 1),
                secondary: Color.fromRGBO(87, 54, 232, 1),
              ),
            ),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          )
        : MaterialApp.router(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              iconTheme: IconThemeData(color: Color.fromRGBO(112, 112, 112, 1)),
              backgroundColor: Color.fromRGBO(249, 249, 249, 1),
              primaryColor: Colors.redAccent,
              colorScheme: ColorScheme(
                surface: Colors.white,
                background: Color.fromRGBO(249, 249, 249, 1),
                brightness: Brightness.light,
                error: Color.fromRGBO(242, 82, 82, 1),
                onBackground: Colors.black,
                onError: Colors.white,
                onPrimary: Colors.white,
                onSecondary: Colors.white,
                onSurface: Colors.black,
                primary: Color.fromRGBO(254, 99, 71, 1),
                secondary: Color.fromRGBO(87, 54, 232, 1),
              ),
            ),
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
  }
}
