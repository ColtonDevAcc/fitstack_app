import 'package:auto_route/annotations.dart';
import 'package:fitstackapp/features/dashboard/presentation/dashboard_view.dart';
import 'package:fitstackapp/features/login/presentation/login_view.dart';

import '../../mainView.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: Login_View,
      children: [],
    ),
    AutoRoute(
      page: Main_View,
      path: '/mainView',
      name: 'MainViewRouter',
      children: [
        AutoRoute(
          path: '',
          page: DashBoard_View,
        ),
      ],
    ),
  ],
)
class $AppRouter {}

//flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs


