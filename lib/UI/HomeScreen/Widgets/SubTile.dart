import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/size_config.dart';

class SubTile extends StatelessWidget {
  const SubTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.symmetric(vertical: 9,horizontal: 12),
      width: getProportionateScreenWidth(378),
      height: getProportionateScreenHeight(70),
      decoration: BoxDecoration(
          color: Color(0xFFFC730F),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/Subscribe.png",
              width: getProportionateScreenWidth(30),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Subscribe to KISAN 365.",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,fontSize: 16
                  ),
                ),
                Text(
                  "Unlock all features for 1 year.",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,fontSize: 12,letterSpacing: 0.5
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints.tightFor(
                      width: getProportionateScreenWidth(88),
                      height: getProportionateScreenHeight(25)
                  ),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Color(0xFFFC730F),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)
                          ),
                          textStyle: TextStyle(
                              fontFamily: 'Poppins Bold',
                              fontSize:
                              getProportionateScreenHeight(12))),
                      child: Text("Subscribe",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
                SizedBox(height: getProportionateScreenHeight(5),),
                Text(
                  "From ₹100",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,fontSize: 10
                    ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}