import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/HomeScreen/Widgets/SubTile.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SubTile(),
              ImageSlider(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(22)),
                child: SubCatTitles(title: "Categories"),
              ),
              Container(
                height: getProportionateScreenHeight(127),
                child: ListView.builder(
                    itemCount: 9,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTiles(
                        iconPath: Icons.title,
                        onPressed: () {},
                      );
                    }),
              ),
              CustomDivider(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(22)),
                child: Column(
                  children: [
                    SubCatTitles(
                      title: "Featured Products",
                      iconData: Icons.star,
                    ),
                    Container(
                      height: getProportionateScreenHeight(260),
                      child: ListView.builder(
                          itemCount: 9,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FeaturedProducts(
                              name: "Great Indian Farms",
                              desc: "What can i say it just great in every way",
                            );
                          }),
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(22)),
                child: Column(
                  children: [
                    SubCatTitles(
                      title: "Featured Brands",
                      iconData: Icons.bookmark,
                    ),
                    Container(
                      height: getProportionateScreenHeight(180),
                      child: ListView.builder(
                          itemCount: 9,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FeaturedBrands();
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              AdTile(),

              //---------------"Newly Adds" Section---------------------

              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(22)),
                child: Column(
                  children: [
                    SubCatTitles(
                      title: "Newly Added Products",
                      iconData: Icons.flag_rounded,
                    ),
                    Container(
                      height: getProportionateScreenHeight(250),
                      child: ListView.builder(
                          itemCount: 9,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FeaturedProducts(
                              name: "Great Indian Farms",
                              desc: "What can i say it just great in every way",
                            );
                          }),
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(22)),
                child: Column(
                  children: [
                    SubCatTitles(
                      title: "Newly Added Brands",
                      iconData: Icons.bookmark,
                    ),
                    Container(
                      height: getProportionateScreenHeight(200),
                      child: ListView.builder(
                          itemCount: 9,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FeaturedBrands();
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              AdTile(),

              //-------------Webinars Sections--------------

              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(22)),
                child: Column(
                  children: [
                    SubCatTitles(
                      title: "Upcoming Webinars",
                    ),
                    Container(
                      height: getProportionateScreenHeight(280),
                      child: ListView.builder(
                          itemCount: 5,
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return WebinarTile();
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(22)),
                child: Column(
                  children: [
                    SubCatTitles(
                      title: "Featured Webinars",
                    ),
                    Container(
                      height: getProportionateScreenHeight(223),
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return FeaturesWebinar();
                          }),
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              Container(
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
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return LatestOfferTile();
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              AdTile(),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),

              //-------------Webinars Sections--------------

              Container(
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
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return LatestDemo();
                          }),
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(22)),
                child: Column(
                  children: [
                    SubCatTitles(
                      title: "Latest Product Launch",
                    ),
                    Container(
                      height: getProportionateScreenHeight(522),
                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return LatestProductLaunch();
                          }),
                    ),
                  ],
                ),
              ),
              CustomDivider(),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(22)),
                child: Column(
                  children: [
                    SubCatTitles(
                      title: "Unread Notifications",
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
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
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "View all Notification",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(COLOR_ACCENT),
                            fontFamily: 'Poppins Bold'),
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
            ],
          ),
        ),
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
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: getProportionateScreenWidth(370),
          height: getProportionateScreenHeight(70)),
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
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
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
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins Bold',
                    color: Colors.black),
                children: [
                  TextSpan(
                    text: " has invited you to see their product",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins Regular',
                        color: Colors.black),
                  ),
                  TextSpan(
                      text: "Tiger series tractor",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins Bold',
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

class LatestProductLaunch extends StatelessWidget {
  const LatestProductLaunch({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(13),
        width: getProportionateScreenWidth(364),
        margin: EdgeInsets.only(
            top: getProportionateScreenHeight(20),
            bottom: getProportionateScreenHeight(30),
            right: getProportionateScreenWidth(20)),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/tractor.png"),
                fit: BoxFit.cover),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.grey[200], blurRadius: 2, spreadRadius: 2)
            ]),
        child: Container(
          child: Column(
            children: [
              CompanyName(
                textColor: Colors.grey,
              ),
              Text(
                'Introducing John Deere 5E Series tractors',
                style: TextStyle(
                    color: Colors.grey[800],
                    fontFamily: 'Poppins Bold',
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LatestDemo extends StatelessWidget {
  const LatestDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(364),
      margin: EdgeInsets.only(
          top: getProportionateScreenHeight(20),
          bottom: getProportionateScreenHeight(20),
          right: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/farm.jpg"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
              ),
              Center(
                child: Opacity(
                  opacity: 0.7,
                  child: Icon(
                    Icons.play_circle_fill,
                    color: Colors.white,
                    size: 30,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CompanyName(
                  textColor: Colors.black,
                ),
                Text(
                  "Importance of nutrition in raising",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontFamily: 'Poppins Medium'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LatestOfferTile extends StatelessWidget {
  const LatestOfferTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Color(0xFF08A796),
      ),

      margin: EdgeInsets.only(
          top: getProportionateScreenHeight(20),
          right: getProportionateScreenHeight(20),
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

class FeaturesWebinar extends StatelessWidget {
  const FeaturesWebinar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(364),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey,
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
          image: DecorationImage(
              image: AssetImage("assets/images/farm.jpg"), fit: BoxFit.cover)),
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
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Color(COLOR_ACCENT),
            ),
            child: Text(
              "16 DEC",
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins Bold',
                  fontSize: 14),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CompanyName(),
                  Text(
                    "Importance of nutrition in raising healthy\nanimals.",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins Bold',
                        fontSize: 14),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CompanyName extends StatelessWidget {
  const CompanyName({
    Key key,
    this.textColor,
  }) : super(key: key);

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.yellowAccent,
              image: DecorationImage(
                  image:
                      AssetImage("assets/images/sample_featured_brands.png"))),
        ),
        SizedBox(
          width: getProportionateScreenWidth(5),
        ),
        Text(
          "Company Name",
          style: TextStyle(
              fontSize: 12,
              color: textColor ?? Colors.white,
              fontFamily: 'Poppins Regular'),
        )
      ],
    );
  }
}

class WebinarTile extends StatelessWidget {
  const WebinarTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(365),
      margin: EdgeInsets.only(
          top: getProportionateScreenHeight(20),
          bottom: getProportionateScreenHeight(20),
          right: getProportionateScreenWidth(20)),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            blurRadius: 2.0,
            spreadRadius: 2.0,
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
                    image: DecorationImage(
                        image: AssetImage("assets/images/farm.jpg"),
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
            height: getProportionateScreenHeight(80),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)),
            ),
            child: Row(
              children: [
                Container(
                  width: getProportionateScreenHeight(70),
                  height: getProportionateScreenHeight(70),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.yellowAccent),
                  child: Column(
                    children: [
                      Text(
                        "16",
                        style: TextStyle(
                            fontSize: 30,
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
                  width: getProportionateScreenWidth(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Importance of nutrition in raising",
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 14, fontFamily: 'Poppins Medium'),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Text(
                      "Tuesday, 11:30 am",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 9),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AdTile extends StatelessWidget {
  const AdTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: SizeConfig.screenWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/sample_add.jpg"),
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
        )
      ],
    );
  }
}

class FeaturedBrands extends StatelessWidget {
  const FeaturedBrands({
    Key key,
  }) : super(key: key);

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
                shadowColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
              ),
              child: Image.asset("assets/images/sample_featured_brands.png"),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20),),
          Text(
            "Name",
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'Poppins Regular',
                color: Colors.grey),
          )
        ],
      ),
    );
  }
}

class FeaturedProducts extends StatelessWidget {
  const FeaturedProducts({
    Key key,
    this.name,
    this.desc,
    this.image, this.onPressed,
  }) : super(key: key);

  final String name, desc, image;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: getProportionateScreenWidth(135),
        decoration: BoxDecoration(
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
          ]
        ),
        margin: EdgeInsets.only(
            top: getProportionateScreenHeight(20),
            bottom: getProportionateScreenHeight(20),
            right: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image ?? "assets/images/farm.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15))),
                )),
            Expanded(
                child: Container(
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
                    style: TextStyle(fontSize: 11),
                  ),
                  Text(
                    desc,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 9),
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

class CategoryTiles extends StatelessWidget {
  const CategoryTiles({
    Key key,
    this.iconPath,
    this.imagePath,
    this.onPressed,
  }) : super(key: key);

  final IconData iconPath;
  final String imagePath;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: getProportionateScreenHeight(20),
          bottom: getProportionateScreenHeight(20),
          right: getProportionateScreenWidth(10),
          left: getProportionateScreenWidth(10)),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: getProportionateScreenWidth(87),
          height: getProportionateScreenHeight(74),
        ),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 5,
            shadowColor: Colors.grey[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          ),
          child: Icon(
            iconPath ?? Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class SubCatTitles extends StatelessWidget {
  const SubCatTitles({
    Key key,
    this.title,
    this.iconData,
  }) : super(key: key);

  final String title;
  final IconData iconData;

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
                style: TextStyle(
                    color: Color(COLOR_TEXT_GREEN),
                    fontSize: getProportionateScreenHeight(20),
                    fontFamily: 'Poppins Bold'),
              ),
              SizedBox(
                width: getProportionateScreenWidth(3),
              ),
              Icon(
                iconData,
                color: Colors.yellowAccent,
              )
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

class ImageSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: getProportionateScreenHeight(250),
          autoPlay: true,
          viewportFraction: 1,
          autoPlayAnimationDuration: Duration(milliseconds: 700)),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: getProportionateScreenWidth(378),
              margin: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: AssetImage("assets/images/ruralfirst.jpg"),
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
    );
  }
}
