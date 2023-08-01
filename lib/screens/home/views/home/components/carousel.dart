import 'package:flutter/material.dart';
import 'package:carousel_indicator/carousel_indicator.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  int pageIndex=0;

  @override
  Widget build(BuildContext context) {

    List<Widget> demo=[
    // Container(
    //   decoration: const BoxDecoration(
    //     image: DecorationImage(
          // image: AssetImage('assets/images/duo.png'),
    //       fit: BoxFit.fitHeight,
    //     ),
    //     //shape: BoxShape.circle,
    //   )
    //   ),
      // const Image(image: Image.file('assets/images/PizzaTimeImages/Menus/duo.png')),
      Container(color: Colors.black),
      Container(color: Colors.blue),
      Container(color: Colors.green),
      Container(color: Colors.red),

    ];

    return Column(
      children: [
        SizedBox(
          height: 500,
          width: double.infinity,
          child: PageView(
            children: demo,
            onPageChanged: (index){
                setState(() {
                  pageIndex=index;
                });
            },
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.001),
        CarouselIndicator(
          count: demo.length,
          index: pageIndex,
        ),
      ],
    );
  }
}