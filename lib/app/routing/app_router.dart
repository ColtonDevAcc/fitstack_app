import 'dart:developer';

import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/routing/navigation_observers.dart';
import 'package:FitStack/presentation/mainView.dart';
import 'package:FitStack/presentation/dashboard/presentation/dashboard_view.dart';
import 'package:FitStack/presentation/login/presentation/login_page.dart';
import 'package:FitStack/presentation/nutrition/presentation/nutrition_view.dart';
import 'package:FitStack/presentation/profile/presentation/profile_view.dart';
import 'package:FitStack/presentation/relationship/presentation/organism/friends_relationship_view.dart';
import 'package:FitStack/presentation/relationship/presentation/relationship_view.dart';
import 'package:FitStack/presentation/settings/settings_view.dart';
import 'package:FitStack/presentation/signup/presentation/signup_page.dart';
import 'package:FitStack/presentation/workout/presentation/workout_view.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

//flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey;
  final AuthenticationStatus authStatus;
  AppRouter({required this.navigatorKey, required this.authStatus});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  late final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: kDebugMode ? '/' : '/',
    observers: [
      GoRouterObserver(analytics: analytics),
    ],
    redirect: (context, state) {
      final bool isAuthenticated = authStatus == AuthenticationStatus.authenticated;
      if (state.location != "/signup" && !isAuthenticated && state.location != "/login" && !isAuthenticated) {
        return "/login";
      } else if (state.location == "/login" && isAuthenticated || state.location == "/signup" && isAuthenticated) {
        log("${state.location} this was hit ${state.location == "/login" && isAuthenticated || state.location == "/signup" && isAuthenticated}");
        return "/";
      } else {
        return null;
      }
    },
    routes: [
      GoRoute(
        path: '/login',
        name: "login",
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const Login_Page(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const SignUp_Page(),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const Main_View(),
      ),
      GoRoute(
        path: '/dashBoard',
        name: "dashboard",
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: '/nutrition',
        name: "nutrition",
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const NutritionView(),
      ),
      GoRoute(
        path: '/workout',
        name: "workout",
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const WorkoutView(),
      ),
      GoRoute(
        path: '/settings',
        name: "settings",
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const SettingsView(),
      ),
      GoRoute(
        path: '/relationship',
        name: "relationship",
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const RelationshipView(),
      ),
      GoRoute(
        path: '/friendship',
        name: "friendship",
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const FriendsRelationshipView(),
      ),
      GoRoute(
        path: '/user/profile',
        name: 'profile',
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const ProfileView(),
      ),
    ],
  );
}
