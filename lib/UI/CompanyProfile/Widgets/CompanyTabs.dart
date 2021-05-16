import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kisan/Helpers/size_config.dart';

class CompanyTabs extends StatefulWidget {
  final int selectedTab;
  final Function(int) tabPressed;

  CompanyTabs({this.selectedTab, this.tabPressed});

  @override
  _CompanyTabsState createState() => _CompanyTabsState();
}

class _CompanyTabsState extends State<CompanyTabs> {
  int _selectedTabs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _selectedTabs = widget.selectedTab ?? 0;

    return Container(
        child: Row(
          children: [
            CompanyTabBtn(
              optName: "About",
              selected: _selectedTabs == 0 ? true : false,
              onPressed: () {
                widget.tabPressed(0);
              },
            ),
            SizedBox(
              width: 46,
            ),
            CompanyTabBtn(
              optName: "Products",
              selected: _selectedTabs == 1 ? true : false,
              onPressed: () {
                widget.tabPressed(1);
              },
            ),
            SizedBox(
              width: 46,
            ),
            CompanyTabBtn(
              optName: "Videos",
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

class CompanyTabBtn extends StatelessWidget {
  final bool selected;
  final Function onPressed;
  final String optName;

  CompanyTabBtn({this.selected, this.onPressed, this.optName});

  @override
  Widget build(BuildContext context) {
    bool _selected = selected ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: Text(
          optName,
          style: TextStyle(
              fontFamily: _selected ? "Poppins Bold" : "Poppins Regular",
              fontSize: 14,
              color: _selected ? Colors.white : Colors.white.withOpacity(0.5)),
        ),
      ),
    );
  }
}
