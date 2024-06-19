import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:d4t_travo_flutter/core/constants/dimension_constants.dart';
import 'package:d4t_travo_flutter/core/constants/textstyle_ext.dart';
import 'package:d4t_travo_flutter/core/helpers/asset_helper.dart';
import 'package:d4t_travo_flutter/core/helpers/image_helper.dart';
import 'package:d4t_travo_flutter/representation/screens/splash_screen.dart';
import 'package:d4t_travo_flutter/representation/widgets/app_bar_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get child => null;

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    var url = Uri.https('zozo-audio.aedev.net', "api/login");
    var response = await http.post(url, body: {
      'username': _usernameController.text,
      'password': _usernameController.text
    });
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleString: "home",
      implementLeading: false,
      title:
          Padding(padding: EdgeInsets.symmetric(horizontal: kItemPadding + 10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'username',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'password',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          )
        ],
      ),
    );
  }
}
