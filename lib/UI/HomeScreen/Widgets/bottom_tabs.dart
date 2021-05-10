import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/Tabs/HomeTab.dart';
import 'package:popup_menu/popup_menu.dart';

class BottomTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;

  BottomTabs({this.selectedTab, this.tabPressed});

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedTabs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _selectedTabs = widget.selectedTab ?? 0;

    return Container(
        height: getProportionateScreenHeight(65),
        width: getProportionateScreenWidth(370),
        margin: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(20),
            bottom: getProportionateScreenWidth(20)),
        decoration: BoxDecoration(
            color: Color(COLOR_ACCENT),
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Color(COLOR_ACCENT).withOpacity(0.3),
                blurRadius: 30,
                spreadRadius: 1,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomTabBtn(
              iconPath: Icons.home_rounded,
              optName: "Home",
              selected: _selectedTabs == 0 ? true : false,
              onPressed: () {
                widget.tabPressed(0);
              },
            ),
            BottomTabBtn(
              iconPath: Icons.list,
              optName: "Option",
              onPressed: () {
                showMenu(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    context: context,
                    position: RelativeRect.fromLTRB(20, 420, 20, 300),
                    items: [
                      PopupMenuItem(
                          child: ColouredCustomButtons(
                        imgPath: "assets/images/discount.png",
                        bgColour: Color(0xFFF7F2D4),
                        primaryColour: Color(0xFFA27000),
                        text: "Offers",
                        onPressed: () {},
                      )),
                      PopupMenuItem(
                        child: ColouredCustomButtons(
                          imgPath: "assets/images/calender.png",
                          bgColour: Color(0xFFCEF7F5),
                          primaryColour: Color(0xFF05AEBA),
                          text: "Webinar",
                          onPressed: () {},
                        ),
                      ),
                      PopupMenuItem(
                        child: ColouredCustomButtons(
                          imgPath: "assets/images/video_play.png",
                          bgColour: Color(0xFFD8FCD8),
                          primaryColour: Color(0xFF008840),
                          text: "Demo",
                          onPressed: () {},
                        ),
                      ),
                      PopupMenuItem(
                        child: ColouredCustomButtons(
                          imgPath: "assets/images/rocket.png",
                          bgColour: Color(0xFFFFE6E2),
                          primaryColour: Color(0xFFC8341C),
                          text: "Product Launch",
                          onPressed: () {},
                        ),
                      ),
                    ]);
              },
            ),
            BottomTabBtn(
              iconPath: Icons.favorite,
              optName: "Favourites",
              selected: _selectedTabs == 1 ? true : false,
              onPressed: () {
                widget.tabPressed(1);
              },
            ),
            BottomTabBtn(
              iconPath: Icons.call,
              optName: "History",
              selected: _selectedTabs == 2 ? true : false,
              onPressed: () {
                widget.tabPressed(2);
                //widget.tabPressed(3);
              },
            ),
          ],
        ));
  }
}

class BottomTabBtn extends StatelessWidget {
  final IconData iconPath;
  final bool selected;
  final Function onPressed;
  final String optName;

  BottomTabBtn({this.iconPath, this.selected, this.onPressed, this.optName});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Row(
          children: [
            Icon(
              iconPath ?? Icons.home_outlined,
              size: getProportionateScreenWidth(25),
              color: _selected ? Colors.white : Colors.white.withOpacity(0.5),
            ),
            SizedBox(
              width: getProportionateScreenWidth(8),
            ),
            Text(
              _selected ? optName : "",
              style: TextStyle(
                  fontFamily: "Poppins Bold",
                  fontSize: getProportionateScreenHeight(14),
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
