// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../features/dashboard/presentation/dashboard_view.dart' as _i3;
import '../../features/login/presentation/login_view.dart' as _i1;
import '../../mainView.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    Login_ViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.Login_View());
    },
    MainViewRouter.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Main_View());
    },
    DashBoard_ViewRoute.name: (routeData) {
      final args = routeData.argsAs<DashBoard_ViewRouteArgs>(
          orElse: () => const DashBoard_ViewRouteArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.DashBoard_View(key: args.key));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(Login_ViewRoute.name, path: '/'),
        _i4.RouteConfig(MainViewRouter.name, path: '/mainView', children: [
          _i4.RouteConfig(DashBoard_ViewRoute.name,
              path: '', parent: MainViewRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.Login_View]
class Login_ViewRoute extends _i4.PageRouteInfo<void> {
  const Login_ViewRoute() : super(Login_ViewRoute.name, path: '/');

  static const String name = 'Login_ViewRoute';
}

/// generated route for
/// [_i2.Main_View]
class MainViewRouter extends _i4.PageRouteInfo<void> {
  const MainViewRouter({List<_i4.PageRouteInfo>? children})
      : super(MainViewRouter.name,
            path: '/mainView', initialChildren: children);

  static const String name = 'MainViewRouter';
}

/// generated route for
/// [_i3.DashBoard_View]
class DashBoard_ViewRoute extends _i4.PageRouteInfo<DashBoard_ViewRouteArgs> {
  DashBoard_ViewRoute({_i5.Key? key})
      : super(DashBoard_ViewRoute.name,
            path: '', args: DashBoard_ViewRouteArgs(key: key));

  static const String name = 'DashBoard_ViewRoute';
}

class DashBoard_ViewRouteArgs {
  const DashBoard_ViewRouteArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'DashBoard_ViewRouteArgs{key: $key}';
  }
}
