import 'package:d4t_travo_flutter/core/constants/dimension_constants.dart';
import 'package:d4t_travo_flutter/core/constants/textstyle_ext.dart';
import 'package:d4t_travo_flutter/core/helpers/asset_helper.dart';
import 'package:d4t_travo_flutter/core/helpers/image_helper.dart';
import 'package:d4t_travo_flutter/representation/screens/splash_screen.dart';
import 'package:d4t_travo_flutter/representation/widgets/app_bar_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> listImageLeft = [
    {"name": "Korea", "image": AssetHelper.korea},
    {"name": "Dubai", "image": AssetHelper.dubai},
    {"name": "Korea", "image": AssetHelper.korea},
    {"name": "Dubai", "image": AssetHelper.dubai},
  ];
  final List<Map<String, String>> listImageRight = [
    {
      'name': 'Turkey',
      'image': AssetHelper.turkey,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.japan,
    },
    {
      'name': 'Turkey',
      'image': AssetHelper.turkey,
    },
    {
      'name': 'Japan',
      'image': AssetHelper.japan,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: "home",
      implementLeading: false,
      title: Padding(
          padding: EdgeInsets.symmetric(horizontal: kItemPadding),
          child: _buildHeader()),
      child: Column(
        children: [
          _buildSearchInput(),
          SizedBox(
            height: kDefaultPadding,
          ),
          _buildCategory(),
          SizedBox(
            height: kDefaultPadding + 4,
          ),
          Row(
            children: [
              Text(
                "Popular Destinations",
                style: TextStyles.defaultStyle.bold,
              ),
              Spacer(),
              Text(
                "See ALl",
                style: TextStyles.defaultStyle.bold.primaryTextColor,
              ),
            ],
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          _buildImageHomeScreen()
        ],
      ),
    );
  }

  Widget _buildItemImageHome(String name, String image) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context)
        //     .pushNamed(HotelBookingScreen.routeName, arguments: name);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: kDefaultPadding),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            ImageHelper.loadFromAsset(image,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                radius: BorderRadius.circular(kItemPadding)),
            Padding(
              padding: EdgeInsets.all(kDefaultPadding),
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.defaultStyle.whiteTextColor.bold,
                  ),
                  SizedBox(
                    height: kItemPadding,
                  ),
                  Container(
                    padding: EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(kMinPadding)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color(0xffFFC107),
                        ),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text("4.5")
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildImageHomeScreen() {
    return Expanded(
        child: SingleChildScrollView(
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: listImageLeft
                .map((e) => _buildItemImageHome(e["name"]!, e["image"]!))
                .toList(),
          )),
          SizedBox(
            width: kDefaultPadding,
          ),
          Expanded(
              child: Column(
            children: listImageRight
                .map(
                  (e) => _buildItemImageHome(
                    e['name']!,
                    e['image']!,
                  ),
                )
                .toList(),
          )),
        ],
      ),
    ));
  }

  Widget _buildCategory() {
    return Row(
      children: [
        Expanded(
          child: _buildItemCategory(
              ImageHelper.loadFromAsset(AssetHelper.icoHotel,
                  width: kDefaultIconSize, height: kDefaultIconSize),
              Color(0xffFE9C5E),
              () => Navigator.of(context).pushNamed(SplashScreen.routeName),
              "Hotels"),
        ),
        SizedBox(
          width: kDefaultPadding,
        ),
        Expanded(
          child: _buildItemCategory(
              ImageHelper.loadFromAsset(AssetHelper.icoPlane,
                  width: kDefaultIconSize, height: kDefaultIconSize),
              Color(0xffF77777),
              () => null,
              "Flights"),
        ),
        SizedBox(
          width: kDefaultPadding,
        ),
        Expanded(
          child: _buildItemCategory(
              ImageHelper.loadFromAsset(AssetHelper.icoHotelPlane,
                  width: kDefaultIconSize, height: kDefaultIconSize),
              Color(0xff3EC8BC),
              () => null,
              "All"),
        ),
      ],
    );
  }

  Widget _buildItemCategory(
      Widget icon, Color color, Function() onTap, String title) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: kMediumPadding),
            child: icon,
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(kItemPadding)),
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Text(title)
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
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
    );
  }

  Widget _buildSearchInput() {
    return TextField(
      enabled: true,
      autocorrect: false,
      style: TextStyles.defaultStyle,
      onChanged: (value) => {},
      onSubmitted: (value) {},
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(kItemPadding))),
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
    );
  }
}
