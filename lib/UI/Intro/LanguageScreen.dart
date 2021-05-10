import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/constants.dart' as constants;
import 'package:kisan/Helpers/images.dart' as images;
import 'package:kisan/UI/Intro/splash_page_view_builder.dart';

import '../../Helpers/helper.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    buildTopWidget(BuildContext context){
      return Container(
        height: screenHeight/3,
        width: screenWidth,
        decoration: BoxDecoration(
          color: Color(constants.COLOR_BACKGROUND),
        ),
        child: Center(
          child: Container(
            child: Image.asset(images.kisanLogo,
              scale: 2,
            ),
          ),
        ),
      );
    }

    buildLanguagaeWidget(BuildContext context){
      return Padding(
        padding: EdgeInsets.only(top: screenHeight/3),
        child: Container(
          height: screenHeight,
          width: screenWidth,
          decoration: BoxDecoration(
              color: Color(constants.COLOR_WHITE),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )
          ),
          child: Stack(
            children: [
                Positioned(
                  top: screenHeight/20, left: 0, right: 0,
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Text("Select Language",
                      textScaleFactor: 1,
                      style: GoogleFonts.poppins(
                        fontSize: 21,
                      ),
                    ),
              ),),
              Positioned(
                top: screenHeight/5, left: 0, right: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: screenWidth/2,
                        decoration: BoxDecoration(
                          color: Color(0xffF4F4F4),
                          borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Center(
                          child: Text("मराठी",
                            textScaleFactor: 1,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        height: 60,
                        width: screenWidth/2,
                        decoration: BoxDecoration(
                            color: Color(0xffF4F4F4),
                            borderRadius: BorderRadius.all(Radius.circular(15))
                        ),
                        child: Center(
                          child: Text("हिन्दी",
                            textScaleFactor: 1,
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){
                          push(context, SplashPageViewBuilder());
                        },
                        child: Container(
                          height: 60,
                          width: screenWidth/2,
                          decoration: BoxDecoration(
                              color: Color(0xffF4F4F4),
                              borderRadius: BorderRadius.all(Radius.circular(15))
                          ),
                          child: Center(
                            child: Text("English",
                              textScaleFactor: 1,
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(constants.COLOR_BACKGROUND),
      body: Stack(
        children: [
          Positioned(
            top: 0,left: 0,right: 0,
            child: buildTopWidget(context),
          ),
          buildLanguagaeWidget(context),
        ],
      ),
    );
  }
}
