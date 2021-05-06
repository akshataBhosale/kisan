import 'package:flutter/material.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/Auth/LoginWithOTPVerify.dart';
import 'package:kisan/UI/Auth/SignUpOptionScreen.dart';
import 'package:provider/provider.dart';

import 'UI/Auth/LoginWithOTP.dart';
import 'View Models/CustomViewModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => CustomViewModel(),
              child: MaterialApp(
                  debugShowCheckedModeBanner: false, home: SignUpMethodSelection())),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SignUpMethodSelection())),
  );
}
