// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

import '../../mainView.dart' as _i3;
import '../../presentation/dashboard/presentation/dashboard_view.dart' as _i5;
import '../../presentation/login/presentation/login_page.dart' as _i1;
import '../../presentation/nutrition/presentation/nutrition_view.dart' as _i6;
import '../../presentation/profile/presentation/profile_view.dart' as _i4;
import '../../presentation/relationship/presentation/relationship_view.dart'
    as _i9;
import '../../presentation/settings/settings_view.dart' as _i8;
import '../../presentation/signup/presentation/signup_page.dart' as _i2;
import '../../presentation/workout/presentation/workout_view.dart' as _i7;

class AppRouter extends _i10.RootStackRouter {
  AppRouter([_i11.GlobalKey<_i11.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    Login.name: (routeData) {
      final args = routeData.argsAs<LoginArgs>(orElse: () => const LoginArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.Login_Page(key: args.key),
      );
    },
    Signup.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SignUp_Page(),
      );
    },
    Main_View.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.Main_View(),
      );
    },
    Profile.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.ProfileView(),
      );
    },
    DashboardView.name: (routeData) {
      final args = routeData.argsAs<DashboardViewArgs>(
          orElse: () => const DashboardViewArgs());
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.DashboardView(key: args.key),
      );
    },
    NutritionView.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.NutritionView(),
      );
    },
    WorkoutView.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.WorkoutView(),
      );
    },
    SettingsView.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.SettingsView(),
      );
    },
    RelationshipView.name: (routeData) {
      return _i10.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.RelationshipView(),
      );
    },
  };

  @override
  List<_i10.RouteConfig> get routes => [
        _i10.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'auth',
          fullMatch: true,
        ),
        _i10.RouteConfig(
          Login.name,
          path: 'auth',
        ),
        _i10.RouteConfig(
          Signup.name,
          path: 'auth/signup',
        ),
        _i10.RouteConfig(
          Main_View.name,
          path: '/mainView',
          children: [
            _i10.RouteConfig(
              DashboardView.name,
              path: 'DashBoard',
              parent: Main_View.name,
            ),
            _i10.RouteConfig(
              NutritionView.name,
              path: 'Nutrition',
              parent: Main_View.name,
            ),
            _i10.RouteConfig(
              WorkoutView.name,
              path: 'Workout',
              parent: Main_View.name,
            ),
            _i10.RouteConfig(
              SettingsView.name,
              path: 'Settings',
              parent: Main_View.name,
            ),
            _i10.RouteConfig(
              RelationshipView.name,
              path: 'Relationship',
              parent: Main_View.name,
            ),
          ],
        ),
        _i10.RouteConfig(
          Profile.name,
          path: 'user/profile',
        ),
      ];
}

/// generated route for
/// [_i1.Login_Page]
class Login extends _i10.PageRouteInfo<LoginArgs> {
  Login({_i11.Key? key})
      : super(
          Login.name,
          path: 'auth',
          args: LoginArgs(key: key),
        );

  static const String name = 'Login';
}

class LoginArgs {
  const LoginArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'LoginArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.SignUp_Page]
class Signup extends _i10.PageRouteInfo<void> {
  const Signup()
      : super(
          Signup.name,
          path: 'auth/signup',
        );

  static const String name = 'Signup';
}

/// generated route for
/// [_i3.Main_View]
class Main_View extends _i10.PageRouteInfo<void> {
  const Main_View({List<_i10.PageRouteInfo>? children})
      : super(
          Main_View.name,
          path: '/mainView',
          initialChildren: children,
        );

  static const String name = 'Main_View';
}

/// generated route for
/// [_i4.ProfileView]
class Profile extends _i10.PageRouteInfo<void> {
  const Profile()
      : super(
          Profile.name,
          path: 'user/profile',
        );

  static const String name = 'Profile';
}

/// generated route for
/// [_i5.DashboardView]
class DashboardView extends _i10.PageRouteInfo<DashboardViewArgs> {
  DashboardView({_i11.Key? key})
      : super(
          DashboardView.name,
          path: 'DashBoard',
          args: DashboardViewArgs(key: key),
        );

  static const String name = 'DashboardView';
}

class DashboardViewArgs {
  const DashboardViewArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'DashboardViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.NutritionView]
class NutritionView extends _i10.PageRouteInfo<void> {
  const NutritionView()
      : super(
          NutritionView.name,
          path: 'Nutrition',
        );

  static const String name = 'NutritionView';
}

/// generated route for
/// [_i7.WorkoutView]
class WorkoutView extends _i10.PageRouteInfo<void> {
  const WorkoutView()
      : super(
          WorkoutView.name,
          path: 'Workout',
        );

  static const String name = 'WorkoutView';
}

/// generated route for
/// [_i8.SettingsView]
class SettingsView extends _i10.PageRouteInfo<void> {
  const SettingsView()
      : super(
          SettingsView.name,
          path: 'Settings',
        );

  static const String name = 'SettingsView';
}

/// generated route for
/// [_i9.RelationshipView]
class RelationshipView extends _i10.PageRouteInfo<void> {
  const RelationshipView()
      : super(
          RelationshipView.name,
          path: 'Relationship',
        );

  static const String name = 'RelationshipView';
}
