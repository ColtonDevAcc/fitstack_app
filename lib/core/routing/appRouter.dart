import 'package:auto_route/annotations.dart';
import 'package:fitstackapp/app/mainView.dart';
import 'package:fitstackapp/app/views/login/login_view.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: Login_View,
      children: [],
    ),
    AutoRoute(page: Main_View, path: '/mainView'),
  ],
)
class $AppRouter {}

//flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs


