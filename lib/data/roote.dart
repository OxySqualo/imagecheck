import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';
import '../screens/home_screen.dart';
import 'item.dart';

Route generateRoute(RouteSettings routeSettings) {
  final args = routeSettings.arguments;

  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    case '/details':
      if (args is Item) {
        return MaterialPageRoute(
          builder: (context) => DetailScreen(
            item: args,
          ),
        );
      }
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

    default:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );
  }
}
