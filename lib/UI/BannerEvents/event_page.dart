import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/DetailedScreens/DetailedProducts.dart';
import 'package:kisan/UI/Tabs/HomeTabShreyas.dart';
import 'package:kisan/UI/Webinars/webinar_main_screen.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:video_player/video_player.dart';

class BannerEventPage extends StatefulWidget {
  @override
  _BannerEventPageState createState() => _BannerEventPageState();
}

class _BannerEventPageState extends State<BannerEventPage> {

  VideoPlayerController _controller;
  FlickManager flickManager;
  PanelController _pc1 = new PanelController();
  final _visibility = ValueNotifier(false);

  BorderRadiusGeometry radius = BorderRadius.only(
    topLeft: Radius.circular(0),
    topRight: Radius.circular(0),
    bottomLeft: Radius.circular(0),
    bottomRight: Radius.circular(0),
  );

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://dezyit.ml/mobileapp/mailerimages/DezyVideos/')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.network("https://dezyit.ml/mobileapp/mailerimages/DezyVideos/"),
    );
  }
  @override
  void dispose() {
    super.dispose();
    flickManager.dispose();
    _controller.dispose();
  }

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BackButton(),
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
                    child: FlickVideoPlayer(
                      flickManager: flickManager,
                      flickVideoWithControls: FlickVideoWithControls(
                        controls: FlickPortraitControls(),
                      ),
                      flickVideoWithControlsFullscreen: FlickVideoWithControls(
                        controls: FlickLandscapeControls(),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Organised by",
                      style: GoogleFonts.poppins(
                        color: Color(0xff5A5A5A),
                        fontSize: 23,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          height: 50,
                          child: Row(
                            children: [
                              Image.asset("assets/images/KISAN-logo.png",),
                              SizedBox(width: 10,),
                              Image.asset("assets/images/KISAN.png",),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          height: 50,
                          child: Image.asset("assets/images/drone-fed.png",),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "About event",
                      style: GoogleFonts.poppins(
                        color: Color(0xff5A5A5A),
                        fontSize: 23,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Bibendum est ultricies integer quis. Iaculis urna id volutpat lacus laoreet. Mauris vitae ultricies leo integer malesuada. Ac odio tempor orci dapibus ultrices in. Egestas diam in arcu cursus euismod. Dictum fusce ut placerat orci nulla. Tincidunt",
                      style: GoogleFonts.poppins(
                        color: Color(0xff5A5A5A),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Webinar",
                      style: GoogleFonts.poppins(
                        color: Color(0xff5A5A5A),
                        fontSize: 23,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 0),
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount: 1,
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return WebinarTile();
                          }),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      "Highlights",
                      style: GoogleFonts.poppins(
                        color: Color(0xff5A5A5A),
                        fontSize: 23,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xffCEFFE1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Drone",
                              style: GoogleFonts.poppins(
                                color: Color(0xff008940),
                                fontSize: 23,fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "companies from\nacross India.",
                              style: GoogleFonts.poppins(
                                color: Color(0xff5A5A5A),
                                fontSize: 18,fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xffCEFFFF)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "100 +",
                              style: GoogleFonts.poppins(
                                color: Color(0xff007489),
                                fontSize: 23,fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "100+ Drone products &\nservices in agri.",
                              style: GoogleFonts.poppins(
                                color: Color(0xff5A5A5A),
                                fontSize: 18,fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xffFFF5D3)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Latest",
                              style: GoogleFonts.poppins(
                                color: Color(0xffFF9963),
                                fontSize: 23,fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "in the agri-tech.",
                              style: GoogleFonts.poppins(
                                color: Color(0xff5A5A5A),
                                fontSize: 18,fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 200),
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
                      height: 10,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Icon(Icons.lock, color: Colors.green[800], size: 40)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Subscribe to a membership plan to unlock the information",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text("Anual Subscription",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(fontSize: 18),),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                //color: Colors.grey,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(image: AssetImage("assets/images/planbg.png"),
                                  fit: BoxFit.fill,
                                )
                              ),
                            ),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Image.asset("assets/images/35.png")),
                            Padding(
                              padding: const EdgeInsets.only(right: 30, top: 50),
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(height:40,width:40,child: Image.asset("assets/images/per1.png"))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 60, top: 30),
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Container(height:40,width:40,child: Image.asset("assets/images/per2.png"))),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 35),
                              child: Text("Standard",
                                style: GoogleFonts.poppins(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 18,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 55, left: 35),
                              child: Text("Recommended for Farmers &\nAgriculture enthusiasts.",
                                style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 100, left: 35),
                              child: Text("> Get access.\n> Explore Products and Companies.\n> Connect with the representatives.",
                                style: GoogleFonts.poppins(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 150, right: 10),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 40,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    color: Color(0xffB2F8D2)
                                  ),
                                  child: Center(
                                    child: Text("₹ 100/-",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff298658)
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 100,
                          padding: EdgeInsets.only(left: 0, right: 0, top: 40),
                          child: ContactButton(
                            onPressed: () {
                              _pc1.isPanelOpen ? _pc1.close() : _pc1.open();
                              setState(() {
                                _visibility.value = true;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Auto-renews annualy. Cancel anytime.",
                              style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.bold,
                                  color: Color(0xff298658)
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              collapsed: Stack(
                children: [
                  Container(
                    height: 100,
                    padding: EdgeInsets.only(left: 0, right: 0, top: 40),
                    child: ContactButton(
                      onPressed: () {
                        _pc1.isPanelOpen ? _pc1.close() : _pc1.open();
                        setState(() {
                          _visibility.value = true;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 13),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "Auto-renews annualy. Cancel anytime.",
                        style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.bold,
                          color: Color(0xff298658)
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
          pop(context);
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
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 2.0,
              spreadRadius: 0.1,
            )
          ]
      ),
      child: ConstrainedBox(
          constraints:
          BoxConstraints.tightFor(width: MediaQuery.of(context).size.width/2.5, height: 65),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {},
              child: Center(
                child: Text(
                  "Know more",
                  style: GoogleFonts.poppins(
                      letterSpacing: 1, color: Colors.black,
                      fontSize: 18),
                ),
              ))),
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
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            primary: Color(0xFF298658),
            elevation: 1,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Subscribe",
              style: GoogleFonts.poppins(
                  letterSpacing: 1,
                  fontSize: 20,fontWeight: FontWeight.bold),
            )
          ],
        ));
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

class WebinarTile extends StatelessWidget {
  const WebinarTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        push(context, WebinarMainScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width/1.12,
        margin: EdgeInsets.only(
            top: getProportionateScreenHeight(20),
            bottom: getProportionateScreenHeight(20),
            right: getProportionateScreenWidth(20)),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 5.0,
                spreadRadius: 1.0,
              )
            ]
        ),
        child: Column(
          children: [
            Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xff008940),
                          image: DecorationImage(
                              image: AssetImage(""),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15))),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: CompanyName(),
                    )
                  ],
                )),
            Container(
              padding: EdgeInsets.all(6),
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffFFEE6C)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "16",
                          style: TextStyle(
                              fontSize: 20,
                              height: 1.3,
                              fontFamily: 'Poppins Bold'),
                        ),
                        Text(
                          "Dec",
                          style:
                          TextStyle(fontSize: 12, fontFamily: 'Poppins Bold'),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: MediaQuery.of(context).size.width/1.5/1.9,
                          child: Text(
                            "Importance of nutrition in Cattle Raising",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                            GoogleFonts.poppins(fontSize: 14,color: Colors.grey[700],fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Tuesday, 11:30 am",
                        overflow: TextOverflow.ellipsis,
                        style:
                        GoogleFonts.poppins(fontSize: 10,color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(width: 10,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
