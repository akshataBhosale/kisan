import 'package:flutter/material.dart';
import 'package:kisan/Helpers/size_config.dart';

class SubTile extends StatelessWidget {
  const SubTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 9,horizontal: 12),
      width: getProportionateScreenWidth(378),
      height: getProportionateScreenHeight(70),
      decoration: BoxDecoration(
          color: Color(0xFFFC730F),
          borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/Subscribe.png",
            width: getProportionateScreenWidth(30),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Subscribe to KISAN 365.",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins Bold',
                    fontSize: getProportionateScreenHeight(16)),
              ),
              Text(
                "Unlock all features for 1 year.",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins Regular',
                    fontSize: getProportionateScreenHeight(16)),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    child: Text("Subscribe")),
              ),
              SizedBox(height: getProportionateScreenHeight(5),),
              Text(
                "From ₹100",
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins Bold',
                    fontSize: getProportionateScreenHeight(10)),
              )
            ],
          ),
        ],
      ),
    );
  }
}