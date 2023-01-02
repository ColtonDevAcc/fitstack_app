import 'dart:developer';

import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/services/analytics_service.dart';
import 'package:FitStack/app/services/go_router_refresh_stream.dart';
import 'package:FitStack/features/nutrition/presentation/views/nutrition_scan_view.dart';
import 'package:FitStack/features/statistics/ui/views/statistic_report_view.dart';
import 'package:FitStack/features/statistics/ui/views/statistic_view.dart';
import 'package:FitStack/features/workout/ui/views/create_workout_view.dart';
import 'package:FitStack/features/workout/ui/views/edit_exercise_view.dart';
import 'package:FitStack/features/workout/ui/views/exercise_list_view.dart';
import 'package:FitStack/pages/exercise_page.dart';
import 'package:FitStack/features/workout/ui/views/active_workout_view.dart';
import 'package:FitStack/pages/main_page.dart';
import 'package:FitStack/pages/dashboard_page.dart';
import 'package:FitStack/pages/login_page.dart';
import 'package:FitStack/pages/nutrition_page.dart';
import 'package:FitStack/pages/profile_page.dart';
import 'package:FitStack/features/relationship/presentation/organism/friends_relationship_view.dart';
import 'package:FitStack/pages/relationship_page.dart';
import 'package:FitStack/features/settings/presentation/organisms/theme_page.dart';
import 'package:FitStack/pages/settings_page.dart';
import 'package:FitStack/pages/signup_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

//flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
class AppRouter {
  final GlobalKey<NavigatorState>? navigatorKey;
  final AppBloc appBloc;
  AppRouter({required this.appBloc, required this.navigatorKey});

  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  late final router = GoRouter(
    navigatorKey: navigatorKey,
    refreshListenable: GoRouterRefreshStream(appBloc.stream),
    initialLocation: '/login',
    observers: [
      if (kDebugMode) GetIt.instance<AnalyticsService>(),
    ],
    routes: [
      GoRoute(
        path: '/login',
        name: "login",
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => const SignUpPage(),
      ),
      ShellRoute(
        navigatorKey: GlobalKey<NavigatorState>(),
        builder: (context, state, child) {
          return MainPage(
            onTap: (val) => GoRouter.of(context).goNamed(baseRouteNames.entries.firstWhere((element) => element.value == val).key),
            child: child,
          );
        },
        routes: [
          GoRoute(
            path: '/',
            name: 'home_page',
            builder: (context, state) => const SizedBox(),
            routes: [
              GoRoute(
                path: 'dashboard',
                name: "dashboard_page",
                pageBuilder: (context, state) => const NoTransitionPage(child: DashboardPage()),
                routes: [
                  GoRoute(
                    parentNavigatorKey: navigatorKey,
                    path: 'statistic_report',
                    name: 'statistic_report',
                    builder: (context, state) => const StatisticReportView(),
                  ),
                ],
              ),
              GoRoute(
                path: 'nutrition',
                name: "nutrition_page",
                pageBuilder: (context, state) => const NoTransitionPage(child: NutritionPage()),
                routes: [
                  GoRoute(
                    path: 'scan',
                    name: 'nutrition_scan_view',
                    builder: (context, state) => const NutritionScanView(),
                  ),
                ],
              ),
              GoRoute(
                path: 'exercise',
                name: "exercise_page",
                pageBuilder: (context, state) => const NoTransitionPage(child: ExercisePage()),
                routes: [
                  GoRoute(
                    path: 'workout',
                    name: 'workout_page',
                    builder: (context, state) => const WorkoutTabView(),
                    routes: [
                      GoRoute(
                        path: 'create',
                        name: 'create_workout_page',
                        builder: (context, state) => const CreateWorkoutView(),
                      ),
                    ],
                  ),
                  GoRoute(
                    path: 'exercises',
                    name: 'exercises',
                    builder: (context, state) => const ExerciseListView(),
                    routes: [
                      GoRoute(path: 'edit', name: 'edit', builder: (context, state) => const EditExerciseView()),
                    ],
                  ),
                ],
              ),
              GoRoute(
                path: 'relationship',
                name: "relationship_page",
                pageBuilder: (context, state) => const NoTransitionPage(child: RelationshipPage()),
              ),
              GoRoute(
                path: 'settings',
                name: "settings_page",
                pageBuilder: (context, state) => const NoTransitionPage(child: SettingsPage()),
                routes: [
                  GoRoute(
                    path: 'theme',
                    name: 'ThemeSettings ',
                    builder: (context, state) => const ThemeSettingsPage(),
                  ),
                ],
              ),
              GoRoute(
                path: 'friendship',
                name: "friendship",
                pageBuilder: (context, state) => const NoTransitionPage(child: FriendsRelationshipView()),
              ),
              GoRoute(
                path: 'user',
                name: 'user',
                builder: (context, state) => const ProfilePage(),
                routes: [
                  GoRoute(
                    path: 'statistic',
                    name: 'user statistic',
                    builder: (context, state) {
                      return StatisticView(data: state.extra! as List<Log>);
                    },
                  ),
                ],
              ),
            ],
          )
        ],
      )
    ],
    redirect: (context, state) {
      final bool isAuthenticated = appBloc.state.status == AuthenticationStatus.authenticated;
      if (state.location != "/signup" && !isAuthenticated && state.location != "/login" && !isAuthenticated) {
        return "/login";
      } else if (state.location == "/login" && isAuthenticated || state.location == "/signup" && isAuthenticated) {
        return "/dashboard";
      } else {
        return null;
      }
    },
  );
}

const Map<String, int> baseRouteNames = {
  'dashboard_page': 0,
  'nutrition_page': 1,
  'exercise_page': 2,
  'relationship_page': 3,
  'settings_page': 4,
};
