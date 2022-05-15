import 'package:fitstackapp/app/views/login/login_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List views = const [
    LoginView(),
  ];

  @override
  Widget build(BuildContext context) {
    return kDebugMode != true
        ? MaterialApp(
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
            home: views[0],
          )
        : MaterialApp(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
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
            home: views[0],
          );
  }
}
