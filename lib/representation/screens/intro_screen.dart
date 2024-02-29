import 'dart:async';

import 'package:d4t_travo_flutter/core/constants/dimension_constants.dart';
import 'package:d4t_travo_flutter/core/constants/textstyle_ext.dart';
import 'package:d4t_travo_flutter/core/helpers/asset_helper.dart';
import 'package:d4t_travo_flutter/representation/screens/main_screen.dart';
import 'package:d4t_travo_flutter/representation/widgets/item_intro_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = 'intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  final StreamController<int> _streamController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _streamController.add(_pageController.page!.toInt());
    });
  }

  final List<Widget> listPage = [
    const ItemIntroWidget(
      title: 'Book a flight',
      description:
          'Found a flight that matches your destination and schedule? Book it instantly.',
      sourceImage: AssetHelper.slide1,
      alignment: Alignment.centerRight,
    ),
    const ItemIntroWidget(
      title: 'Find a hotel room',
      description:
          'Select the day, book your room. We give you the best price.',
      sourceImage: AssetHelper.slide2,
      alignment: Alignment.center,
    ),
    const ItemIntroWidget(
      title: 'Enjoy your trip',
      description:
          'Easy discovering new places and share these between your friends and travel together.',
      sourceImage: AssetHelper.slide3,
      alignment: Alignment.centerLeft,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: listPage,
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.orange,
                      dotWidth: kMinPadding * 2,
                      dotHeight: kMinPadding * 2),
                ),
                GestureDetector(
                  onTap: () {
                    if (_pageController.page == 2) {
                      Navigator.of(context).pushNamed(MainScreen.routeName);
                    } else {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: kMediumPadding * 2,
                        vertical: kDefaultPadding),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(kMediumPadding)),
                    child: StreamBuilder(
                      initialData: 0,
                      stream: _streamController.stream,
                      builder: (context, snapshot) => Text(
                        snapshot.data != 2 ? "Next" : 'Get Started',
                        style: TextStyles.defaultStyle.whiteTextColor.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
