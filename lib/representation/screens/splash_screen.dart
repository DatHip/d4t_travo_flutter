import 'package:d4t_travo_flutter/core/helpers/asset_helper.dart';
import 'package:d4t_travo_flutter/core/helpers/image_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _routeToIntroScreen() async {
    await Future.delayed(Duration())
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.backgroundSplash,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned.fill(
            child: ImageHelper.loadFromAsset(AssetHelper.circleSplash))
      ],
    );
  }
}
