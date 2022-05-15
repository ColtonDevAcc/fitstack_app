// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../app/mainView.dart' as _i2;
import '../../app/views/login/login_view.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Login_ViewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Login_View());
    },
    Main_ViewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Main_View());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(Login_ViewRoute.name, path: '/'),
        _i3.RouteConfig(Main_ViewRoute.name, path: '/mainView')
      ];
}

/// generated route for
/// [_i1.Login_View]
class Login_ViewRoute extends _i3.PageRouteInfo<void> {
  const Login_ViewRoute() : super(Login_ViewRoute.name, path: '/');

  static const String name = 'Login_ViewRoute';
}

/// generated route for
/// [_i2.Main_View]
class Main_ViewRoute extends _i3.PageRouteInfo<void> {
  const Main_ViewRoute() : super(Main_ViewRoute.name, path: '/mainView');

  static const String name = 'Main_ViewRoute';
}
