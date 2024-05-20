import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../constants/data.dart';
import 'components/cart_tile.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Menu>(builder: (context, restaurant, child) {
      // cart
      final cart = restaurant.cart;

      // Scaffold UI
      return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const Text(
                                'Are you sure you want to clear the cart?'),
                            actions: [
                              // cancel button
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text('Cancel'),
                              ),

                              // yes button
                              TextButton(
                                onPressed: () {
                                  // clear cart
                                  Navigator.pop(context);
                                  restaurant.clearCart();
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          ));
                },
                icon: Icon(Icons.delete,
                    color: Theme.of(context).colorScheme.onBackground),
              )
            ],
          ),
          body: Column(
            children: [
              // cart items
              cart.isEmpty
                  ? Expanded(
                      child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_shopping_cart_rounded,
                            size: 200,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          Text(
                            'Your cart is empty',
                            style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )
                        ],)))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: cart.length,
                        itemBuilder: (context, index) {
                          final cartItem = cart[index];
                          return MyCartTile(cartItem: cartItem);
                        },
                      ),
                    ),
              // total price
              Text('Total: ${restaurant.getTotalPrice().toStringAsFixed(2)}'),

              const SizedBox(height: 20),

              // checkout button
             /* MyButton(onTap: () {
                return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentPage(),
                    )
                );
              }, text: 'Checkout'),*/

              const SizedBox(height: 25),
            ],
          ));
    });
  }
}
