import 'package:flutter/material.dart';
import 'package:kisan/UI/DetailedScreens/DetailedFeaturdProducts.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: GridView.builder(
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: (170 / 190),
            ),
            itemCount: 4,
            itemBuilder: (context, index) {
              return GridProds(
                name: "SAME 325 DFI",
                desc: "Duetz Fahr",
                imgPath: "assets/images/tractor.png",
              );
            },
          ),
        ));
  }
}