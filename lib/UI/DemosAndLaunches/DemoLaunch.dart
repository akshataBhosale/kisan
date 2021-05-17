import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/UI/CompanyProfile/CompanyProfile.dart';
import 'package:kisan/UI/DetailedScreens/DetailedFeaturdProducts.dart';
import 'package:video_player/video_player.dart';

class DemoLaunch extends StatefulWidget {
  @override
  _DemoLaunchState createState() => _DemoLaunchState();
}

class _DemoLaunchState extends State<DemoLaunch> {

  VideoPlayerController _controller;
  FlickManager flickManager;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://dezyit.ml/mobileapp/mailerimages/DezyVideos/'
            )
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(),
                ShareButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FavButton(
              onPressed: () {},
            ),
            Spacer(),
            ContactButton(
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
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
                "Introducing From John Deere\n5E Series tractors",
                style: GoogleFonts.poppins(
                  color: Color(0xff009F4B),
                  fontSize: 23, fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "John Deere 5E Series has a Single Clutch, which provides smooth and easy functioning. John Deere 5E Series steering type is Hydrostatic from that tractor get easy to control and fast response. The tractor has Multi Disc/Oil Immersed Brakes (optional) which provide high grip and low slippage.",
                style: GoogleFonts.poppins(
                  color: Color(0xff454545),
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
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
          ],
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
    return Container(
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
    return ConstrainedBox(
      constraints:
      BoxConstraints.tightFor(width: MediaQuery.of(context).size.width/2.2, height: 65),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: Color(0xFF009F4B),
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.call,
                color: Colors.white,
              ),
              Text(
                "Contact",
                style: GoogleFonts.poppins(
                    letterSpacing: 1,
                    fontSize: 18,fontWeight: FontWeight.bold),
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
