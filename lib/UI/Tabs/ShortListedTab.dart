import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/constants.dart' as constants;
import 'package:kisan/Helpers/size_config.dart';

import 'HomeTabShreyas.dart';

var show = "1";

class ShortListedTab extends StatefulWidget {
  @override
  _ShortListedTabState createState() => _ShortListedTabState();
}

class _ShortListedTabState extends State<ShortListedTab> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      show = "1";
    });
  }

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    buildFilterContainer(BuildContext context){
      return Center(
        child: Container(
          width: screenWidth/1.3,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Color(0xffF5F5F5),
            border: Border.all(color: Colors.grey)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    show = "1";
                  });
                },
                child: Container(
                  width: screenWidth/1.3/3.02,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                    ),
                    color: show == "1" ? Color(constants.COLOR_BACKGROUND) : Color(0xffF5F5F5),
                  ),
                  child: Center(
                    child: Text("Products",
                      style: GoogleFonts.poppins(
                        color: show == "1" ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 50,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    show = "2";
                  });
                },
                child: Container(
                  width: screenWidth/1.3/3.1,
                  height: 50,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.black),
                    color: show == "2" ? Color(constants.COLOR_BACKGROUND) : Color(0xffF5F5F5),
                  ),
                  child: Center(
                    child: Text("Offers",
                      style: GoogleFonts.poppins(
                        color: show == "2" ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 50,
                color: Colors.black,
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    show = "3";
                  });
                },
                child: Container(
                  width: screenWidth/1.3/3.02,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    //border: Border.all(color: Colors.black),
                    color: show == "3" ? Color(constants.COLOR_BACKGROUND) : Color(0xffF5F5F5),
                  ),
                  child: Center(
                    child: Text("Companies",
                      style: GoogleFonts.poppins(
                        color: show == "3" ? Colors.white : Colors.black,fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    buildGridViewProducts(BuildContext context){
      return Padding(
        padding: show == "1" ? EdgeInsets.only(left: 20, right: 20) : show == "2" ? EdgeInsets.only(left: 20, right: 0) : EdgeInsets.only(left: 20, right: 20),
        child: Center(
          child: show == "3" ? ListView.builder(
            scrollDirection: Axis.vertical,
            primary: false,
            shrinkWrap: true,
            itemCount: 20,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    width: screenWidth,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(color: Colors.grey[200], blurRadius: 1, spreadRadius: 1)
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color: Colors.green[700],
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("John Deere",
                              style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.image, size: 15, color: Colors.grey,),
                                SizedBox(width: 5,),
                                Text("14 products",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }
          ) : GridView.builder(
              scrollDirection: Axis.vertical,
              primary: false,
              shrinkWrap: true,
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 0, mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: show == "1" ?  EdgeInsets.all(10.0) : EdgeInsets.all(0.0),
                  child: show == "1" ? Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(""),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.grey[200], blurRadius: 1, spreadRadius: 1)
                      ],
                    ),
                    child: GestureDetector(
                      onTap: (){

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 85,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: Colors.green[700],
                                image: DecorationImage(
                                  image: NetworkImage(""),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey[200], blurRadius: 1, spreadRadius: 1)
                                ],
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 7,left: 10),
                              child: Container(
                                color: Colors.white,
                                child: Text("Same 325 DFI",style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                color: Colors.white,
                                child: Text("Same 325 DFI",style: GoogleFonts.poppins(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ) : Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: Colors.green[700],
                        boxShadow: [
                          BoxShadow(color: Colors.grey[200], blurRadius: 2, spreadRadius: 2)
                        ],
                      ),

                      margin: EdgeInsets.only(
                          top: getProportionateScreenHeight(10),
                          right: getProportionateScreenHeight(20),
                          bottom: getProportionateScreenHeight(10)),
                      width: getProportionateScreenWidth(172),
                      child: Stack(
                        children: [
                          Positioned(top: 10, left: 10, child: CompanyName()),
                          Center(
                            child: Container(
                              color: Colors.grey,
                                width: getProportionateScreenWidth(125),
                                child: Image.asset("")),
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
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 35, fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "Discount",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 20, fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            buildFilterContainer(context),
            SizedBox(height: 50,),
            Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(child: buildGridViewProducts(context))),
          ],
        ),
      ),
    );
  }
}
