import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './components/add_meal.dart';
import './components/build_image.dart';
import './components/descriptions_and_ratings.dart';
import './components/price_and_cart_actions.dart';
import 'package:foodcourt/themes/app_colors.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:badges/badges.dart' as badges;

class CartItem extends StatelessWidget {
  const CartItem({
    Key? key,
    required this.index,
    required this.image,
    required this.title,
    required this.desc,
    required this.price,
    required this.rating,
  }) : super(key: key);

  final int index;
  final String image;
  final String title;
  final String desc;
  final double price;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
          actions: <Widget>[
            badges.Badge(
              //position: badges.BadgePosition.topEnd(top: -10, end: -5),
              showBadge: false,
              ignorePointer: false,
              onTap: () {},
              child: IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              )
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BuildImage(image: image),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              /*SmoothIndicator(
                offset: index.toDouble(),
                count: 4,
                effect: const WormEffect(
                  activeDotColor: Colors.pink,
                  spacing: 12,
                ),
                size: const Size(0, 0),
              ),*/
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.001),
                    BuildDescriptionsAndRatings(
                      title: title,
                      desc: desc,
                      //rating: rating,
                      index: index,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    const AddYourMeal(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    BuildPriceAndCartActions(
                      price: price,
                      index: index,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: const Size(double.infinity, 60),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Place Order',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                    //SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
