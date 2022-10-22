import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/routing/navigation_observers.dart';
import 'package:FitStack/app/services/go_router_refresh_stream.dart';
import 'package:FitStack/presentation/mainView.dart';
import 'package:FitStack/presentation/dashboard/presentation/dashboard_view.dart';
import 'package:FitStack/presentation/login/presentation/login_page.dart';
import 'package:FitStack/presentation/nutrition/presentation/nutrition_view.dart';
import 'package:FitStack/presentation/profile/presentation/profile_view.dart';
import 'package:FitStack/presentation/relationship/presentation/organism/friends_relationship_view.dart';
import 'package:FitStack/presentation/relationship/presentation/relationship_view.dart';
import 'package:FitStack/presentation/settings/presentation/organisms/theme_page.dart';
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
  final AppBloc appBloc;
  AppRouter({required this.appBloc, required this.navigatorKey});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);
  late final router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: kDebugMode ? "/settings" : "/",
    refreshListenable: GoRouterRefreshStream(appBloc.stream),
    debugLogDiagnostics: true,
    observers: [
      if (!kDebugMode) GoRouterObserver(analytics: analytics),
    ],
    routes: [
      GoRoute(
        path: '/login',
        name: "login",
        builder: (context, state) => const Login_Page(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignUp_Page(),
      ),
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const Main_View(),
      ),
      GoRoute(
        path: '/dashBoard',
        name: "dashboard",
        builder: (context, state) => const DashboardView(),
      ),
      GoRoute(
        path: '/nutrition',
        name: "nutrition",
        builder: (context, state) => const NutritionView(),
      ),
      GoRoute(
        path: '/workout',
        name: "workout",
        builder: (context, state) => const WorkoutView(),
      ),
      GoRoute(
        path: '/settings',
        name: "settings",
        builder: (context, state) => const SettingsView(),
        routes: [
          GoRoute(
            path: 'theme',
            name: 'ThemeSettings ',
            builder: (context, state) => const ThemeSettingsPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/relationship',
        name: "relationship",
        builder: (context, state) => const RelationshipView(),
      ),
      GoRoute(
        path: '/friendship',
        name: "friendship",
        builder: (context, state) => const FriendsRelationshipView(),
      ),
      GoRoute(
        path: '/user',
        name: 'user',
        parentNavigatorKey: navigatorKey,
        builder: (context, state) => const ProfileView(),
      ),
    ],
    redirect: (context, state) {
      final bool isAuthenticated = appBloc.state.status == AuthenticationStatus.authenticated;
      if (state.location != "/signup" && !isAuthenticated && state.location != "/login" && !isAuthenticated) {
        return "/login";
      } else if (state.location == "/login" && isAuthenticated || state.location == "/signup" && isAuthenticated) {
        return "/";
      } else {
        return null;
      }
    },
  );
}
