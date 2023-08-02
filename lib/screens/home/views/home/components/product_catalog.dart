import 'package:flutter/material.dart';
import 'package:foodcourt/models/category_model.dart';
import 'package:foodcourt/models/popular_model.dart';
import 'package:foodcourt/themes/app_colors.dart';

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
  
  bool _pinned = false; 
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
            expandedHeight: MediaQuery.of(context).size.height * 0.05,
            title: Text('${widget.category}'),
            // flexibleSpace: FlexibleSpaceBar(
            //   title: Text('$widget.category'),
              //background: const FlutterLogo(),
            // ),
          ),
          // const SliverToBoxAdapter(
          //   child: SizedBox(
          //     height: 20,
          //     child: Center(
          //       child: Text('Scroll to see the SliverAppBar in effect'),
          //     ),
          //   ),
          // ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 20.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                PopularModel pizza = popularDataPizza[index];
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      //color: Colors.teal[100 * (index % 9)],
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.18,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/images/pizza1.png')),
                        //border: Border.all(color: Colors.blueAccent),
                        color: index.isEven
                          ? greyColor.withOpacity(0.4)
                          : greyColor.withOpacity(0.8),
                        //border: Border.symmetric(vertical: BorderSide(color: Colors.blueAccent, width: MediaQuery.of(context).size.width * 0.05)),
                      )   
                    ),
                      //child: Text('${pizza.title}'),
                    Container(
                      child: Text('${pizza.title}')
                    )
                  ],

                );
              },
              childCount: popularDataPizza.length,
            ),
          ),
        ],
      ),
    );
  }
}