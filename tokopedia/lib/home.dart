import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var images = [
    "assets/bihunku.jpg",
    "assets/hardisk.png",
    "assets/maxicorn.jpg",
    "assets/sensodyne.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarouselSlider(
              items: images.map((e) {
                return Image.asset(e);
              }).toList(),
              options: CarouselOptions(
                  height: 400,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3)),
            ),
          ),
        ],
      ),
    );
  }
}
