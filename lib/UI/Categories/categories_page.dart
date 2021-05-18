import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kisan/Helpers/constants.dart';
import 'package:kisan/Helpers/helper.dart';
import 'package:kisan/Helpers/size_config.dart';
import 'package:kisan/UI/Categories/tractors.dart';
import 'package:kisan/UI/Tabs/HomeTabShreyas.dart';
import 'package:kisan/View%20Models/CustomViewModel.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  final title, id;

  CategoriesPage(this.title, this.id);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool _isloaded = false;

  Future<void> initTask() async {
    Provider.of<CustomViewModel>(context, listen: false)
        .GetSubCategories(widget.id)
        .then((value) {
      setState(() {
        if (value == "error") {
          pop(context);
        } else if (value == "success") {
          _isloaded = true;
        } else {
          pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTask();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final providerListener = Provider.of<CustomViewModel>(context);

    return _isloaded == true
        ? Scaffold(
            backgroundColor: Colors.white,
            extendBodyBehindAppBar: true,
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20, right: 20),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BackButton(),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title.toString(),
                                style: GoogleFonts.poppins(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                (providerListener.subcategoryCouts.products ??
                                            0)
                                        .toString() +
                                    " Products | " +
                                    (providerListener
                                                .subcategoryCouts.companies ??
                                            0)
                                        .toString() +
                                    " companies",
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          ShareButton(),
                        ],
                      ),
                    ),
                  ),
                  providerListener.subcategoryList.length > 0
                      ? Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ImageSlider(),
                        )
                      : SizedBox(height: 1),
                  providerListener.subcategoryList.length > 0
                      ? Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: buildCategoryList(context),
                        )
                      : SizedBox(height: 1)
                ],
              ),
            ),
          )
        : Container(
            height: SizeConfig.screenHeight,
            color: Colors.white,
            child: Center(
              child: new CircularProgressIndicator(
                strokeWidth: 1,
                backgroundColor: Color(COLOR_PRIMARY),
                valueColor:
                    AlwaysStoppedAnimation<Color>(Color(COLOR_BACKGROUND)),
              ),
            ),
          );
  }

  buildCategoryList(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final providerListener = Provider.of<CustomViewModel>(context);

    return ListView.builder(
        scrollDirection: Axis.vertical,
        primary: false,
        shrinkWrap: true,
        itemCount: providerListener.subcategoryList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              push(context, Tractors());
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Container(
                width: screenWidth,
                height: 60,
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
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 100,
                      //width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          providerListener.subcategoryList[index].name +
                              " Please fix this Please fix thisPlease fix this",
                          style: GoogleFonts.poppins(
                            color: Color(0xff2DB571),
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Color(0xff008940),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
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
          pop(context);
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
    final providerListener = Provider.of<CustomViewModel>(context);

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
            items: providerListener.subcategoryImages.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: getProportionateScreenWidth(378),
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(item), fit: BoxFit.cover),
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
                children: providerListener.subcategoryImages.map((url) {
                  int index = providerListener.subcategoryImages.indexOf(url);
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
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
