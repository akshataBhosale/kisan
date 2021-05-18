import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:kisan/UI/Intro/splash_four.dart';
import 'package:kisan/UI/Intro/splash_one.dart';
import 'package:kisan/UI/Intro/splash_three.dart';
import 'package:kisan/UI/Intro/splash_two.dart';

bool showSkip = true;
int current = 0;
List<Widget> list = [
  SplashOne(),
  SplashTwo(),
  SplashThree(),
  SplashFour(),
];

class SplashPageViewBuilder extends StatefulWidget {
  @override
  _SplashPageViewBuilderState createState() => _SplashPageViewBuilderState();
}

class _SplashPageViewBuilderState extends State<SplashPageViewBuilder> {
  List<Slide> slides = new List();

  void onDonePress() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showSkip = true;
    slides.add(
      new Slide(
        centerWidget: SplashOne(),
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        centerWidget: SplashTwo(),
        backgroundColor: Colors.white,
      ),
    );
    slides.add(
      new Slide(
        centerWidget: SplashThree(),
        backgroundColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: CarouselSlider.builder(
                itemCount: 4,
                options: CarouselOptions(
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height,
                    initialPage: 0,
                    enableInfiniteScroll: false,
                    reverse: false,
//                    autoPlay: false,
//                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 100),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                      if (index == 2) {
                        setState(() {
                          showSkip = false;
                        });
                      } else if (index == 0 || index == 1) {
                        setState(() {
                          showSkip = true;
                        });
                      }
                    }),
                itemBuilder: (BuildContext context, int itemIndex) =>
                    itemIndex == 0
                        ? SplashOne()
                        : itemIndex == 1
                            ? SplashTwo()
                            : itemIndex == 2
                                ? SplashThree()
                                : SplashFour(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: list.map((url) {
                    int index = list.indexOf(url);
                    return Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: current == index
                            ? Color.fromRGBO(0, 0, 0, 0.9)
                            : Color.fromRGBO(0, 0, 0, 0.4),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
