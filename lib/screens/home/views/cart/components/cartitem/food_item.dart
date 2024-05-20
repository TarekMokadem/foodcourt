import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../constants/data.dart';
import '../../../../../../widgets/buttons/button.dart';
import '../../models/food.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodPage({super.key, required this.food}) {
    // initialize selected addons to be false
    for (Addon addon in food.availableAddons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  bool hasPopped = false;
  // method to add food item to cart
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    // close the food page
    if (!hasPopped) {
      Navigator.pop(context);
      hasPopped = true;
    }

    // get selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (widget.selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }

    // add to cart
    context.read<Menu>().addToCart(food, currentlySelectedAddons);
  }

  // quantity of food item to be added to cart
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              // food image
              Image.asset(
                widget.food.imagePath,
                fit: BoxFit.cover,
                height: 400,
                width: double.infinity,
              ),
              const SizedBox(height: 20),
              // food name
              Text(
                widget.food.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              // food description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  textAlign: TextAlign.center,
                  widget.food.description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // food price
              Text(
                '${widget.food.price.toStringAsFixed(2)}€',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Divider(
                indent: 25,
                endIndent: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(height: 20),
              // addons
              Text(
                'Add-ons',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
              // list of addons with price and checkbox
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: widget.food.availableAddons.length,
                    itemBuilder: (context, index) {
                      // get addon
                      final addon = widget.food.availableAddons[index];

                      // return addon tile UI
                      return CheckboxListTile(
                        title: Text(
                          addon.name,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          '${addon.price.toStringAsFixed(2)}€',
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        value: widget.selectedAddons[addon],
                        onChanged: (bool? value) {
                          setState(() {
                            widget.selectedAddons[addon] = value!;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Decrease button
                      GestureDetector(
                        onTap: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        child: Icon(
                          Icons.remove,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),

                      // quantity count
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      // Increase button
                      GestureDetector(
                        // add quantity
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: Icon(
                          Icons.add,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
              // add to cart button
              MyButton(
                  onTap: () {
                    for (int i = 0; i < quantity; i++){
                      addToCart(widget.food, widget.selectedAddons);
                    }},
                  text: 'Add to cart'),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      //back button
      SafeArea(
          child: Opacity(
              opacity: 0.5,
              child: Container(
                margin: const EdgeInsets.only(left: 25),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )))
    ]);
  }
}
