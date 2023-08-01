import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './components/product_catalog.dart';

class Categories extends StatefulWidget {
  
  const Categories({
    super.key,
    required this.category,
  });

  final String category; 

  @override
  State<Categories> createState() => _CategoriesState();
}


class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Test Categories'),  
    //   ),
    //   body: const Center(
    //     child: Text('Categories wesh'),
    //   ),  
    // );
    return Container(
      child: ProductCatalog(category: widget.category),
    );
  }
}