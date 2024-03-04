import 'package:d4t_travo_flutter/core/constants/dimension_constants.dart';
import 'package:d4t_travo_flutter/core/constants/textstyle_ext.dart';
import 'package:d4t_travo_flutter/core/helpers/asset_helper.dart';
import 'package:d4t_travo_flutter/core/helpers/image_helper.dart';
import 'package:d4t_travo_flutter/representation/widgets/app_bar_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: "home",
      implementLeading: false,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: kItemPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi DatHuynh!",
                  style: TextStyles.defaultStyle.fontHeader.whiteTextColor.bold,
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  "Where are you going next?",
                  style: TextStyles.defaultStyle.fontCaption.whiteTextColor,
                )
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kDefaultFontSize,
              color: Colors.white,
            ),
            SizedBox(
              width: kMinPadding * 2,
            ),
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(kItemPadding - 5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kItemPadding)),
              child: ImageHelper.loadFromAsset(AssetHelper.person),
            )
          ],
        ),
      ),
      child: Column(
        children: [
          TextField(
            enabled: true,
            autocorrect: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(Radius.circular(kItemPadding))),
                hintText: "Search your destination",
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: Colors.black,
                    size: 14,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
