import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodcourt/themes/app_colors.dart';

class HeaderSection extends StatelessWidget {
  HeaderSection({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;

  bool isAdmin =
      FirebaseAuth.instance.currentUser?.uid != "Lz5dBpexbQSFp8ajEZhP18ywyyK2";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          isAdmin
              ? TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                    ),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    // function that open a dialog with a form to add a product
                     showDialog(
                      context: context,
                      builder: (context) {
                        return SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: AlertDialog(
                            title: const Text('Add product'),
                            content: const Column(
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Product name',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Product price',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Product description',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Product image',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Product category',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Product brand',
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  decoration: InputDecoration(
                                    labelText: 'Product addons',
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // function that add the product to the database
                                  Navigator.of(context).pop();
                                },
                                child: Text('Add'),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(
                    'Add product',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
