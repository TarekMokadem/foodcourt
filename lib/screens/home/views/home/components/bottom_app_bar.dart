import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodcourt/themes/app_colors.dart';

class AppBottomBar extends StatelessWidget {
  const AppBottomBar({
    Key? key,
    required this.currentBottomIndex,
    required this.onTap,
  }) : super(key: key);

  final int currentBottomIndex;
  final ValueChanged onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      height: 80.h,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: primaryColor.withOpacity(0.4), width: 0.6),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: currentBottomIndex,
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        type: BottomNavigationBarType.fixed,
        backgroundColor: scaffoldBgColor,
        fixedColor: primaryColor,
        unselectedIconTheme: const IconThemeData(size: 22),
        selectedIconTheme: IconThemeData(color: primaryColor, size: 24),
        selectedLabelStyle: TextStyle(color: primaryColor),
        unselectedItemColor: const Color(0xFF303030).withOpacity(0.7),
        selectedFontSize: 12.sp,
        unselectedFontSize: 11.sp,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Material(borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.transparent,
                elevation: 3,
                child: Image.asset(width: 40, 'assets/images/wolly_logo.png')),
            activeIcon: BottomBarIndicator(
                icon: Material(borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.transparent,
                    elevation: 5,child: Image.asset(width: 50, 'assets/images/wolly_logo.png'))),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Material(borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.transparent,
                elevation: 5,child: Image.asset(width: 30, 'assets/images/logo_pokenio.png')),
            activeIcon: BottomBarIndicator(
                icon: Material(borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.transparent,
                    elevation: 7,child: Image.asset(width: 40, 'assets/images/logo_pokenio.png'))),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Material(borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.transparent,
                    elevation: 3,child: Image.asset(width: 35, 'assets/images/marache_coffee_logo.png')),
            activeIcon: BottomBarIndicator(
                icon: Material(borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.transparent,
                  elevation: 5,
                  child: Image.asset(
                      width: 45, 'assets/images/marache_coffee_logo.png'),
                )),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Material(borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.transparent,
                elevation: 10,child: Image.asset(width: 35, 'assets/images/logo_pizza_time.png')),
            activeIcon: BottomBarIndicator(
                icon: Material(borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.transparent,
                  elevation: 15,
                  child: Image.asset(
                      width: 38, 'assets/images/logo_pizza_time.png'),
                )),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Material(borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Colors.transparent,
                elevation: 7,child: Image.asset(width: 40, 'assets/images/logo_ppg.png')),
            activeIcon: BottomBarIndicator(
                icon: Material(borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.transparent,
                    elevation: 10,child: Image.asset(width: 50, 'assets/images/logo_ppg.png'))),
          ),
        ],
      ),
    );
  }
}

class BottomBarIndicator extends StatelessWidget {
  const BottomBarIndicator({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 1),
        Container(
          width: 20,
          height: 3,
          color: primaryColor,
        )
      ],
    );
  }
}
