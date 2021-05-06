import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/Widgets/ScreenHeader.dart';
import 'package:kisan/View%20Models/CustomViewModel.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class LoginWithOTPVerify extends StatefulWidget {
  final String phoneNo,countryCode;

  LoginWithOTPVerify({this.phoneNo, this.countryCode});

  @override
  _LoginWithOTPVerifyState createState() => _LoginWithOTPVerifyState();
}

class _LoginWithOTPVerifyState extends State<LoginWithOTPVerify> {
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
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(COLOR_ACCENT),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 36,
              left: 36,
              right: 36,
              bottom: 30.5,
            ),
            child: ScreenHeader(
              iconData: Icons.mobile_friendly,
              title: "Verify",
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35)),
                  color: Colors.white),
              child: Column(
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(47),
                  ),
                  Text(
                    "Please enter the code we sent on",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins Regular",
                        fontSize: getProportionateScreenHeight(20)),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Text(
                    widget.countryCode +" "+ widget.phoneNo,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(COLOR_ACCENT),
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins Bold",
                        fontSize: getProportionateScreenHeight(25)),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(16),
                  ),
                  PinCodeTextField(
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      activeColor: Color(COLOR_ACCENT),
                      fieldHeight: 54,
                      fieldWidth: 53,
                      inactiveFillColor: Colors.grey,
                    ),
                    textStyle:
                        TextStyle(fontSize: getProportionateScreenHeight(15)),
                    onChanged: (value) {
                      this.verification_code = value;
                    },
                  ),
                  InkWell(
                    onTap: (){},
                    child: Text(
                      "I did'nt get the code",
                      style: TextStyle(
                          color: Color(COLOR_TEXT_GREY),
                          fontSize: getProportionateScreenHeight(16)),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: getProportionateScreenWidth(316),
                        height: getProportionateScreenHeight(65)),
                    child: ElevatedButton(
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
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFFFFE44E),
                          onPrimary: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          textStyle: TextStyle(
                            fontSize: getProportionateScreenHeight(20),
                            fontFamily: "Poppins Bold",
                          )),
                      child: Text("CONTINUE"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
