// assets\images\hamburger.svg

import 'package:injectable/injectable.dart';

import '../dependency_injection/injectable.dart';

abstract class Strings {
  static CourseScreenStings courseScreenStings = getItLocator<CourseScreenStings>();
}

@injectable
class CourseScreenStings {
  String title = "Algebra 12: Functions 4";
  String courseDesription = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet leo ipsum. Aliquam eget lorem posuere, bibendum nisi interdum, vulputate magna. Duis laoreet libero vitae nulla iaculis, ac laoreet quam euismod. Vivamus non pellentesque massa. Integer ac libero tempus, condimentum felis eu, dictum odio. Suspendisse diam purus, tincidunt quis ex ut, ultrices tincidunt nisl. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus eleifend porta suscipit. Praesent porta interdum dolor in pellentesque. ';
}
