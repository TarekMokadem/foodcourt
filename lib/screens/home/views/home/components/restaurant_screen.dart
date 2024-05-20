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
  RestaurantScreen({
    Key? key,
    required this.backgroundImage,
    required this.menuData,
  }) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  String seletedCategory = '';
  List<String> favorites = [];

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return PopularNowCard(
            title: food.name,
            deliveryTime: 10,
            price: food.price,
            availableAddons: food.availableAddons,
            image: food.imagePath,
            onPressed: () {},
            favorite: favorites.contains(food.name),
            onLike: (value) {
              value && !favorites.contains(food.name)
                  ? setState(() => favorites.add(food.name))
                  : setState(() => favorites.remove(food.name));
            },
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(child: DrawerContent()),
      key: widget._scaffoldKey,
      // height: Get.height,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(scale: 1,opacity: 0.25,
              image: Image.asset(widget.backgroundImage).image,
              fit: BoxFit.cover
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 26.w),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 50),
              AvaterHeaderWithNotifications(parentScaffoldkey: widget._scaffoldKey),
              const SizedBox(height: 35),
              //const SearchBar(),
              searchBox(),
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
                          return ListView.separated(
                            shrinkWrap: true,
                            clipBehavior: Clip.none,
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: menu.menu.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 23),
                            itemBuilder: (_, index) {
                              final food = menu.menu[index];
                              return PopularNowCard(
                                title: food.name,
                                deliveryTime: 10,
                                price: food.price,
                                availableAddons: food.availableAddons,
                                image: food.imagePath,
                                onPressed: () {},
                                favorite: favorites.contains(food.name),
                                onLike: (value) {
                                  value && !favorites.contains(food.name)
                                      ? setState(() => favorites.add(food.name))
                                      : setState(
                                          () => favorites.remove(food.name));
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


