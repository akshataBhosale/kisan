import 'package:flutter/material.dart';
import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/HomeScreen/Widgets/TopBar.dart';
import 'package:kisan/UI/HomeScreen/Widgets/bottom_tabs.dart';
import 'package:kisan/UI/Tabs/HomeTab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _tabPageController;
  int _selectedTab = 0;

  @override
  void initState() {
    _tabPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _tabPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, getProportionateScreenHeight(96)),
        child: TopBar(),
      ),
      endDrawer: Drawer(
        child: Container(
            color: Color(COLOR_ACCENT),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(30),
                vertical: getProportionateScreenHeight(50)),
            child: ListView(
              children: [
                DrawerHeader(),
                DrawerItem(icon: Icons.calendar_today,text: "My Webinars",),
                DrawerItem(icon: Icons.language,text: "Language",),
                DrawerItem(icon: Icons.contact_support,text: "Support",),
                DrawerItem(icon: Icons.error,text: "About App",),
                DrawerItem(icon: Icons.subscriptions,text: "My Pass",),
                DrawerItem(icon: Icons.privacy_tip_rounded,text: "Terms & Privacy Policy",),
                DrawerItem(icon: Icons.logout,text: "Sign out",),
              ],
            )),
      ),
      bottomNavigationBar: BottomTabs(
        selectedTab: _selectedTab,
        tabPressed: (num) {
          _tabPageController.animateToPage(num,
              duration: Duration(milliseconds: ANIMATION_DURATION),
              curve: Curves.easeOutCubic);
        },
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _tabPageController,
                onPageChanged: (num) {
                  setState(() {
                    _selectedTab = num;
                  });
                },
                children: [
                  HomeTab(),
                  Center(
                    child: Text("Webinar"),
                  ),
                  Center(
                    child: Text("Bookmarks"),
                  ),
                  Center(
                    child: Text("Bookmarks"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key key, this.icon, this.text,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Poppins Medium'
            ),
          ),
        )
      ],
    ));
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sidharth Joshi",
                    style: TextStyle(
                        fontSize: getProportionateScreenHeight(18),
                        fontFamily: 'Poppins Bold',
                        color: Colors.white),
                  ),
                  Text("+91 7741971506 | Pune, Maharashtra",
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(9),
                          fontFamily: 'Poppins Medium',
                          color: Colors.white)),
                ],
              ),
              Spacer(),
              Icon(
                Icons.edit,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(27),
          ),
          Container(
            width: getProportionateScreenWidth(282),
            height: getProportionateScreenHeight(117),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color(0xFFE17628),
                border: Border.all(color: Colors.white, width: 2)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Become a member.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Poppins Bold'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Subscribe to KISAN membership\nUncloc all the features for 1 year",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                            fontFamily: 'Poppins Medium')),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
