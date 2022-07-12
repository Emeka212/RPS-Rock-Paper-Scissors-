import 'package:flutter/material.dart';

// Importing all our pages
import '../pages/home.dart';
import '../pages/about.dart';
import '../pages/normal_level.dart';
import '../pages/advance_level.dart';

// Variable for our route names
const String homePage = 'home';
const String aboutPage = 'about';
const String normalLevelPage = 'normalLevel';
const String advanceLevelPage = 'advanceLevel';

// controller function with switch statement to countrol page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case homePage:
      return MaterialPageRoute(builder: (context) => const HomePage());
    case aboutPage:
      return MaterialPageRoute(builder: (context) => const AboutPage());
    case normalLevelPage:
      return MaterialPageRoute(builder: (context) => const NormalLevelPage());
    case advanceLevelPage:
      return MaterialPageRoute(builder: (context) => const AdvanceLevelPage());
    default:
      throw ('This route name does not exist');
  }
}
