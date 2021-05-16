import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 17),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: BackButton(),
              title: Text(
                "Notification",
                style: TextStyle(
                    fontSize: 18, fontFamily: 'Poppins Bold', color: Colors.black),
              ),
            ),
          ),
        ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
            horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              NotificationTile(),
              NotificationTile(),
              NotificationTile()
            ],
          ),
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: 55,
          height: 55,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 20),
              side: BorderSide(width: 1, color: Color(0xFF008940)),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: () {
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF008940),
          ),
        ),
      ),
    );
  }
}

class NotificationTileHeader extends StatelessWidget {
  const NotificationTileHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Image.asset("assets/images/sample_featured_brands.png"),
          width: 50,
          height: 50,
        ),
        SizedBox(
          width:10,
        ),
        Flexible(
          child: RichText(
            text: TextSpan(
                text: "Sonalika Tractors",
                style: GoogleFonts.poppins(
                    fontSize: 14,fontWeight: FontWeight.bold,
                    color: Colors.black),
                children: [
                  TextSpan(
                    text: " has invited you to see their product ",
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.grey[700]),
                  ),
                  TextSpan(
                      text: "Tiger series tractor",
                      style: GoogleFonts.poppins(
                          fontSize: 14,fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ]),
          ),
        ),
      ],
    );
  }
}

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 540,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(top: 20,left: 10,right: 10),
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 10.0,
              spreadRadius: 2.0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("1m ago",style: GoogleFonts.roboto(
                  fontSize: 12,
                ),),
                Icon(Icons.keyboard_arrow_down,color: Colors.green,)
              ],
            ),
            NotificationTileHeader(),
            Container(
              height: 390,
              child: Image.asset(
                "assets/images/tractor2.jpg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("SEE OFFER",style: GoogleFonts.poppins(
                    color: Colors.green,
                    fontSize: 12
                  ),),
                  Text("Offer valid till 31st Jan.")
                ],
              ),
            ),
          ],
        ));
  }
}

