import 'package:FitStack/mainView.dart';
import 'package:FitStack/presentation/dashboard/presentation/dashboard_view.dart';
import 'package:FitStack/presentation/login/presentation/login_page.dart';
import 'package:FitStack/presentation/nutrition/presentation/nutrition_view.dart';
import 'package:FitStack/presentation/settings/settings_view.dart';
import 'package:FitStack/presentation/signup/presentation/signup_page.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'auth',
      name: "login",
      page: Login_Page,
      initial: true,
      children: [],
    ),
    AutoRoute(
      page: SignUp_Page,
      path: 'auth/signup',
      name: 'signup',
    ),
    AutoRoute(
      page: Main_View,
      path: '/mainView',
      name: 'Main_View',
      children: [
        AutoRoute(
          path: 'DashBoard',
          page: DashboardView,
          initial: false,
        ),
        AutoRoute(
          path: 'Nutrition',
          page: NutritionView,
          initial: false,
        ),
        AutoRoute(
          path: 'Settings',
          page: SettingsView,
          initial: false,
        ),
      ],
    ),
  ],
)
class $AppRouter {}

//flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs
