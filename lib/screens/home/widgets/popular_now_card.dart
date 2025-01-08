
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodcourt/screens/home/views/cart/food_page.dart';
import 'package:foodcourt/screens/home/widgets/category_card.dart';
import 'package:foodcourt/themes/app_colors.dart';
import 'package:foodcourt/widgets/buttons/app_icon_button.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/data.dart';
import '../views/cart/components/cartitem/food_item.dart';
import '../views/cart/models/food.dart';
import '../views/home/components/services/storage_service.dart';

class PopularNowCard extends StatelessWidget {
   PopularNowCard({
    Key? key,
    required this.food,
    required this.title,
    required this.deliveryTime,
    required this.price,
    required this.availableAddons,
    required this.onPressed,
    required this.onLike,
    required this.image,
    this.favorite = false,
    this.index = 0,
  }) : super(key: key);

  final Food food;
  final String title;
  final double deliveryTime;
  final double price;
  final List<Addon> availableAddons;
  final String image;
  final VoidCallback onPressed;
  final Function(bool value) onLike;
  final bool favorite;
  final int index;

  bool isAdmin =
      FirebaseAuth.instance.currentUser?.uid != "Lz5dBpexbQSFp8ajEZhP18ywyyK2";

  StorageService storageService = StorageService();


  @override
  Widget build(BuildContext context) {
    return Consumer<Menu>(
      builder: (context, menu,child) {
        return GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => FoodPage(food: food)));
          },
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
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        child: SingleChildScrollView(
                          physics: NeverScrollableScrollPhysics(),
                          clipBehavior: Clip.none,
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                              Row(
                                spacing: MediaQuery.of(context).size.width * 0.17,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '$price €',
                                    style: const TextStyle(
                                      fontSize: 15,
                                    ),
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
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 0,
                  child: isAdmin
                      ?
                  IconButton(
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
                  )
                      : IconButton(style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(const CircleBorder()),
                  ),
                      onPressed: () {

                        storageService.writeFile(menu.menu.toString());

                        menu.removeFoodItem(food);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      )
                  )
              ),
            ],
          ),
        );
      },
    );
  }
}
