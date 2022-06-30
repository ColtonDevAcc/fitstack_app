// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../../features/dashboard/presentation/dashboard_view.dart' as _i4;
import '../../features/login/presentation/login_view.dart' as _i1;
import '../../features/signup/presentation/signup_view.dart' as _i2;
import '../../mainView.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    Login_View.name: (routeData) {
      return _i5.MaterialPageX<String>(
          routeData: routeData, child: const _i1.Login_View());
    },
    Signup.name: (routeData) {
      return _i5.MaterialPageX<String>(
          routeData: routeData, child: const _i2.SignUp_View());
    },
    MainViewRouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Main_View());
    },
    DashBoard_View.name: (routeData) {
      final args = routeData.argsAs<DashBoard_ViewArgs>(
          orElse: () => const DashBoard_ViewArgs());
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.DashBoard_View(key: args.key));
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(Login_View.name, path: '/'),
        _i5.RouteConfig(Signup.name, path: '/signup'),
        _i5.RouteConfig(MainViewRouter.name, path: '/mainView', children: [
          _i5.RouteConfig(DashBoard_View.name,
              path: '', parent: MainViewRouter.name)
        ])
      ];
}

/// generated route for
/// [_i1.Login_View]
class Login_View extends _i5.PageRouteInfo<void> {
  const Login_View() : super(Login_View.name, path: '/');

  static const String name = 'Login_View';
}

/// generated route for
/// [_i2.SignUp_View]
class Signup extends _i5.PageRouteInfo<void> {
  const Signup() : super(Signup.name, path: '/signup');

  static const String name = 'Signup';
}

/// generated route for
/// [_i3.Main_View]
class MainViewRouter extends _i5.PageRouteInfo<void> {
  const MainViewRouter({List<_i5.PageRouteInfo>? children})
      : super(MainViewRouter.name,
            path: '/mainView', initialChildren: children);

  static const String name = 'MainViewRouter';
}

/// generated route for
/// [_i4.DashBoard_View]
class DashBoard_View extends _i5.PageRouteInfo<DashBoard_ViewArgs> {
  DashBoard_View({_i6.Key? key})
      : super(DashBoard_View.name,
            path: '', args: DashBoard_ViewArgs(key: key));

  static const String name = 'DashBoard_View';
}

class DashBoard_ViewArgs {
  const DashBoard_ViewArgs({this.key});

  final _i6.Key? key;

  @override
  String toString() {
    return 'DashBoard_ViewArgs{key: $key}';
  }
}
