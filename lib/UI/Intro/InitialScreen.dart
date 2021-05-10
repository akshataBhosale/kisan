import 'package:flutter/material.dart';
import 'package:kisan/Helpers/images.dart' as images;
import '../../Helpers/helper.dart';
import 'LanguageScreen.dart';
import 'package:kisan/Helpers/constants.dart' as constants;

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {

  jumpScreen(){
    Future.delayed(const Duration(seconds: 2),(){
      push(context, LanguageScreen());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jumpScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(constants.COLOR_BACKGROUND),
      body: Center(
        child: Container(
          child: Image.asset(images.kisanLogo,
            scale: 1.5,
          ),
        ),
      ),
    );
  }
}
