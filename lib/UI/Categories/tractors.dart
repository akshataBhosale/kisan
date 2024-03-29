import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/Tabs/HomeTabShreyas.dart';

class Tractors extends StatefulWidget {
  @override
  _TractorsState createState() => _TractorsState();
}

class _TractorsState extends State<Tractors> {

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    buildCategoryList(BuildContext context){
      return ListView.builder(
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
                  color: Color(0xffF0F8F3),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
//                  boxShadow: [
//                    BoxShadow(color: Colors.grey[200], blurRadius: 1, spreadRadius: 1)
//                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      height: 100,
                      //width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text("Category " + (index+1).toString(),
                          style: GoogleFonts.poppins(
                            color: Color(0xff2DB571),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                      size: 20,
                      color: Color(0xff008940),
                    ),SizedBox(width: 20,),
                  ],
                ),
              ),
            );
          }
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BackButton(),
                    SizedBox(width: 10,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Tractors",
                          style: GoogleFonts.poppins(
                              color: Colors.black, fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("24 Products | 104 companies",
                          style: GoogleFonts.poppins(
                            color: Colors.black, fontSize: 12,
                          ),
                        ),
                      ],
                    ),Spacer(),
                    ShareButton(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ImageSlider(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 30, mainAxisSpacing: 20),
                  itemBuilder: (BuildContext context, int index){
                    return Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
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
                      )
                    );
                  }

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: 55,
        height: 55,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          //pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: 55,
        height: 55,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            //padding: EdgeInsets.symmetric(horizontal: 20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          //pop(context);
        },
        child: Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
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
                  return GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      width: getProportionateScreenWidth(378),
                      margin: EdgeInsets.symmetric(horizontal: 8,vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
//                          image: DecorationImage(
//                              image: AssetImage("assets/images/subtitle.png"),
//                              fit: BoxFit.cover),
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
                    ),
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
                children: ['1','2','3','4','5'].map((url) {
                  int index = ['1','2','3','4','5'].indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
