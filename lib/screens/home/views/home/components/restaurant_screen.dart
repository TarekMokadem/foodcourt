import 'dart:ffi';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodcourt/constants/data.dart';
import 'package:foodcourt/screens/home/widgets/app_header.dart';
import 'package:foodcourt/screens/home/widgets/category_card.dart';
import 'package:provider/provider.dart';

import '../../../../../models/popular_model.dart';
import '../../cart/models/food.dart';
import '../components/drawer.dart';
import '../components/header_section.dart';
import '../../../widgets/popular_now_card.dart';

class RestaurantScreen extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final String backgroundImage;
  final List<Food> menuData;
  final int currentBottomIndex;
  RestaurantScreen({
    Key? key,
    required this.backgroundImage,
    required this.menuData,
    required this.currentBottomIndex,
  }) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  String seletedCategory = '';
  List<Food> favorites = [];
  bool isAdmin = FirebaseAuth.instance.currentUser?.uid != "Lz5dBpexbQSFp8ajEZhP18ywyyK2";

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Food> _filterMenuByBrand(FoodBrand brand, List<Food> fullMenu) {
    return fullMenu.where((food) => food.brand.contains(brand)).toList();
  }

  List<List<Food>> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      return _filterMenuByCategory(category, fullMenu);
    }).toList();
  }


  List<List<Food>> getFoodInThisBrand(List<Food> fullMenu) {
    return FoodBrand.values.map((brand) {
      return _filterMenuByBrand(brand, fullMenu);
    }).toList();
  }

  Widget ifAdmin(){
    if (isAdmin){
      return AvaterHeaderWithNotifications(parentScaffoldkey: widget._scaffoldKey);
    }else {
      // Returning a text that indicate that this is the admin panel
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(134, 133, 133, 0.5019607843137255),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          "Admin panel",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
        endDrawer: Drawer(child: DrawerContent()),
        key: widget._scaffoldKey,
        // height: Get.height,
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ifAdmin(),
                //const SizedBox(height: 35),
                //const SearchBar(),
                //searchBox(),
                const SizedBox(height: 30),
                // offers section
                // const OffersSection(),
                // const SizedBox(height: 20),
                HeaderSection(
                  onPressed: () {},
                  title: 'Categories',
                ),

                // categories section
                SizedBox(
                  height: 115,
                  child: ListView.separated(
                    clipBehavior: Clip.none,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    separatorBuilder: (context, index) => const SizedBox(width: 23),
                    itemBuilder: (context, index) {
                      final category = categoryDataPizza[index];
                      return CategoryCard(
                        category: category.category,
                        image: category.image,
                        onSelected: (value) {
                          setState(() {
                            if (value) {
                              seletedCategory = category.category;
                            } else {
                              seletedCategory = '';
                            }
                          });
                        },
                        selected:
                        seletedCategory == category.category ? true : false,
                      );
                    },
                  ),
                ),

                //
                HeaderSection(
                  onPressed: () {},
                  title: 'Popular Now',
                ),

                SizedBox(
                  height: 230,
                  child: Consumer<Menu>(
                      builder: (context, menu, child) {
                        // print(" getFoodInThisCategory(menu.menu) : ${getFoodInThisBrand(menu.menu)}");
                        return ListView.separated(
                          shrinkWrap: true,
                          clipBehavior: Clip.none,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: getFoodInThisBrand(menu.menu)[widget.currentBottomIndex].length,
                          separatorBuilder: (context, index) =>
                          const SizedBox(width: 23),
                          itemBuilder: (_, index) {
                            final food = getFoodInThisBrand(menu.menu)[widget.currentBottomIndex][index];
                            return PopularNowCard(
                              food: food,
                              title: food.name,
                              deliveryTime: 10,
                              price: food.price,
                              availableAddons: food.availableAddons,
                              image: food.imagePath,
                              onPressed: () {},
                              favorite: favorites.contains(food),
                              onLike: (value) {
                                value && !favorites.contains(food.name)
                                    ? setState(() => favorites.add(food))
                                    : setState(
                                        () => favorites.remove(food));
                              },
                            );
                          },
                        );
                      }),
                ),
                //
                HeaderSection(
                  onPressed: () {},
                  title: 'Favorites',
                ),

                SizedBox(
                  height: 230,
                  child: Consumer<Menu>(
                      builder: (context, menu, child) {
                        // print(" getFoodInThisCategory(menu.menu) : ${getFoodInThisBrand(menu.menu)}");
                        return ListView.separated(
                          shrinkWrap: true,
                          clipBehavior: Clip.none,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: favorites.length,
                          separatorBuilder: (context, index) =>
                          const SizedBox(width: 23),
                          itemBuilder: (_, index) {
                            final food = favorites[index];
                            return PopularNowCard(
                              food: food,
                              title: food.name,
                              deliveryTime: 10,
                              price: food.price,
                              availableAddons: food.availableAddons,
                              image: food.imagePath,
                              onPressed: () {},
                              favorite: favorites.contains(food),
                              onLike: (value) {
                                value && !favorites.contains(food)
                                    ? setState(() => favorites.add(food))
                                    : setState(
                                        () => favorites.remove(food));
                              },
                            );
                          },
                        );
                      }),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width*0.3,
                ),
              ],
            ),
          ),),
      ),

        //back button
        isAdmin ? Container() :
        SafeArea(
            child:Container(alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 25,top: 30),
                  child: IconButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(134, 133, 133, 0.5019607843137255)),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                    ),
                    icon: const Icon(Icons.exit_to_app_rounded,
                      color: Colors.black,
                      size: 40,),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                  ),
                )),],
    );
  }
}

Widget searchBox() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration:  BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    child: const TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 0, bottom: 0),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.black,
          size: 20,
        ),
        prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25
        ),
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: TextStyle(color: Colors.grey),
      ),
    ),
  );
}


