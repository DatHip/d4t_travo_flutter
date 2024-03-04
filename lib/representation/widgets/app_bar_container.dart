import 'package:d4t_travo_flutter/core/constants/color_palatte.dart';
import 'package:d4t_travo_flutter/core/constants/dimension_constants.dart';
import 'package:d4t_travo_flutter/core/constants/textstyle_ext.dart';
import 'package:d4t_travo_flutter/core/helpers/asset_helper.dart';
import 'package:d4t_travo_flutter/core/helpers/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key? key,
    required this.child,
    this.title,
    this.titleString,
    this.subTitleString,
    this.implementTraling = false,
    this.implementLeading = true,
    this.paddingContent = const EdgeInsets.symmetric(
      horizontal: kMediumPadding,
    ),
  })  : assert(title != null || titleString != null,
            'title or titleString can\'t be null'),
        super(key: key);

  final Widget child;
  final Widget? title;
  final String? titleString;
  final String? subTitleString;
  final bool implementTraling;
  final bool implementLeading;
  final EdgeInsets? paddingContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              elevation: 0,
              centerTitle: true,
              toolbarHeight: 90,
              automaticallyImplyLeading: false,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: title ??
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (implementLeading)
                            GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(kDefaultPadding)),
                                padding: EdgeInsets.all(kItemPadding),
                                child: Icon(
                                  FontAwesomeIcons.arrowLeft,
                                  size: kDefaultPadding,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          Expanded(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    titleString ?? "",
                                    style: TextStyles.defaultStyle.fontHeader
                                        .whiteTextColor.bold,
                                  ),
                                  if (subTitleString != null)
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            top: kMediumPadding),
                                        child: Text(
                                          subTitleString!,
                                          style: TextStyles.defaultStyle
                                              .fontCaption.whiteTextColor,
                                        ))
                                ],
                              ),
                            ),
                          ),
                          if (implementTraling)
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(kDefaultPadding)),
                              padding: EdgeInsets.all(kItemPadding),
                              child: Icon(
                                FontAwesomeIcons.bars,
                                size: kDefaultPadding,
                                color: Colors.black,
                              ),
                            )
                        ],
                      )),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                        ),
                        gradient: const LinearGradient(
                            colors: [Color(0xff8F67E8), Color(0xff6357CC)])),
                  ),
                  Positioned(
                      top: 0,
                      left: 0,
                      child: ImageHelper.loadFromAsset(AssetHelper.icoOvalTop)),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child:
                          ImageHelper.loadFromAsset(AssetHelper.icoOvalBottom)),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 156),
            padding: paddingContent,
            child: child,
          )
        ],
      ),
    );
  }
}
