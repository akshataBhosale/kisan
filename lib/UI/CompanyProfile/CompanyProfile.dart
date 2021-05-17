import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/CompanyProfile/Tabs/AboutTab.dart';
import 'package:kisan/UI/CompanyProfile/Tabs/ProductsTab.dart';
import 'package:kisan/UI/CompanyProfile/Tabs/VideoTab.dart';
import 'package:kisan/UI/CompanyProfile/Widgets/CompanyTabs.dart';
import 'package:kisan/UI/DetailedScreens/DetailedFeaturdProducts.dart';
import 'package:kisan/UI/Tabs/HomeTabShreyas.dart';

class CompanyDetails extends StatefulWidget {
  @override
  _CompanyDetailsState createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  PageController _controller;
  int _selectedTab = 0;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
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
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 249,
              decoration: BoxDecoration(
                color: Colors.green,
                // image: DecorationImage()
              ),
            ),
            Container(
              color: Color(0xFF0051BC),
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
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
                        child: Image.asset(
                            "assets/images/sample_featured_brands.png"),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sonalika Tractors",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Poppins Bold'),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/leaf.svg",width: 11,),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Green",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontFamily: 'Poppins Regular'),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CompanyTabs(
                    selectedTab: _selectedTab,
                    tabPressed: (num) {
                      _controller.animateToPage(num,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeOutCubic);
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 1500,
              child: PageView(
                controller: _controller,
                onPageChanged: (num) {
                  setState(() {
                    _selectedTab = num;
                  });
                },
                children: [
                  AboutTab(),
                  ProductsTab(),
                  VideosTab()
                ],
              ),
            ),
          ],
        ),
      ),
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

class HeaderTexts extends StatelessWidget {
  const HeaderTexts({
    Key key,
    this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
          color: Color(0xFF535050), fontWeight: FontWeight.bold, fontSize: 20),
    );
  }
}
