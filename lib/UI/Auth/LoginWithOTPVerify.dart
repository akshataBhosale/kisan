import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/View%20Models/CustomViewModel.dart';
import 'package:provider/provider.dart';

class LoginWithOTPVerfy extends StatefulWidget {
  @override
  _LoginWithOTPVerfyState createState() => _LoginWithOTPVerfyState();
}

class _LoginWithOTPVerfyState extends State<LoginWithOTPVerfy> {
  String countryCode = '+91';
  String verification_code;
  String errorMessage = '';

  Future<void> _verifyOTP() async {
    Provider.of<CustomViewModel>(context, listen: false)
        .verifyOTP(this.verification_code)
        .then((value) {
      setState(() {
        if (value == "error") {
          //for unexpected error
          errorMessage = value;
        } else if (value == "This is signup") {
          //for code 200
          errorMessage = value;

          //can be use to push to next screen
        } else if (value == "User authenticated successfully.") {
          //for code 200
          errorMessage = value;

          //can be use to push to next screen
        } else {
          //for expected errors
          errorMessage = value;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(COLOR_BACKGROUND),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: Text(
                errorMessage,
                style: TextStyle(
                    color: Color(COLOR_PRIMARY),
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5),
                      ),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.sms,
                      color: Color(COLOR_TEXT_BLACK),
                    ),
                    hintStyle: new TextStyle(color: Color(COLOR_TEXT_BLACK)),
                    hintText: "Enter OTP",
                    fillColor: Color(COLOR_WHITE)),
                onChanged: (value) {
                  this.verification_code = value;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 45.0,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                onPressed: () {
                  if (this.verification_code == null) {
                    setState(() {
                      errorMessage = 'OTP Filed field required!';
                    });
                  } else {
                    //verify otp
                    _verifyOTP();
                  }
                },
                child: Text(
                  "Verify",
                  style: TextStyle(
                      color: Color(COLOR_BACKGROUND),
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
                elevation: 7.0,
                color: Color(COLOR_PRIMARY),
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
