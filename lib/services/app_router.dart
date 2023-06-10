import 'package:flutter/material.dart';
import 'package:todo_bloc/screens/recycle_bin_screen.dart';
import 'package:todo_bloc/screens/tab_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case TabScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const TabScreen(),
        );
      case RecycleBinScreen.routeName:
        return MaterialPageRoute(
          builder: (_) => const RecycleBinScreen(),
        );

      default:
        return null;
    }
  }
}
