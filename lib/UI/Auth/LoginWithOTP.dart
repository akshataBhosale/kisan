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
import 'package:kisan/UI/Auth/LoginWithOTPVerify.dart';

class LoginWithOTP extends StatefulWidget {
  @override
  _LoginWithOTPState createState() => _LoginWithOTPState();
}

class _LoginWithOTPState extends State<LoginWithOTP> {
  String countryCode = '+91';
  String phoneNo;
  String errorMessage = '';

  void _onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    print("New Country selected: " + countryCode.toString());
    setState(() {
      this.countryCode = countryCode.toString();
    });
  }

  Future<void> _sendOTP() async {
    Provider.of<CustomViewModel>(context, listen: false)
        .sendOTP(this.countryCode + this.phoneNo, "OTP_IN")
        .then((value) {
      setState(() {
        if (value == "error") {
          //for unexpected error
          errorMessage = value;
        } else if (value == "Verification code sent") {
          //for code 200
          errorMessage = value;
          //can be use to push to next screen
          push(context, LoginWithOTPVerfy());
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
              height: 100,
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
            Container(
              width: screenWidth,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 40),
              margin: EdgeInsets.all(20.0),
              decoration: new BoxDecoration(
                  borderRadius: new BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(color: Colors.black, spreadRadius: 0.5)
                  ]),
              child: CountryCodePicker(
                onChanged: _onCountryChange,
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'IN',
                favorite: ['+91', 'IN'],
                // optional. Shows only country name and flag
                showCountryOnly: false,
                // optional. Shows only country name and flag when popup is closed.
                showOnlyCountryWhenClosed: false,
                // optional. aligns the flag and the Text left
                alignLeft: false,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.0, right: 20.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(5.0),
                      ),
                    ),
                    filled: true,
                    prefixIcon: Icon(
                      Icons.phone_iphone,
                      color: Color(COLOR_TEXT_BLACK),
                    ),
                    hintStyle: new TextStyle(color: Color(COLOR_TEXT_BLACK)),
                    hintText: "Enter Your Phone Number...",
                    fillColor: Color(COLOR_WHITE)),
                onChanged: (value) {
                  this.phoneNo = value;
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
                  this.phoneNo == null
                      ? setState(() {
                          errorMessage = 'Phone number field required!';
                        })
                      : setState(() {
                          errorMessage = 'Please wait...';
                          // sendotp();
                          _sendOTP();
                        });
                },
                child: Text(
                  "SEND OTP",
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
              height: 10,
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
