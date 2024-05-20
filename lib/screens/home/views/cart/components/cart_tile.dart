
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodcourt/screens/home/views/cart/components/quantity_selector.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/data.dart';
import 'cartitem/cart_item.dart';


class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Menu>(
      builder: (context, restaurant, child) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        children:
                        [
                    // food image
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset(
                        cartItem.food.imagePath,
                        fit: BoxFit.cover,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const SizedBox(width: 20),

                    // food name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 100,
                          child: Text(cartItem.food.name,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.inversePrimary,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text('${cartItem.food.price.toString()} €',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                          ),),
                      ],
                    ),]),

                    const Spacer(),

                    // increment or decrement quantity
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: Column(
                        children: [
                          QuantitySelector(
                            quantity: cartItem.quantity,
                            food: cartItem.food,
                            onIncrement: () {
                              restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                            },
                            onDecrement: () {
                              restaurant.removeFromCart(cartItem);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              restaurant.removeAllFromCart(cartItem);
                            },
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              // selected addons
              SizedBox(
                height: cartItem.selectedAddons.isNotEmpty ? 60 : 0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10, bottom: 10, right: 10),
                  children: cartItem.selectedAddons.map((addon) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilterChip(
                      label: Row(
                      children: [
                        //addon name
                        Text(addon.name,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),

                        const SizedBox(width: 5),

                        //addon price
                        Text('(${addon.price.toString()} €)',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                          ),
                        ),
                        ],
                      ),
                      shape: StadiumBorder(
                        side: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      onSelected: (bool value) {;
                      },
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        labelStyle:  TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontSize: 12,
                        )
                      ),
                    );
                  }).toList(),
                )
                ),
            ],
          )
        );
      },
    );
  }
}
