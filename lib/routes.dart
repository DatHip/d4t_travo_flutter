import 'package:d4t_travo_flutter/representation/screens/intro_screen.dart';
import 'package:d4t_travo_flutter/representation/screens/main_screen.dart';
import 'package:d4t_travo_flutter/representation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainScreen.routeName: (context) => const MainScreen(),
};
