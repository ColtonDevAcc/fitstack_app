import 'package:FitStack/app/models/logs/log_model.dart';
import 'package:FitStack/app/providers/bloc/app/app_bloc.dart';
import 'package:FitStack/app/repository/auth_repository.dart';
import 'package:FitStack/app/services/analytics_service.dart';
import 'package:FitStack/app/services/go_router_refresh_stream.dart';
import 'package:FitStack/features/nutrition/presentation/views/nutrition_scan_view.dart';
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
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: '/dashBoard',
        name: "dashboard",
        builder: (context, state) => const DashboardPage(),
      ),
      GoRoute(
        path: '/nutrition',
        name: "nutrition",
        builder: (context, state) => const NutritionPage(),
        routes: [
          GoRoute(
            path: 'scan',
            name: 'nutrition scan',
            builder: (context, state) => const NutritionScanView(),
          ),
        ],
      ),
      GoRoute(
        path: '/exercise',
        name: "exercise",
        builder: (context, state) => const ExercisePage(),
        routes: [
          GoRoute(
            path: 'workout',
            name: 'workout',
            builder: (context, state) => const WorkoutView(),
            routes: [
              GoRoute(
                path: 'create',
                name: 'create',
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
        path: '/settings',
        name: "settings",
        builder: (context, state) => const SettingsPage(),
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
        builder: (context, state) => const RelationshipPage(),
      ),
      GoRoute(
        path: '/friendship',
        name: "friendship",
        builder: (context, state) => const FriendsRelationshipView(),
      ),
      GoRoute(
        path: '/user',
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
