import 'package:d4t_travo_flutter/core/constants/dimension_constants.dart';
import 'package:d4t_travo_flutter/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppBarContainer(
      titleString: "home",
      implementLeading: false,
      title: Padding(padding: EdgeInsets.symmetric(horizontal: kItemPadding)),
      child: Column(),
    );
  }
}
