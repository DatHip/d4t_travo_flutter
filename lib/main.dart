import 'package:d4t_travo_flutter/core/constants/color_palatte.dart';
import 'package:d4t_travo_flutter/core/helpers/size_config.dart';
import 'package:d4t_travo_flutter/representation/screens/splash_screen.dart';
import 'package:d4t_travo_flutter/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travo App",
      debugShowCheckedModeBanner: false,
      routes: routes,
      theme: ThemeData(
          primaryColor: ColorPalette.primaryColor,
          scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor),
      home: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return const SplashScreen();
        },
      ),
    );
  }
}
