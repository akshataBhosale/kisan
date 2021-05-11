import 'package:flutter/material.dart';
import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/Tabs/HomeTab.dart';

class DetailedFeaturedProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: ConstrainedBox(
              constraints: BoxConstraints.tightFor(
                width: 55,
                height: 55,
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          height: 112,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ConstrainedBox(
                  constraints:
                      BoxConstraints.tightFor(width: 65, height: 65),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Icon(
                        Icons.favorite,
                        color: Colors.grey,
                        size: 30,
                      ))),
              Column(
                children: [
                  Text(
                    "10 representative are online",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Poppins Regular',
                        fontSize: 12),
                  ),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints.tightFor(width: 285, height: 65),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: Color(DETAILED_SCREEN_TEXT_COLOR),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.call),
                            SizedBox(width: 20,),
                            Text(
                              "Contact Now",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins Bold'
                              ),
                            )
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: SizeConfig.screenWidth,
                color: Colors.green,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 27,
                    ),
                    Text(
                      "Sonalika Tiger 26",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(DETAILED_SCREEN_TEXT_COLOR),
                          fontFamily: 'Poppins Bold'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "₹",
                            style: TextStyle(
                                color: Color(0xFF393939),
                                fontSize: 20,
                                fontFamily: 'Poppins Regular'),
                            children: [
                          TextSpan(
                            text: " 6,28,000",
                            style: TextStyle(
                                color: Color(0xFF393939),
                                fontSize: 20,
                                fontFamily: 'Poppins Bold'),
                          ),
                          TextSpan(
                              text: " onwards",
                              style: TextStyle(
                                  fontFamily: 'Poppins Regular', fontSize: 20))
                        ])),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Sonalika Tiger 26 has a Single Clutch, which provides smooth "
                        "and easy functioning. Sonalika Tiger 26 steering type is Hydrostatic "
                        "from that tractor get easy to control and fast response. The tractor "
                        "has Multi Disc/Oil Immersed Brakes (optional) which provide high "
                        "grip and low slippage. It has a heavy hydraulic lifting capacity "
                        "and Sonalika Tiger 26 mileage is economical in every field and "
                        "has a liters fuel tank capacity. Additionally, Sonalika Tiger "
                        "26 comes with 8 Forward + 2 Reverse gearboxes which provides "
                        "comfort while driving the tractor.",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF393939),
                            fontFamily: 'Poppins Regular'),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text('Special Offer'),
                    SizedBox(
                      height: 21,
                    ),
                    Container(
                      height: 260,
                      child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return LatestOfferTile();
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
