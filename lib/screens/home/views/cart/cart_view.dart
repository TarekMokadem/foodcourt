import 'package:flutter/material.dart';
import 'package:foodcourt/constants/data.dart';
import 'package:foodcourt/controllers/cart/cart_controller.dart';
import 'package:foodcourt/models/popular_model.dart';
import 'package:foodcourt/screens/home/views/cart/components/cartitem/cart_item.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({
    Key? key,
    required this.indexPizza
  }) : super(key: key);

  final int indexPizza;  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      id: 'cart_view',
      builder: (state) {
        return Scaffold(
          body: SizedBox.expand(
            child: PageView.builder(
              restorationId: 'cart_view',
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                final cart = popularDataPizza[indexPizza];
                return CartItem(
                  index: index,
                  title: cart.title,
                  desc: cart.desc,
                  image: cart.image,
                  price: cart.price,
                  rating: cart.rating,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
