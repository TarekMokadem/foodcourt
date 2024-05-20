import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/buttons/app_icon_button.dart';
import '../views/cart/components/cartitem/food_item.dart';
import '../views/cart/models/food.dart';
import 'category_card.dart';

class MyFoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  final String title;
  final double deliveryTime;
  final double price;
  final String image;
  final VoidCallback onPressed;
  final Function(bool value) onLike;
  final bool favorite;
  final int index;

  const MyFoodTile({super.key, required this.food, required this.onTap,
  required this.title,
    required this.deliveryTime,
    required this.price,
    required this.onPressed,
    required this.onLike,
    required this.image,
    this.favorite = false,
    this.index = 0,});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 170,
                    height: 260,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [lightBoxShadow],
                    ),
                    // padding: EdgeInsets.zero,
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Transform.translate(
                            offset: const Offset(0, -8),
                            child: Transform.scale(
                              scale: 1.2,
                              child: FadeInImage(
                                placeholder: AssetImage(image),
                                image: AssetImage(image),
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 145,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        letterSpacing: 1.1,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text(
                                      '${deliveryTime.round()} minutes delivery',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      '$price €',
                                      style: const TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                AppIconButton(
                                  icon: const Icon(
                                    //Icons.add_circle_rounded,
                                    Icons.info_outline,
                                    color: Colors.pink,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FoodPage(food: food)));
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: () => onLike(!favorite),
                      icon: favorite
                          ? const Icon(
                        Icons.favorite,
                        color: Colors.pink,
                      )
                          : const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
      )
      ),
    )
    ]
    );
  }
}
