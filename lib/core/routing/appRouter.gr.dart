// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../mainView.dart' as _i3;
import '../../presentation/dashboard/presentation/dashboard_view.dart' as _i4;
import '../../presentation/login/presentation/login_view.dart' as _i1;
import '../../presentation/settings/settings_view.dart' as _i5;
import '../../presentation/signup/presentation/signup_view.dart' as _i2;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Login_View.name: (routeData) {
      final args = routeData.argsAs<Login_ViewArgs>(
          orElse: () => const Login_ViewArgs());
      return _i6.MaterialPageX<String>(
          routeData: routeData, child: _i1.Login_View(key: args.key));
    },
    Signup.name: (routeData) {
      return _i6.MaterialPageX<String>(
          routeData: routeData, child: const _i2.SignUp_View());
    },
    MainViewRouter.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Main_View());
    },
    DashBoard_View.name: (routeData) {
      final args = routeData.argsAs<DashBoard_ViewArgs>(
          orElse: () => const DashBoard_ViewArgs());
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.DashBoard_View(key: args.key));
    },
    Settings_View.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.Settings_View());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(Login_View.name, path: '/', usesPathAsKey: true),
        _i6.RouteConfig(Signup.name, path: '/signup', usesPathAsKey: true),
        _i6.RouteConfig(MainViewRouter.name,
            path: '/mainView',
            usesPathAsKey: true,
            children: [
              _i6.RouteConfig(DashBoard_View.name,
                  path: 'DashBoard',
                  parent: MainViewRouter.name,
                  usesPathAsKey: true),
              _i6.RouteConfig(Settings_View.name,
                  path: 'Settings',
                  parent: MainViewRouter.name,
                  usesPathAsKey: true)
            ])
      ];
}

/// generated route for
/// [_i1.Login_View]
class Login_View extends _i6.PageRouteInfo<Login_ViewArgs> {
  Login_View({_i7.Key? key})
      : super(Login_View.name, path: '/', args: Login_ViewArgs(key: key));

  static const String name = 'Login_View';
}

class Login_ViewArgs {
  const Login_ViewArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'Login_ViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.SignUp_View]
class Signup extends _i6.PageRouteInfo<void> {
  const Signup() : super(Signup.name, path: '/signup');

  static const String name = 'Signup';
}

/// generated route for
/// [_i3.Main_View]
class MainViewRouter extends _i6.PageRouteInfo<void> {
  const MainViewRouter({List<_i6.PageRouteInfo>? children})
      : super(MainViewRouter.name,
            path: '/mainView', initialChildren: children);

  static const String name = 'MainViewRouter';
}

/// generated route for
/// [_i4.DashBoard_View]
class DashBoard_View extends _i6.PageRouteInfo<DashBoard_ViewArgs> {
  DashBoard_View({_i7.Key? key})
      : super(DashBoard_View.name,
            path: 'DashBoard', args: DashBoard_ViewArgs(key: key));

  static const String name = 'DashBoard_View';
}

class DashBoard_ViewArgs {
  const DashBoard_ViewArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'DashBoard_ViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.Settings_View]
class Settings_View extends _i6.PageRouteInfo<void> {
  const Settings_View() : super(Settings_View.name, path: 'Settings');

  static const String name = 'Settings_View';
}
