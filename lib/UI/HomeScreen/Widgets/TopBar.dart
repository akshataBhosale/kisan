import 'package:flutter/material.dart';
import 'package:kisan/Helpers/size_config.dart';
class TopBar extends StatelessWidget {
  const TopBar({
    Key key, this.headText, this.onDrawer, this.onNotification, this.onSearch,
  }) : super(key: key);

  final String headText;
  final Function onDrawer,onNotification,onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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
          Container(
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.black,
                  onPressed: onSearch,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                ),
                IconButton(
                  onPressed: onNotification,
                  icon: Icon(Icons.notifications),
                  color: Colors.black,
                ),
                SizedBox(
                  width: getProportionateScreenWidth(20),
                ),
                IconButton(
                  onPressed: onDrawer,
                  icon: Icon(Icons.menu),
                  color: Colors.black,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}