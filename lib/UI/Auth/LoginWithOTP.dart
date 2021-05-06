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

  bool _isChecked = false;

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
          push(
              context,
              LoginWithOTPVerify(
                phoneNo: this.phoneNo,
                countryCode: this.countryCode,
              ));
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
    // final screenHeight = MediaQuery
    //     .of(context)
    //     .size
    //     .height;
    // final screenWidth = MediaQuery
    //     .of(context)
    //     .size
    //     .width;

    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(COLOR_ACCENT),
      body: Column(
        //SingleChildScrollView was removed here ass the elements fit in the screen
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 36,
              left: 36,
              right: 36,
              bottom: 30.5,
            ),
            child: ScreenHeader(
              iconData: Icons.phone_android,
              title: "Enter Mobile",
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(35),
                      topLeft: Radius.circular(35)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: getProportionateScreenHeight(30.5),
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
                  Text(
                    "Please enter your mobile number\n"
                    "We will send a 6 digit code"
                    "on this number for verification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenHeight(20)),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: getProportionateScreenHeight(40),
                        child: CountryCodePicker(
                          onChanged: _onCountryChange,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'IN',
                          favorite: ['+91', 'IN'],
                          textStyle: TextStyle(
                              fontSize: getProportionateScreenHeight(17),
                              fontWeight: FontWeight.w800,
                              color: Color(COLOR_TEXT_BLACK)),
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ),
                      ),
                      Container(
                        width: getProportionateScreenWidth(210),
                        height: getProportionateScreenHeight(40),
                        child: TextField(
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(18),
                              fontWeight: FontWeight.w800,
                              color: Color(COLOR_ACCENT)),
                          decoration: new InputDecoration(
                              filled: true,
                              counterText: "",
                              hintStyle:
                                  new TextStyle(color: Color(COLOR_TEXT_BLACK)),
                              hintText: "Mobile Number",
                              fillColor: Color(COLOR_WHITE)),
                          onChanged: (value) {
                            this.phoneNo = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            activeColor: Color(COLOR_ACCENT),
                            checkColor: Colors.white,
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = !_isChecked;
                              });
                            }),
                        Text("Receive updates & get updates on"),
                        SizedBox(
                          width: getProportionateScreenWidth(5),
                        ),
                        Image.asset(
                          "assets/images/whatsapp.png",
                          width: getProportionateScreenWidth(17),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(5),
                        ),
                        Text(
                          "WhatsApp",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: getProportionateScreenWidth(316),
                        height: getProportionateScreenHeight(65)),
                    child: ElevatedButton(
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
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'By clicking on this button, you agree with the ',
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(12),
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[300]),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Terms & Conditions',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            )),
                        TextSpan(
                            text: '\nand Privacy policy',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            )),
                        TextSpan(
                          text: 'of KISAN',
                        ),
                        // can add more TextSpans here...
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Spacer()
                ],
              ),
            ),
          ),
          // Container(
          //   width: screenWidth,
          //   alignment: Alignment.centerLeft,
          //   padding: EdgeInsets.only(left: 40),
          //   margin: EdgeInsets.all(20.0),
          //   decoration: new BoxDecoration(
          //       borderRadius: new BorderRadius.circular(5),
          //       color: Colors.white,
          //       boxShadow: [
          //         BoxShadow(color: Colors.black, spreadRadius: 0.5)
          //       ]),
          //   child: CountryCodePicker(
          //     onChanged: _onCountryChange,
          //     // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
          //     initialSelection: 'IN',
          //     favorite: ['+91', 'IN'],
          //     // optional. Shows only country name and flag
          //     showCountryOnly: false,
          //     // optional. Shows only country name and flag when popup is closed.
          //     showOnlyCountryWhenClosed: false,
          //     // optional. aligns the flag and the Text left
          //     alignLeft: false,
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(left: 20.0, right: 20.0),
          //   child:
          //   TextField(
          //     keyboardType: TextInputType.phone,
          //     decoration: new InputDecoration(
          //         border: new OutlineInputBorder(
          //           borderRadius: const BorderRadius.all(
          //             const Radius.circular(5.0),
          //           ),
          //         ),
          //         filled: true,
          //         prefixIcon: Icon(
          //           Icons.phone_iphone,
          //           color: Color(COLOR_TEXT_BLACK),
          //         ),
          //         hintStyle: new TextStyle(color: Color(COLOR_TEXT_BLACK)),
          //         hintText: "Enter Your Phone Number...",
          //         fillColor: Color(COLOR_WHITE)),
          //     onChanged: (value) {
          //       this.phoneNo = value;
          //     },
          //   ),
          // ),

          // Container(
          //   margin: EdgeInsets.all(20.0),
          //   width: double.infinity,
          //   height: 45.0,
          //   child: RaisedButton(
          //     shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(5)),
          //     onPressed: () {
          //       this.phoneNo == null
          //           ? setState(() {
          //               errorMessage = 'Phone number field required!';
          //             })
          //           : setState(() {
          //               errorMessage = 'Please wait...';
          //               // sendotp();
          //               _sendOTP();
          //             });
          //     },
          //     child: Text(
          //       "SEND OTP",
          //       style: TextStyle(
          //           color: Color(COLOR_BACKGROUND),
          //           fontSize: 17.0,
          //           fontWeight: FontWeight.bold),
          //     ),
          //     elevation: 7.0,
          //     color: Color(COLOR_PRIMARY),
          //   ),
          // ),
          // SizedBox(
          //   height: 10,
          // ),
          // SizedBox(
          //   height: 100,
          // ),
        ],
      ),
    );
  }
}
