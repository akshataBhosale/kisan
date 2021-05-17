import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/UI/CompanyProfile/CompanyProfile.dart';
import 'package:kisan/UI/DetailedScreens/DetailedFeaturdProducts.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class WebinarMainScreen extends StatefulWidget {
  @override
  _WebinarMainScreenState createState() => _WebinarMainScreenState();
}

class _WebinarMainScreenState extends State<WebinarMainScreen> {

  PanelController _pc1 = new PanelController();
  final _visibility = ValueNotifier(false);

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
    bottomLeft: Radius.circular(20),
    bottomRight: Radius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(),
                ShareButton(),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 249,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      // image: DecorationImage()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "Importance of nutrition in raising healthy animals.",
                            style: GoogleFonts.poppins(
                                color: Color(0xff5C5C5C),
                                fontSize: 20, fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: 50, width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xff08763F),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("म",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                Text("मराठी",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50, width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xffB7B7B7),
                          ),
                          child: Center(
                            child: Icon(Icons.calendar_today, color: Colors.grey[700],),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Flexible(
                          child: Text(
                            "Tuesday, 16 December 2021\n11:30 am - 12:30 pm IST",
                            style: GoogleFonts.poppins(
                              color: Color(0xffB7B7B7),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      "About the Event",
                      style: GoogleFonts.poppins(
                        color: Color(0xff5C5C5C),
                        fontSize: 18, fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Bibendum est ultricies integer quis. Iaculis urna id volutpat lacus laoreet. Mauris vitae ultricies leo integer malesuada. Ac odio tempor orci dapibus ultrices in. Egestas diam in arcu cursus",
                      style: GoogleFonts.poppins(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Container(
                      color: Colors.white,
                      child: CompanyLink(
                        title: "Green Lake",
                        imagePath: "assets/images/sample_featured_brands.png",
                        onPressed: (){
                          push(context, CompanyDetails());
                          print("Company link Pressed : To Company Profile");
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: _visibility,
            builder:(context,value,_)=> SlidingUpPanel(
              controller: _pc1,
              isDraggable: true,
              borderRadius: radius,
              onPanelClosed: () {
                setState(() {
                  _visibility.value = false;
                });
              },
              onPanelOpened: () {
                setState(() {
                  _visibility.value = true;
                });
              },
              panel: Container(
                height: MediaQuery.of(context).size.height*2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 76,
                          height: 8,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Your mobile number and profile details\nmay be shared with John Deere.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 18),),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Please answer the following\nQuestions to register for this webinar.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 18,
                        color: Color(0xff008940),fontWeight: FontWeight.bold,
                      ),),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("1 - Do you have a Tractor ?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontSize: 18),),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20, width: 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(50)),
                                    border: Border.all(color: Colors.grey)
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text("Yes",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontSize: 18),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20, width: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                      border: Border.all(color: Colors.grey)
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text("No",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontSize: 18),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text("2 - What machine do you use for spraying?",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontSize: 18),),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20, width: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                      border: Border.all(color: Colors.grey)
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text("Knapsack Sprayer.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontSize: 18),),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 20, width: 20,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(50)),
                                      border: Border.all(color: Colors.grey)
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Text("Portable Power Sprayer.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(fontSize: 18),),
                              ],
                            ),
                            SizedBox(height: 30,),
                            ConstrainedBox(
                              constraints:
                              BoxConstraints.tightFor(width: MediaQuery.of(context).size.width, height: 65),
                              child: ElevatedButton(
                                  onPressed: (){},
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF08763F),
                                      elevation: 1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Register for free",
                                        style: GoogleFonts.poppins(
                                            letterSpacing: 1,
                                            fontSize: 20,fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              collapsed: Container(
                height: 90,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 13)
                    ]),
                child: Row(
                  children: [
                    FavButton(
                      onPressed: () {},
                    ),
                    Spacer(),
                    ContactButton(
                      onPressed: () {
                        _pc1.isPanelOpen ? _pc1.close() : _pc1.open();
                        setState(() {
                          _visibility.value = true;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: 55,
        height: 55,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          //pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    );
  }
}

class FavButton extends StatelessWidget {
  const FavButton({
    Key key, this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints:
        BoxConstraints.tightFor(width: 65, height: 65),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.yellow[300],
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: () {},
            child: Icon(
              Icons.call,
              color: Colors.black,
            )));
  }
}

class ContactButton extends StatelessWidget {
  const ContactButton({
    Key key, this.onPressed,
  }) : super(key: key);

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints:
      BoxConstraints.tightFor(width: 285, height: 65),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: Color(0xFF08763F),
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Register for free",
                style: GoogleFonts.poppins(
                  letterSpacing: 1,
                    fontSize: 20,fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: 55,
        height: 55,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            //padding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          //pop(context);
        },
        child: Icon(
          Icons.share,
          color: Colors.black,
        ),
      ),
    );
  }
}
