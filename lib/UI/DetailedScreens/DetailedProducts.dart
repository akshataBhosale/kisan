import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/CompanyProfile/CompanyProfile.dart';
import 'package:kisan/UI/Tabs/HomeTabShreyas.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailedProducts extends StatefulWidget {


  @override
  _DetailedProductsState createState() => _DetailedProductsState();
}

class _DetailedProductsState extends State<DetailedProducts> {

  PanelController _pc1 = new PanelController();
  final _visibility = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: SizeConfig.screenWidth,
                        color: Colors.green,
                      ),
                      Positioned(
                        top: SizeConfig.screenWidth/1.1,
                        left: 0, right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: ['1','2','3','4','5'].map((url) {
                            int index = ['1','2','3','4','5'].indexOf(url);
                            return Container(
                              width: 30.0,
                              height: 5.0,
                              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: currentS == index
                                    ? Colors.white
                                    : Colors.black.withOpacity(0.3),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 35,
                        child: ConstrainedBox(
                          constraints: BoxConstraints.tightFor(
                            width: 55,
                            height: 55,
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.white.withOpacity(0.5),
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      "Sonalika Tiger 26",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF044BB0),
                          fontFamily: 'Poppins Bold'),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: RichText(
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
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 30),
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
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Special Offer',
                      style: TextStyle(
                          color: Color(0xFF044BB0),
                          fontSize: 14,
                          fontFamily: 'Poppins Bold'),
                    ),
                  ),
                  Container(
                    height: 260,
                    child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Offers();
                        }),
                  ),
                  //PDF Button ------------
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'For more details, download brochure',
                          style: TextStyle(
                              color: Color(0xFF044BB0),
                              fontSize: 14,
                              fontFamily: 'Poppins Bold'),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        PDFButton(
                          onDownloadPressed: (){
                            print("Download Pdf");
                          },
                          onPdfPressed: (){
                            print("View Pdf");
                          },
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 31,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: CompanyLink(
                      title: "Green Lake",
                      imagePath: "assets/images/sample_featured_brands.png",
                      onPressed: (){
                        push(context, CompanyDetails());
                        print("Company link Pressed : To Company Profile");
                      },
                    ),
                  ),
                  //-----More from the company
                  SizedBox(
                    height: 31,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'More from Sonalika',
                          style: TextStyle(
                              color: Color(0xFF044BB0),
                              fontSize: 20,
                              fontFamily: 'Poppins Bold'),
                        ),
                        //Change it with different SVG
                        GestureDetector(
                          onTap: (){
                            print("More Products from sonalika");
                          },
                          child: Icon(
                            Icons.play_circle_fill_outlined,
                            size: 25,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 260,
                    child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return MoreProds(
                            name: "SAME 325 DFI",
                            desc: "Duetz Fahr",
                            imgPath: "assets/images/tractor.png",
                          );
                        }),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  Container(
                    height: 700,
                    width: double.infinity,
                    color: Color(0xFFEBEBEB),
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Similar Products',
                          style: TextStyle(
                              color: Color(0xFF383838),
                              fontSize: 20,
                              fontFamily: 'Poppins Bold'),
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        Expanded(
                            child: GridView.count(
                              crossAxisCount: 2,
                              mainAxisSpacing: 20,
                              crossAxisSpacing: 10,
                              childAspectRatio: (150/180),
                              children: [
                                GridProds(
                                  name: "SAME 325 DFI",
                                  desc: "Duetz Fahr",
                                  imgPath: "assets/images/tractor.png",
                                ),
                                GridProds(
                                  name: "SAME 325 DFI",
                                  desc: "Duetz Fahr",
                                  imgPath: "assets/images/tractor.png",
                                ),
                                GridProds(
                                  name: "SAME 325 DFI",
                                  desc: "Duetz Fahr",
                                  imgPath: "assets/images/tractor.png",
                                ),
                                GridProds(
                                  name: "SAME 325 DFI",
                                  desc: "Duetz Fahr",
                                  imgPath: "assets/images/tractor.png",
                                ),
                              ],
                            )
                        ),
                        SizedBox(
                          height: 100,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          //Slide Up Panel Starts from here
          ValueListenableBuilder(
            valueListenable: _visibility,
            builder:(context,value,_)=> SlidingUpPanel(
              controller: _pc1,
              isDraggable: true,
              minHeight: 105,
              maxHeight: 550,
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
              panel: Visibility(
                visible: value,
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 33, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        height: 30,
                      ),
                      Text("Sonalika Tiger 26",style: GoogleFonts.poppins(fontSize: 13),),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: 44,
                        child: Text(
                          "Your mobile number & profile details will be "
                              "shared with Sonalika Tractors.",
                          style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 300,
                        child: ListView.builder(
                            itemCount: 8,
                            itemBuilder: (context, index) {
                              return RepInformation();
                            }),
                      ),
                      SizedBox(height: 7,),
                      Container(
                        child: Column(
                          children: [
                            Text("Get a call from the company",style: GoogleFonts.poppins(
                              fontSize: 13
                            ),),
                            SizedBox(height: 7,),
                            CallMeButton()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              collapsed: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 90),
                      child: Text(
                        "10 representative are online",
                        style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'Poppins Regular',
                            fontSize: 12),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FavButton(
                          onPressed: () {},
                        ),
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

class CallMeButton extends StatelessWidget {
  const CallMeButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: 365, height: 65),
      child: ElevatedButton(
        onPressed: (){
          print("Call me pressed");
        },
        style: ElevatedButton.styleFrom(
            primary: Color(0xFFFFE867),
            onPrimary: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            textStyle: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.call),
            SizedBox(width: 10,),
            Text("Call me")
          ],
        ),
      ),);
  }
}

class RepInformation extends StatelessWidget {
  const RepInformation({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Colors.green,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    "name",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(5),
                          color: Color(0xFFF9FFCC),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        child: Text("lang 1",
                            style: TextStyle(
                              fontSize: 9,
                            )),
                      ),
                      SizedBox(
                        width: 9,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(5),
                          color: Color(0xFFF9FFCC),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        child: Text("language 2",
                            style: TextStyle(
                              fontSize: 9,
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
          Row(
            children: [
              InkWell(
                onTap: (){
                  print("call Icon Pressed");
                },
                child: CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: Icon(
                    Icons.call,
                    color: Colors.green,
                    size: 17,
                  ),
                  radius: 15,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: (){
                  print("whatsapp icon pressed");
                },
                child: CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  //have to change this to SVG as there are 3 colors assigned to this :
                  //"not Added" :grey , "Requested" : yellow , "Added" : "green"
                  child: Image.asset("assets/images/whatsapp.png",width: 15,),
                  radius: 15,
                ),
              )
            ],
          ),
        ],
      ),
    );
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
              primary: Color(0xFF044BB0),
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call),
              SizedBox(
                width: 20,
              ),
              Text(
                "Contact Now",
                style: TextStyle(
                    fontSize: 20, fontFamily: 'Poppins Bold'),
              )
            ],
          )),
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
                primary: Colors.white,
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            onPressed: () {},
            child: Icon(
              Icons.favorite,
              color: Colors.grey,
            )));
  }
}

class GridProds extends StatelessWidget {
  final Function onPressed;
  final String imgPath, name, desc;

  GridProds({this.onPressed, this.imgPath, this.name, this.desc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 100,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          )
        ]),
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          image: AssetImage(imgPath ?? ""), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                )),
            Expanded(
                child: Container(
                  height: 50,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700]),
                  ),
                  Text(
                    desc,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(fontSize: 10),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class MoreProds extends StatelessWidget {
  final Function onPressed;
  final String imgPath, name, desc;

  MoreProds({this.onPressed, this.imgPath, this.name, this.desc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 230,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 10.0,
            spreadRadius: 2.0,
          )
        ]),
        margin: EdgeInsets.only(top: 40, bottom: 40, left: 30),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          image: AssetImage(imgPath ?? ""), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                )),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700]),
                  ),
                  Text(
                    desc,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(fontSize: 10),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class PDFButton extends StatelessWidget {
  const PDFButton({
    Key key, this.onPdfPressed, this.onDownloadPressed,
  }) : super(key: key);

  final Function onPdfPressed,onDownloadPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: 82),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 3,
          padding: EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 82,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
            ),
            SizedBox(
              width: 13,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tiger26_brochure",
                  style: TextStyle(
                      color: Color(0xFF363636),
                      fontFamily: 'Poppins Bold',
                      fontSize: 14),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "3 MB",
                  style: TextStyle(
                      color: Color(0xFF8E8E8E),
                      fontFamily: 'Poppins Regular',
                      fontSize: 11),
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            IconButton(
              onPressed: onPdfPressed,
              icon: Icon(Icons.picture_as_pdf),
              color: Colors.grey,
              iconSize: 30,
            ),
            IconButton(
              onPressed: onDownloadPressed,
              icon: Icon(Icons.download_sharp),
              color: Colors.grey,
              iconSize: 30,
            )
          ],
        ),
      ),
    );
  }
}

class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
              color: Color(0xFF08A796).withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2)
        ],
        color: Color(0xFF08A796),
      ),
      margin: EdgeInsets.only(
          top: getProportionateScreenHeight(20),
          left: getProportionateScreenHeight(30),
          bottom: getProportionateScreenHeight(20)),
      width: getProportionateScreenWidth(172),
      child: Stack(
        children: [
          Positioned(top: 10, left: 10, child: CompanyName()),
          Center(
            child: Container(
                width: getProportionateScreenWidth(125),
                child: Image.asset("assets/images/tractor.png")),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "10%",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'Poppins Bold'),
                  ),
                  Text(
                    "Discount",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'Poppins Bold'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyLink extends StatelessWidget {
  const CompanyLink({
    Key key,
    this.title,
    this.imagePath, this.onPressed,
  }) : super(key: key);

  final String title, imagePath;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 10)
                      ]),
                  child: Image.asset(imagePath),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(15),
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      color : Color(0xFF5C5C5C),
                      fontSize: 15, fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
