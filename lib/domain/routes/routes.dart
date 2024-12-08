import 'package:flutter/material.dart';

import '../../presentation/course_screen/course_screen.dart';

mixin RoutePaths {
  static const courseScreen = '/course_screen';
  // String get courseScreen => '/course_screen';
//
}

abstract class GetNamesRoutes with RoutePaths {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.courseScreen:
        return MaterialPageRoute(builder: (context) =>const CourseScreen());
    }
    return MaterialPageRoute(
      builder: (_) => const Text(
        'Replace with page not found',
      ),
    );
  }
}
