import 'package:flutter/material.dart';
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
                  debugShowCheckedModeBanner: false, home: LoginWithOTP())),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false, home: LoginWithOTP())),
  );
}
