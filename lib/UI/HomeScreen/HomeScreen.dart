import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/Models/UserDataParser.dart';
import 'package:kisan/UI/HomeScreen/Widgets/bottom_tabs.dart';
import 'package:kisan/UI/Intro/InitialScreen.dart';
import 'package:kisan/UI/Profile/BasicProfile.dart';
import 'package:kisan/UI/Tabs/HomeTab.dart';
import 'package:kisan/UI/Tabs/ShortListedTab.dart';
import 'package:kisan/View%20Models/CustomViewModel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _tabPageController;
  bool _isloaded = false;
  int _selectedTab = 0;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  Future<void> initTask() async {
    Provider.of<CustomViewModel>(context, listen: false)
        .GetProfileData()
        .then((value) {
      setState(() {
        if (value == "error") {
          //for unexpected error
          // errorMessage = "Error in fetching data";
          //logout user
          LogOut();
        } else if (value == "success") {
          _isloaded = true;
          //  push(context, EnterOTP(phoneController.text.toString()));
          //
        } else {
          // errorMessage = value;
          LogOut();
        }
      });
    });
  }

  Future LogOut() async {
    SharedPreferences prefs =
        await SharedPreferences.getInstance();
    await prefs.clear();
    pushReplacement(context, InitialScreen());
  }

  @override
  void initState() {
    _tabPageController = PageController();
    super.initState();
    initTask();
  }

  @override
  void dispose() {
    _tabPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return _isloaded == true
        ? Scaffold(
            key: _key,
            appBar: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 80),
              child: AppBar(
                titleSpacing: 20,
                title: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/KISAN-logo.png",
                          width: getProportionateScreenWidth(57),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Image.asset(
                          "assets/images/KISAN.png",
                          width: getProportionateScreenWidth(57),
                        ),
                      ],
                    ),
                  ),
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        size: 30,
                      ),
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: IconButton(
                      onPressed: () {
                        _key.currentState.openEndDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            endDrawer: CustomDrawer(),
            bottomNavigationBar: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: BottomTabs(
                  selectedTab: _selectedTab,
                  tabPressed: (num) {
                    _tabPageController.animateToPage(num,
                        duration: Duration(milliseconds: ANIMATION_DURATION),
                        curve: Curves.easeOutCubic);
                  },
                ),
              ),
            ),
            body: Container(
              color: Colors.white,
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
                        ShortListedTab(),
                        Center(
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: Image.asset(
                                "",
                                fit: BoxFit.fill,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            height: SizeConfig.screenHeight,
            color: Color(COLOR_BACKGROUND),
            child: Center(
              child: new CircularProgressIndicator(
                strokeWidth: 1,
                backgroundColor: Color(COLOR_WHITE),
                valueColor:
                    AlwaysStoppedAnimation<Color>(Color(COLOR_BACKGROUND)),
              ),
            ),
          );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
          color: Color(COLOR_BACKGROUND),
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(30),
              vertical: getProportionateScreenHeight(50)),
          child: Column(
            children: [
              DrawerHeader(),
              /*Container(
                height: getProportionateScreenHeight(500),
                child:
                ListView.builder(
                  itemCount: drawerItems.length,
                  itemBuilder: (context, index) {
                    return DrawerItem(
                      icon: drawerItems[index]['icon'],
                      text: drawerItems[index]['text'],
                      onPressed: drawerItems[index]['onPressed'],
                    );
                  },
                ),
              ),*/
              DrawerItem(
                icon: Icons.calendar_today_rounded,
                text: "My Webinars",
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.settings,
                text: "Settings",
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.share,
                text: "Invite Friends",
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.info,
                text: "FAQ & Support",
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.info,
                text: "About App",
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.privacy_tip_rounded,
                text: "Terms & Privacy Policy",
                onPressed: () {},
              ),
              DrawerItem(
                icon: Icons.logout,
                text: "Logout",
                onPressed: () async {
                  //TODO: remove if not needed
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  await prefs.clear();
                  pushReplacement(context, InitialScreen());
                },
              ),
            ],
          )),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    Key key,
    this.icon,
    this.text,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final String text;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          ListTile(
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
                      fontSize: 14,
                      fontFamily: 'Poppins Medium'),
                ),
              )
            ],
          )),
          Divider(
            color: Colors.white.withOpacity(0.4),
            thickness: 2,
            height: 1,
          )
        ],
      ),
    );
  }
}

class DrawerHeader extends StatelessWidget {
  const DrawerHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providerListener = Provider.of<CustomViewModel>(context);

    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              push(
                  context,
                  BasicProfile(
                      providerListener.userData.first_name,
                      providerListener.userData.last_name,
                      providerListener.userData.email,
                      providerListener.userprofileData.image_url));
            },
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: providerListener
                              .userprofileData.image_smallthumb_url !=
                          null
                      ? NetworkImage(
                          providerListener.userprofileData.image_smallthumb_url)
                      : AssetImage('assets/images/google.jpg'),
                ),
                Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      providerListener.userData.first_name +
                          " " +
                          providerListener.userData.last_name,
                      style: TextStyle(
                          fontSize: getProportionateScreenHeight(18),
                          fontFamily: 'Poppins Bold',
                          color: Colors.white),
                    ),
                    Text(providerListener.userprofileData.mobile1+ " | "+providerListener.userprofileData.address1,
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
          ),
          SizedBox(
            height: getProportionateScreenHeight(27),
          ),
          Container(
            width: getProportionateScreenWidth(282),
            height: getProportionateScreenHeight(117),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/tileOrange.png",
                    ),
                    fit: BoxFit.cover),
                color: Color(0xFFE17628),
                border: Border.all(color: Colors.white, width: 2)),
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.2,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset("assets/images/days.png")),
                ),
                Container(
                  padding: EdgeInsets.all(20),
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
          ),
        ],
      ),
    );
  }
}
