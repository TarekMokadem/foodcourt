import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodcourt/controllers/cart/cart_controller.dart';
import 'package:get/get.dart';

class BuildDescriptionsAndRatings extends GetView<CartController> {
  const BuildDescriptionsAndRatings({
    Key? key,
    required this.title,
    required this.desc,
    //required this.rating,
    required this.index,
  }) : super(key: key);

  final String title;
  final String desc;
  //final double rating;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01), 
              SizedBox(
                width: MediaQuery.of(context).size.width * 1,
                child: Text(
                  desc,
                  style: const TextStyle(
                    fontSize: 13,
                  ),
                ),
              )
            ],
          ),
        ),
        /*Positioned(
          top: 0,
          right: 0,
          child: RatingBar.builder(
            //initialRating: rating,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 2),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemSize: 20,
            onRatingUpdate: (rating) {
              controller.rate(index, rating);
            },
          ),
        )*/
      ],
    );
  }
}
