import 'package:flutter/material.dart';
import 'package:foodcourt/screens/home/views/cart/cart_view.dart';
import 'package:foodcourt/screens/home/views/home/components/bottom_app_bar.dart';
import 'package:foodcourt/screens/home/views/home/marache_coffee.dart';
import 'package:foodcourt/screens/home/views/home/pepper_grill.dart';
import 'package:foodcourt/screens/home/views/home/pokenio.dart';
import 'package:foodcourt/screens/home/views/home/wolly_wings.dart';
import 'package:foodcourt/screens/home/views/home/pizza_time.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // buttom nav bar... index
  var currentBottomIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  void switchPage(value) {
    setState(() => currentBottomIndex = value);
    pageController.animateToPage(
      currentBottomIndex,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBottomBar(
        currentBottomIndex: currentBottomIndex,
        onTap: (value) => switchPage(value),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (currentBottomIndex > 0) {
            switchPage(0);
            return false;
          }
          return true;
        },
        child: BuildPages(
          currentPage: currentBottomIndex,
          pages: const [
            // CartView(),
            WollyWings(),
            Pokenio(),
            MaracheCoffee(),
            PizzaTime(),
            PPG(),
          ],
          onPageChanged: (value) =>
              setState(() => currentBottomIndex = value.round()),
          pageController: pageController,
        ),
      ),
    );
  }
}

class BuildPages extends StatelessWidget {
  const BuildPages({
    super.key,
    required this.currentPage,
    required this.pages,
    required this.onPageChanged,
    required this.pageController,
  });

  final int currentPage;
  final List<Widget> pages;
  final ValueChanged<int> onPageChanged;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      clipBehavior: Clip.antiAlias,
      controller: pageController,
      onPageChanged: onPageChanged,
      pageSnapping: true,
      restorationId: 'home_screen',
      children: pages,
    );
  }
}
