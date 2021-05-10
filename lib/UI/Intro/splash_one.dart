import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/UI/Intro/splash_two.dart';
import 'package:kisan/Helpers/constants.dart' as constants;
import '../../Helpers/helper.dart';

class SplashOne extends StatefulWidget {
  @override
  _SplashOneState createState() => _SplashOneState();
}

class _SplashOneState extends State<SplashOne> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildCenterCard(context),
              buildInfoText(context),
            ],
          ),
        //buildSkipButton(context),
      ],
    );
  }

  Widget buildSkipButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        push(context, SplashTwo());
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 50, right: 36),
          child: Text("SKIP",
            style: GoogleFonts.nunitoSans(
              textStyle: TextStyle(
                  color: Color(0xff302b6f),
                  fontSize: 20,
                  letterSpacing: 0
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCenterCard(BuildContext context){
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: MediaQuery.of(context).size.height/3.5,
        width: MediaQuery.of(context).size.width/1.5,
        //child: Image.asset("assets/images/initialscreen1.png"),
      ),
    );
  }

  Widget buildInfoText(BuildContext context){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 35,),
        Text("Explore products\n& Brands",
          textScaleFactor: 1,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                letterSpacing: 0
            ),
          ),
        ),
        SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Text("Find products of your interest. Explore brands you know and like. It may be a simple hand tool or precision agriculture sensor. It’s all here.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 18,color: Color(0xff9A9A9A)
            ),),
        ),
        SizedBox(height: 25,),
        Container(
          height: 60, width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Color(constants.COLOR_BACKGROUND),
          ),
          child: Center(
            child: Icon(Icons.arrow_forward_ios,color: Color(constants.COLOR_WHITE),),
          ),
        ),
      ],
    );
  }

  TextStyle textStyle(){
    return GoogleFonts.nunitoSans(
      textStyle: TextStyle(
          letterSpacing: 0,
          fontSize: 18
      )
    );
  }

  Widget buildPositionWidget(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: Color(0xff302b6f),
                borderRadius: BorderRadius.all(Radius.circular(50))
            ),
          ),
          SizedBox(width: 10.33,),
          buildEmptyPositionContainer(context),
          SizedBox(width: 10.33,),
          buildEmptyPositionContainer(context),
        ],
      ),
    );
  }

  Widget buildEmptyPositionContainer(BuildContext context){
    return Container(
      height: 8,
      width: 8,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xff302b6f)),
          borderRadius: BorderRadius.all(Radius.circular(50))
      ),
    );
  }

}
