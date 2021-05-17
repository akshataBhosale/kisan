import 'package:flutter/material.dart';
import 'package:kisan/UI/Tabs/HomeTabShreyas.dart';

class VideosTab extends StatelessWidget {
  const VideosTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Flexible(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return LatestDemo();
                  }),
            )
        ));
  }
}