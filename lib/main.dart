import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kisan/UI/Auth/LoginWithOTP.dart';
import 'package:kisan/UI/Intro/InitialScreen.dart';
import 'package:provider/provider.dart';
import 'UI/Auth/SocialAuth.dart';
import 'View Models/CustomViewModel.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white));
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => CustomViewModel(),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: SocialAuth() /*InitialScreen()*/)),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SocialAuth() /*InitialScreen()*/)),
  );
}
