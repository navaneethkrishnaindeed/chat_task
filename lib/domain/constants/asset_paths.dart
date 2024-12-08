// assets\images\hamburger.svg

import 'package:injectable/injectable.dart';

import '../dependency_injection/injectable.dart';

abstract class AssetPaths {
  static CourseScreenAssets courseScreenAssets = getItLocator<CourseScreenAssets>();
}

@injectable
class CourseScreenAssets {
  final String bannerImage = 'assets/the-climate-reality-project-Hb6uWq0i4MI-unsplash.jpg';
  final String people = 'assets/profile-2user.svg';
  final String chat = 'assets/message-text.svg';
  final String doubt = 'assets/message-question.svg';
  final String notes = 'assets/book.svg';
  final String rewards = 'assets/Style=linear.svg';
  final String share = 'assets/share.svg';
  final String face = 'assets/Ellipse 31.png';
  final String sendIcon = 'assets/sendIcon.svg';
}
