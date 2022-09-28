import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver({required this.analytics});
  final FirebaseAnalytics analytics;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    analytics.setCurrentScreen(screenName: route.settings.name);
    print('PUSHED SCREEN: ${route.settings.name}'); //name comes back null
  }
}
