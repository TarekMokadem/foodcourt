import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodcourt/constants/assets_constant.dart';
import 'package:foodcourt/screens/home/widgets/app_circle_image.dart';

import '../views/cart/cart_page.dart';
import '../views/home/components/services/storage_service.dart';

class AvaterHeaderWithNotifications extends StatefulWidget {
  final parentScaffoldkey;

  AvaterHeaderWithNotifications({
    Key? key,
    required this.parentScaffoldkey,
  }) : super(key: key);

  @override
  State<AvaterHeaderWithNotifications> createState() =>
      _AvaterHeaderWithNotificationsState();
}

class _AvaterHeaderWithNotificationsState
    extends State<AvaterHeaderWithNotifications> {
  final user = FirebaseAuth.instance.currentUser;

  StorageService storageService = StorageService();
  Uint8List? pickedImage;

  @override
  void initState() {
    super.initState();
    getProfilePicture();
  }

  Future<void> getProfilePicture() async {
    final imageBytes = await storageService.getFile('profile_1.jpg');
    if (imageBytes == null) return;
    setState(() {
      pickedImage = imageBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // White container like a card with rounded border and elevation
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.3,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                image: pickedImage != null
                    ? DecorationImage(
                        image: Image.memory(pickedImage!, fit: BoxFit.cover).image,
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: const Center(
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.black38,
                  size: 35,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user!.email!,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const Spacer(flex: 3,),
            Cart(isActive: true),
            Flexible(flex: 2,
              child: Builder(builder: (context) {
                return IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    widget.parentScaffoldkey.currentState!.openEndDrawer();
                  },
                  icon: Icon(Icons.menu),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          icon: const Icon(
            Icons.shopping_cart,
            size: 27,
          ),
          iconSize: 27,
          onPressed: () {
            // Go to cart page
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartPage()),
            );
          },
        ),
        if (isActive==false)
          const Positioned(
            top: 3.4,
            right: 5,
            child: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 4,
            ),
          )
      ],
    );
  }
}
