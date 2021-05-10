import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/Auth/EnterOTP.dart';
import 'package:kisan/UI/Widgets/ScreenHeader.dart';
import 'package:kisan/View%20Models/CustomViewModel.dart';
import 'package:provider/provider.dart';
import 'package:kisan/UI/Auth/LoginWithOTPVerify.dart';
import 'package:kisan/Helpers/constants.dart' as constants;

import '../../Helpers/helper.dart';

class LoginWithOTP extends StatefulWidget {
  @override
  _LoginWithOTPState createState() => _LoginWithOTPState();
}

class _LoginWithOTPState extends State<LoginWithOTP> {
  String countryCode = '+91';
  String phoneNo;
  String errorMessage = '';
  bool _isChecked = false;
  TextEditingController phoneController = TextEditingController();

  void _onCountryChange(CountryCode countryCode) {
    //TODO : manipulate the selected country code here
    print("New Country selected: " + countryCode.toString());
    setState(() {
      this.countryCode = countryCode.toString();
    });
  }

  Future<void> _sendOTP() async {
    Provider.of<CustomViewModel>(context, listen: false)
        .sendOTP(this.countryCode + this.phoneNo, _isChecked ? "OTP_IN" : "OTP_OUT")
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
    setState(() {
      _isChecked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    buildTopWidget(BuildContext context){
      return Container(
          height: screenHeight/6,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Color(0xff08763F),
          ),
          child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: screenWidth/15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      color: Color(0xff1F8F4E),
                    ),
                    child: Center(child:
                    Icon(Icons.mobile_friendly_outlined,color: Color(constants.COLOR_WHITE),)),
                  ),
                  SizedBox(width: 20,),
                  Text("Enter Mobile",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        color: Color(constants.COLOR_WHITE)
                    ),
                  ),
                ],
              ))
      );
    }

    return Scaffold(
      backgroundColor: Color(0xff08763F),
      body: Stack(
        children: [
          Positioned(
            top: 0,left: 0,right: 0,
            child: buildTopWidget(context),
          ),
          Padding(
            padding: EdgeInsets.only(top: screenHeight/6),
            child: Container(
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
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Please enter your mobile number\nWe will send a 6 digit code\non this number for verification",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 22,
                          color: Color(0xff696969),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Card(
                        elevation: 1,
                        child: Container(
                          height: getProportionateScreenHeight(40),
                          child: CountryCodePicker(
                            onChanged: _onCountryChange,
                            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                            initialSelection: 'IN',
                            favorite: ['+91', 'IN'],
                            textStyle: GoogleFonts.poppins(
                                fontSize: 14,
                                color: Color(COLOR_TEXT_BLACK)
                            ),
                            // optional. Shows only country name and flag
                            showCountryOnly: false,
                            // optional. Shows only country name and flag when popup is closed.
                            showOnlyCountryWhenClosed: false,
                            // optional. aligns the flag and the Text left
                            alignLeft: false,
                          ),
                        ),
                      ),
                      Container(
                        width: getProportionateScreenWidth(210),
                        height: getProportionateScreenHeight(40),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          maxLength: 10,
                          controller: phoneController,
                          style: GoogleFonts.poppins(
                              fontSize: getProportionateScreenHeight(18),
                              color: Colors.black,
                          ),
                          decoration: new InputDecoration(
                              filled: true,
                              counterText: "",
                              hintStyle: GoogleFonts.poppins(
                                fontSize: getProportionateScreenHeight(18),
                                color: Colors.grey,
                              ),
                              hintText: "Mobile Number",
                              fillColor: Color(COLOR_WHITE)
                          ),
                          onChanged: (value) {
                            this.phoneNo = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            activeColor: Color(constants.COLOR_BACKGROUND),
                            checkColor: Colors.white,
                            value: _isChecked,
                            onChanged: (value) {
                              setState(() {
                                _isChecked = !_isChecked;
                              });
                            }),
                        Text("Receive updates & get updates on"),
                        SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          "assets/images/whatsapp.png",
                          width: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "WhatsApp",
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(25),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(
                        width: getProportionateScreenWidth(288),
                        height: getProportionateScreenHeight(60)),
                    child: ElevatedButton(
                      onPressed: () {
                      if(phoneController.text.toString() == ""){
                        Fluttertoast.showToast(msg: 'Phone number is required!',
                          backgroundColor: Colors.white,
                          textColor: Colors.red[800],);
                      }else if(phoneController.text.length > 10 || phoneController.text.length < 10){
                        Fluttertoast.showToast(msg: 'Phone number must be 10 digits!',
                          backgroundColor: Colors.white,
                          textColor: Colors.red[800],);
                      }else{
                        push(context, EnterOTP(phoneController.text.toString()));
                      }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFFE44E),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        "CONTINUE",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            letterSpacing: 1,
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'By clicking on this button, you agree with the ',
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(12),
                          color: Color(0xffCECECE)),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Terms & Conditions',
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                            )),
                        TextSpan(
                            text: '\nand',
                            style: GoogleFonts.poppins(
                            )),
                        TextSpan(
                            text: ' Privacy policy',
                            style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                            )),
                        TextSpan(
                          text: ' of KISAN',
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
        ],
      ),
    );
  }
}
