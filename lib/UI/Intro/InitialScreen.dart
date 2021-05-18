import 'package:flutter/material.dart';
import 'package:kisan/Helpers/images.dart' as images;
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/HomeScreen/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Helpers/helper.dart';
import 'LanguageScreen.dart';
import 'package:kisan/Helpers/constants.dart' as constants;

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  jumpScreen() {
    Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String token = prefs.getString('token') ?? "";
      if (token != "") {
        pushReplacement(context, HomeScreen());
      } else {
        pushReplacement(context, LanguageScreen());
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //SizeConfig().init(context);
    jumpScreen();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(constants.COLOR_BACKGROUND),
      body: Center(
        child: Container(
          child: Image.asset(
            images.kisanLogo,
            scale: 1.5,
          ),
        ),
      ),
    );
  }
}
