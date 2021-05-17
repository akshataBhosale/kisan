import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/constants.dart';

class CallHistory extends StatefulWidget {
  @override
  _CallHistoryState createState() => _CallHistoryState();
}

class _CallHistoryState extends State<CallHistory> {
  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    buildList(BuildContext context){
      return ListView.builder(
          scrollDirection: Axis.vertical,
          primary: false,
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                width: screenWidth,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[200], blurRadius: 1, spreadRadius: 1)
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey,
                      ),
                    ),

//                    Container(
//                      height: 100,
//                      width: 125,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
//                          bottomLeft: Radius.circular(10),
//                        ),
//                        color: Colors.green[700],
//                      ),
//                    ),
//                    SizedBox(width: 20,),
//                    Column(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: [
//                        Text("John Deere",
//                          style: GoogleFonts.poppins(
//                            color: Colors.black,
//                            fontWeight: FontWeight.bold,
//                            fontSize: 16,
//                          ),
//                        ),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.start,
//                          crossAxisAlignment: CrossAxisAlignment.center,
//                          children: [
//                            Icon(Icons.image, size: 15, color: Colors.grey,),
//                            SizedBox(width: 5,),
//                            Text("14 products",
//                              style: GoogleFonts.poppins(
//                                color: Colors.grey,
//                                fontWeight: FontWeight.w400,
//                                fontSize: 14,
//                              ),
//                            ),
//                          ],
//                        ),
//                      ],
//                    ),
                  SizedBox(width: 10,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("Pravin Kumar, Sonalika tractors",
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(index == 1 ? Icons.call : Icons.call_missed, color: index == 1 ? Color(0xff58C12A) : Color(0xffF87676), size: 15,),
                          SizedBox(width: 10,),
                          Text("Today, 11:00 AM",
                            style: GoogleFonts.poppins(
                              color: index == 1 ? Color(0xff58C12A) : Color(0xffF87676),
                              fontWeight: index == 1 ? FontWeight.w600 : FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Text("You requested\na call for",
                              style: GoogleFonts.poppins(
                                color: Color(0xffB5B5B5),
                                fontSize: 12,
                              ),
                            ),
                            SizedBox(width: 30,),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    //border: Border.all(color: Color(0xffB5B5B5)),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: Color(COLOR_BACKGROUND)
                                  ),
                                ),SizedBox(width: 10,),
                                Text("10% Discount\nSonalika Tiger 26",
                                  style: GoogleFonts.poppins(
                                    color: Color(0xffB5B5B5),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          //border: Border.all(color: Color(0xffB5B5B5)),
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Color(0xffE5F3EB),
                        ),
                        child: Center(
                          child: Icon(Icons.call, size: 15, color: Color(0xff58C12A),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(),
              buildList(context),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key key, this.onPressed, this.textEditingController,
  }) : super(key: key);

  final Function onPressed;
  final TextEditingController textEditingController;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  FocusNode focusSearch = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      focusNode: focusSearch,
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          fontSize: 14),
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey,
          size: 30,
        ),
        hintText: "Your activity",
        hintStyle: GoogleFonts.poppins(
            color: Colors.grey[600],
            fontSize: 18,letterSpacing: 1,
            fontWeight: FontWeight.w600),
        //filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
        ),
        //fillColor: Colors.grey.shade100,
        suffixIconConstraints: BoxConstraints.tightFor(height: 50),
        suffixIcon: GestureDetector( onTap: widget.onPressed,
          child: Padding(
            padding: EdgeInsetsDirectional.only(end: 10),
            child: SvgPicture.asset(
              "assets/icons/searchIcon.svg",
              color: Colors.grey,
            ),
          ),
        ),
      ),
      onEditingComplete: (){

      },
      controller: widget.textEditingController,
    );
  }
}
