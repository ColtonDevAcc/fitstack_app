import 'package:auto_route/annotations.dart';
import 'package:fitstackapp/presentation/dashboard/presentation/dashboard_view.dart';
import 'package:fitstackapp/presentation/login/presentation/login_view.dart';
import 'package:fitstackapp/presentation/signup/presentation/signup_view.dart';

import '../../mainView.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page|Screen,Route',
  routes: <AutoRoute>[
    AutoRoute<String>(
        path: '/', page: Login_View, children: [], usesPathAsKey: true, initial: true),
    AutoRoute<String>(
      page: SignUp_View,
      path: '/signup',
      name: 'signup',
      usesPathAsKey: true,
    ),
    AutoRoute(
      page: Main_View,
      path: '/mainView',
      name: 'MainViewRouter',
      usesPathAsKey: true,
      children: [
        AutoRoute(
          path: '',
          page: DashBoard_View,
          usesPathAsKey: true,
          initial: false,
        ),
      ],
    ),
  ],
)
class $AppRouter {}

//flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs


    