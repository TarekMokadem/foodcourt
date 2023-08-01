import 'package:flutter/material.dart';
import 'package:foodcourt/models/category_model.dart';
import 'package:foodcourt/models/popular_model.dart';

import '../../../../../constants/data.dart';

class ProductCatalog extends StatefulWidget {
  
  const ProductCatalog({
    super.key,
    required this.category,
  });

  final String category;

  @override
  State<ProductCatalog> createState() => _ProductCatalogState();
}

class _ProductCatalogState extends State<ProductCatalog> {
  
  bool _pinned = true; 
  bool _snap = false; 
  bool _floating = false; 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            snap: _snap,
            floating: _floating, 
            expandedHeight: MediaQuery.of(context).size.height * 0.2,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('$widget.category'),
              background: const FlutterLogo(),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
              child: Center(
                child: Text('Scroll to see the SliverAppBar in effect'),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 15.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                PopularModel pizza = popularDataPizza[index];
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('${pizza.title}'),
                );
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}