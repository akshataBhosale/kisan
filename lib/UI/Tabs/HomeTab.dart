import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/HomeScreen/Widgets/SubTile.dart';
import 'package:kisan/View%20Models/CustomViewModel.dart';
import 'package:kisan/Models/DemoListParser.dart';
import 'package:kisan/Models/OfferListParser.dart';
import 'package:kisan/Models/LaunchListParser.dart';
import 'package:kisan/Models/EventListParser.dart';
import 'package:kisan/Models/CategoryListParser.dart';
import 'package:provider/provider.dart';


class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final providerListener = Provider.of<CustomViewModel>(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SubTile(),
              ),
              ImageSlider(),
              providerListener.categoryList.length > 0
                  ? Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: SubCatTitles(
                            title: "Categories",
                          ),
                        ),
                        Container(
                          height: 130,
                          child: ListView.builder(
                              itemCount: providerListener.categoryList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoryTiles(context,
                                    providerListener.categoryList[index]);
                              }),
                        )
                      ],
                    )
                  : SizedBox(
                      height: 1,
                    ),
              //Divider(),
              providerListener.featuredproductsList.length > 0
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Column(
                          children: [
                            SubCatTitles(
                              title: "Featured Products",
                              image: "assets/images/star.png",
                            ),
                            Container(
                              height: 300,
                              child: ListView.builder(
                                  itemCount: providerListener
                                      .featuredproductsList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return FeaturedProducts(
                                      name: providerListener
                                          .featuredproductsList[index]
                                          .title_english,
                                      desc: providerListener
                                          .featuredproductsList[index]
                                          .desc_english,
                                      image: providerListener
                                          .featuredproductsList[index]
                                          .bigthumb_url,
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              //CustomDivider(),
              providerListener.companiesList.length > 0
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            SubCatTitles(
                              title: "Featured Brands",
                              iconData: Icons.bookmark,
                            ),
                            Container(
                              height: 165,
                              color: Colors.white,
                              child: ListView.builder(
                                  itemCount:
                                      providerListener.companiesList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return FeaturedBrands(
                                      organisation_name: providerListener
                                          .companiesList[index]
                                          .organisation_name,
                                      image: providerListener
                                          .companiesList[index]
                                          .image_bigthumb_url,
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              AdTile(context, 0),

              //---------------"Newly Adds" Section---------------------

              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              providerListener.productsList.length > 0
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(22)),
                      child: Column(
                        children: [
                          SubCatTitles(
                            title: "Newly Added Products",
                            iconData: Icons.flag_rounded,
                          ),
                          Container(
                            height: 300,
                            child: ListView.builder(
                                itemCount: providerListener.productsList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return FeaturedProducts(
                                    name: providerListener
                                        .productsList[index].title_english,
                                    desc: providerListener
                                        .productsList[index].desc_english,
                                    image: providerListener
                                        .productsList[index].bigthumb_url,
                                  );
                                }),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              //CustomDivider(),
              providerListener.companiesList.length > 0
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(22)),
                      child: Column(
                        children: [
                          SubCatTitles(
                            title: "Newly Added Brands",
                            iconData: Icons.bookmark,
                          ),
                          Container(
                            height: 158,
                            child: ListView.builder(
                                itemCount:
                                    providerListener.companiesList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return FeaturedBrands(
                                    organisation_name: providerListener
                                        .companiesList[index].organisation_name,
                                    image: providerListener.companiesList[index]
                                        .image_bigthumb_url,
                                  );
                                }),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              AdTile(context, 1),

              //-------------Webinars Sections--------------

              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              providerListener.eventList.length > 0
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Column(
                          children: [
                            SubCatTitles(
                              title: "Upcoming Webinars",
                            ),
                            Container(
                              height: 250,
                              child: ListView.builder(
                                  itemCount: providerListener.eventList.length,
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return WebinarTile(context,
                                        providerListener.eventList[index]);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              SizedBox(
                height: 20,
              ),
              providerListener.featuredeventList.length > 0
                  ? Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        child: Column(
                          children: [
                            SubCatTitles(
                              title: "Featured Webinars",
                            ),
                            Container(
                              height: 220,
                              child: ListView.builder(
                                  itemCount:
                                      providerListener.featuredeventList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return FeaturesWebinar(
                                        context,
                                        providerListener
                                            .featuredeventList[index]);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              SizedBox(
                height: 10,
              ),
              //CustomDivider(),
              providerListener.offersList.length > 0
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(22)),
                      child: Column(
                        children: [
                          SubCatTitles(
                            title: "Latest Offers",
                          ),
                          Container(
                            height: getProportionateScreenHeight(263),
                            child: ListView.builder(
                                itemCount: providerListener.offersList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return LatestOfferTile(
                                      providerListener.offersList[index]);
                                }),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              AdTile(context, 2),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),

              //-------------Webinars Sections--------------

              providerListener.demosList.length > 0
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(22)),
                      child: Column(
                        children: [
                          SubCatTitles(
                            title: "Latest Demo",
                          ),
                          Container(
                            height: getProportionateScreenHeight(263),
                            child: ListView.builder(
                                itemCount: providerListener.demosList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return LatestDemo(context,
                                      providerListener.demosList[index]);
                                }),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              SizedBox(
                height: 30,
              ),
              //CustomDivider(),
              providerListener.launchList.length > 0
                  ? Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(22)),
                      child: Column(
                        children: [
                          SubCatTitles(
                            title: "Latest Product Launch",
                          ),
                          Container(
                            height: 450,
                            child: ListView.builder(
                                itemCount: providerListener.launchList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return LatestProductLaunch(context,
                                      providerListener.launchList[index]);
                                }),
                          ),
                        ],
                      ),
                    )
                  : SizedBox(
                      height: 1,
                    ),
              CustomDivider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SubCatTitles(
                      title: "Unread Notifications",
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InvitationTile(),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    InvitationTile(),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),
                    InvitationTile(),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all Notification",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Color(COLOR_ACCENT),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              ColouredCustomButtons(
                imgPath: "assets/images/discount.png",
                bgColour: Color(0xFFF7F2D4),
                primaryColour: Color(0xFFA27000),
                text: "Offers",
                onPressed: () {},
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              ColouredCustomButtons(
                imgPath: "assets/images/calender.png",
                bgColour: Color(0xFFCEF7F5),
                primaryColour: Color(0xFF05AEBA),
                text: "Webinar",
                onPressed: () {},
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              ColouredCustomButtons(
                imgPath: "assets/images/video_play.png",
                bgColour: Color(0xFFD8FCD8),
                primaryColour: Color(0xFF008840),
                text: "Demo",
                onPressed: () {},
              ),
              SizedBox(
                height: getProportionateScreenHeight(15),
              ),
              ColouredCustomButtons(
                imgPath: "assets/images/rocket.png",
                bgColour: Color(0xFFFFE6E2),
                primaryColour: Color(0xFFC8341C),
                text: "Product Launch",
                onPressed: () {},
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget LatestOfferTile(OfferListParser offerOBJ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xFF08A796),
      ),
      margin: EdgeInsets.only(
          top: getProportionateScreenHeight(20),
          right: getProportionateScreenHeight(20),
          bottom: getProportionateScreenHeight(20)),
      width: getProportionateScreenWidth(172),
      child: Stack(
        children: [
          Center(
            child: Container(
                child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(offerOBJ.bigthumb_url ?? ""),
                    fit: BoxFit.fill),
              ),
            )),
          ),
          Positioned(
              top: 10,
              left: 10,
              child: CompanyName(
                smallthumb_url: offerOBJ.smallthumb_url,
                organisation_name: offerOBJ.organisation_name,
              )),
          Positioned(
            bottom: 10,
            left: 10,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (offerOBJ.percentage_discount ?? "0") + "%",
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

class ColouredCustomButtons extends StatelessWidget {
  const ColouredCustomButtons({
    Key key,
    this.bgColour,
    this.primaryColour,
    this.imgPath,
    this.text,
    this.onPressed,
  }) : super(key: key);

  final Color bgColour, primaryColour;
  final String imgPath, text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
            width: getProportionateScreenWidth(370), height: 60),
        child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                primary: bgColour,
                elevation: 0,
                alignment: Alignment.center,
                onPrimary: primaryColour,
                side: BorderSide(color: primaryColour, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        imgPath,
                        width: getProportionateScreenWidth(30),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Text(
                        text,
                        style: TextStyle(
                            color: primaryColour,
                            fontFamily: 'Poppins Bold',
                            fontSize: 18),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: primaryColour,
                )
              ],
            )),
      ),
    );
  }
}

class InvitationTile extends StatelessWidget {
  const InvitationTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: getProportionateScreenHeight(522),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300],
              blurRadius: 1.0,
              spreadRadius: 1.0,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CompanyInvitationHeader(),
            Container(
              height: getProportionateScreenHeight(390),
              child: Image.asset(
                "assets/images/tractor2.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ],
        ));
  }
}

class CompanyInvitationHeader extends StatelessWidget {
  const CompanyInvitationHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Image.asset("assets/images/sample_featured_brands.png"),
          width: getProportionateScreenWidth(50),
          height: getProportionateScreenWidth(50),
        ),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Flexible(
          child: RichText(
            text: TextSpan(
                text: "Sonalika Tractors",
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
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
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ]),
          ),
        ),
      ],
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
        Divider(
          thickness: getProportionateScreenHeight(6),
          color: Color(0xFFBDC9C5),
          height: 0,
        ),
        SizedBox(
          height: getProportionateScreenHeight(30),
        ),
      ],
    );
  }
}

Widget LatestProductLaunch(BuildContext context, LaunchListParser lauchOBJ) {
  return GestureDetector(
    child: Container(
      padding: EdgeInsets.all(13),
      width: MediaQuery.of(context).size.width / 1.3,
      margin: EdgeInsets.only(
          top: 30,
          bottom: getProportionateScreenHeight(30),
          right: 30,
          left: 5),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(lauchOBJ.bigthumb_url ?? ""),
            fit: BoxFit.fill,
            scale: 2,
            alignment: Alignment.bottomCenter,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey[200], blurRadius: 2, spreadRadius: 2)
          ]),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: CompanyName(
                smallthumb_url: lauchOBJ.smallthumb_url,
                organisation_name: lauchOBJ.organisation_name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20),
              child: Text(
                lauchOBJ.description,
                style: GoogleFonts.poppins(
                    color: Colors.grey[700],
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget LatestDemo(BuildContext context, DemoListParser demoOBJ) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.3,
    height: 200,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey[300],
          blurRadius: 3.0,
          spreadRadius: 2.5,
        )
      ],
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    margin: EdgeInsets.only(top: 20, bottom: 10, right: 10, left: 5),
    child: Column(
      children: [
        Expanded(
            child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                image: DecorationImage(
                    image: NetworkImage(demoOBJ.bigthumb_url ?? ""),
                    fit: BoxFit.fill),
              ),
            ),
            Center(
              child: Opacity(
                opacity: 0.7,
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            )
          ],
        )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 9),
          height: getProportionateScreenHeight(80),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15)),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CompanyName(
                  smallthumb_url: demoOBJ.smallthumb_url,
                  organisation_name: demoOBJ.organisation_name,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  demoOBJ.description,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget WebinarTile(BuildContext context, EventListParser eventOBJ) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.5,
    margin: EdgeInsets.only(
        top: getProportionateScreenHeight(20),
        bottom: getProportionateScreenHeight(20),
        right: getProportionateScreenWidth(20)),
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.grey[300],
        blurRadius: 5.0,
        spreadRadius: 1.0,
      )
    ]),
    child: Column(
      children: [
        Expanded(
            child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[700],
                  image: DecorationImage(
                      image: NetworkImage(eventOBJ.image_path_medium ?? ""),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: CompanyName(
                smallthumb_url: eventOBJ.image_smallthumb_url,
                organisation_name: eventOBJ.organisation_name,
              ),
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
              SizedBox(
                width: 10,
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.yellowAccent),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      eventOBJ.scheduled_date
                          .substring(eventOBJ.scheduled_date.length - 2),
                      style: TextStyle(
                          fontSize: 20,
                          height: 1.3,
                          fontFamily: 'Poppins Bold'),
                    ),
                    Text(
                      DateFormat.MMMM()
                          .format(DateTime.parse(eventOBJ.scheduled_date))
                          .toString(),
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
                      width: MediaQuery.of(context).size.width / 1.5 / 1.9,
                      child: Text(
                        eventOBJ.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    DateFormat.EEEE()
                            .format(DateTime.parse(eventOBJ.scheduled_date))
                            .toString() +
                        ", " +
                        (DateFormat.jm().format(DateFormat("hh:mm:ss")
                                .parse(eventOBJ.scheduled_time)))
                            .toString(),
                    overflow: TextOverflow.ellipsis,
                    style:
                        GoogleFonts.poppins(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget FeaturesWebinar(BuildContext context, EventListParser eventOBJ) {
  return Container(
    width: MediaQuery.of(context).size.width / 1.25,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: Colors.green[500],
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: const Offset(
            2.0,
            2.0,
          ),
          blurRadius: 3.0,
          spreadRadius: 1.0,
        )
      ],
      image: DecorationImage(
          image: NetworkImage(eventOBJ.image_path_medium ?? ""),
          fit: BoxFit.fill),
    ),
    margin: EdgeInsets.only(
      top: getProportionateScreenHeight(20),
      bottom: getProportionateScreenHeight(20),
      right: getProportionateScreenWidth(20),
    ),
    child: Stack(
      children: [
        Container(
          width: getProportionateScreenWidth(79),
          height: getProportionateScreenHeight(41),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
            color: Color(COLOR_BACKGROUND),
          ),
          child: Text(
            DateFormat.d()
                    .format(DateTime.parse(eventOBJ.scheduled_date))
                    .toString() +
                " " +
                DateFormat.MMMM()
                    .format(DateTime.parse(eventOBJ.scheduled_date))
                    .toString(),
            style: TextStyle(
                color: Colors.white, fontFamily: 'Poppins Bold', fontSize: 14),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 20,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CompanyName(
                  smallthumb_url: eventOBJ.image_smallthumb_url,
                  organisation_name: eventOBJ.organisation_name,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  eventOBJ.title,
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}

class CompanyName extends StatelessWidget {
  const CompanyName({
    Key key,
    this.smallthumb_url,
    this.organisation_name,
    this.onPressed,
  }) : super(key: key);

  final String smallthumb_url, organisation_name;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 30,
            height: 30,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: Colors.yellowAccent,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300],
                  blurRadius: 2.0,
                  spreadRadius: 1.0,
                )
              ],
              image: DecorationImage(
                  image: NetworkImage(smallthumb_url ?? ""), fit: BoxFit.fill),
            )),
        SizedBox(
          width: 10,
        ),
        Text(
          organisation_name,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

Widget AdTile(BuildContext context, int index) {
  final providerListener = Provider.of<CustomViewModel>(context);

  return Stack(children: [
    Container(
      height: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              image: providerListener.adsList.length > 0
                  ? NetworkImage(providerListener.adsList[index].bigthumb_url)
                  : AssetImage(""),
              fit: BoxFit.cover)),
    ),
    Positioned(
      top: 10,
      right: 10,
      child: Container(
        width: getProportionateScreenWidth(35),
        height: getProportionateScreenHeight(25),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10)),
        child: Text("AD"),
      ),
    ),
  ]);
}

class FeaturedBrands extends StatefulWidget {
  const FeaturedBrands({
    Key key,
    this.organisation_name,
    this.image,
    this.onPressed,
  }) : super(key: key);

  final String organisation_name, image;
  final Function onPressed;

  @override
  _FeaturedBrandsState createState() => _FeaturedBrandsState();
}

class _FeaturedBrandsState extends State<FeaturedBrands> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: getProportionateScreenHeight(10),
        bottom: getProportionateScreenHeight(10),
      ),
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints.tightFor(
              width: getProportionateScreenWidth(85),
              height: getProportionateScreenHeight(85),
            ),
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  elevation: 3,
                  shadowColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.image ?? ""),
                        fit: BoxFit.fill),
                  ),
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            widget.organisation_name,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class FeaturedProducts extends StatefulWidget {
  const FeaturedProducts({
    Key key,
    this.name,
    this.desc,
    this.image,
    this.onPressed,
  }) : super(key: key);

  final String name, desc, image;
  final Function onPressed;

  @override
  _FeaturedProductsState createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: 150,
        height: 300,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 3.0,
            spreadRadius: 1.0,
          )
        ]),
        margin: EdgeInsets.only(top: 40, bottom: 40, right: 20),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      image: DecorationImage(
                          image: NetworkImage(widget.image ?? ""),
                          fit: BoxFit.cover),
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
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700]),
                  ),
                  Text(
                    widget.desc,
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

Widget CategoryTiles(BuildContext context, CategoryListParser categoryOBJ) {
  return Padding(
    padding: const EdgeInsets.only(right: 0, left: 20, top: 20, bottom: 20),
    child: Container(
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: 100,
          height: 100,
        ),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 1,
            shadowColor: Colors.grey[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                  image: NetworkImage(categoryOBJ.c_image_url ?? ""),
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ),
    ),
  );
}

class SubCatTitles extends StatelessWidget {
  const SubCatTitles({
    Key key,
    this.title,
    this.iconData,
    this.image,
  }) : super(key: key);

  final String title;
  final IconData iconData;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                    color: Color(COLOR_BACKGROUND),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getProportionateScreenWidth(3),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                  height: 20,
                  width: 20,
                  child: Image.asset("assets/images/star.png")),
            ],
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class ImageSlider extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                onPageChanged: (index, onTap) {
                  setState(() {
                    currentS = index;
                  });
                  print(currentS.toString());
                },
                height: 200,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayAnimationDuration: Duration(milliseconds: 700)),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: getProportionateScreenWidth(378),
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage("assets/images/subtitle.png"),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            offset: const Offset(
                              2.0,
                              3.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 2.0,
                          )
                        ],
                        color: Colors.amber),
                  );
                },
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 180),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ['1', '2', '3', '4', '5'].map((url) {
                  int index = ['1', '2', '3', '4', '5'].indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentS == index
                          ? Colors.grey[700]
                          : Colors.grey[300],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

int currentS = 0;
