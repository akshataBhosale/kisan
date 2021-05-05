import 'package:flutter/material.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/Widgets/ScreenHeader.dart';
import '../../Helpers/constants.dart';
import '../../Helpers/helper.dart';
import 'LoginWithOTP.dart';

class SignUpMethodSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Color(COLOR_ACCENT),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 36,left: 36,right: 36,bottom: 30.5,),
            child: ScreenHeader(
              iconData: Icons.login,
              title: "Sign up / login",
            ),
          ),
          Expanded(
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
                      height: getProportionateScreenHeight(30.5),
                    ),
                    Text(
                      "Welcome\nLet's get you started",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenHeight(20)),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(42),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: getProportionateScreenWidth(274),
                          height: getProportionateScreenHeight(60)),
                      child: ElevatedButton(
                        onPressed: () {
                          push(context, LoginWithOTP());
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(COLOR_ACCENT),
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          onPrimary: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(1.2),
                              height: getProportionateScreenHeight(55),
                              width: getProportionateScreenWidth(55),
                              color: Colors.white,
                              child: Icon(
                                Icons.phone_android,
                                color: Color(COLOR_ACCENT),
                                size: getProportionateScreenWidth(25),
                              ),
                            ),
                            SizedBox(width: getProportionateScreenWidth(14),),
                            Text(
                              "Enter using Mobile",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(20)),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: getProportionateScreenWidth(117),
                          height: 2,
                          child: Container(color: Colors.grey[200],),),
                        SizedBox(width: getProportionateScreenWidth(10),),
                        Text("OR",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                        SizedBox(width: getProportionateScreenWidth(10),),
                        SizedBox(width: getProportionateScreenWidth(117),
                          height: 2,
                          child: Container(color: Colors.grey[200],),),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints.tightFor(
                          width: getProportionateScreenWidth(274),
                          height: getProportionateScreenHeight(60)),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          onPrimary: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(1.2),
                              height: getProportionateScreenHeight(55),
                              width: getProportionateScreenWidth(55),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Image.asset("assets/images/google_logo.png"),
                              )
                            ),
                            SizedBox(width: getProportionateScreenWidth(14),),
                            Text(
                              "Sign up with google",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenHeight(20)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
