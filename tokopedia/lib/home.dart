import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tokopedia/settings/constant.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  var images = [
    "assets/banner.jpg",
    "assets/banner-2.jpg",
    "assets/banner-3.jpg",
    "assets/banner-4.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 90,
            child: Stack(children: [
              Container(
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                height: 70,
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    height: 40,
                    child: Flex(direction: Axis.horizontal, children: [
                      Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Icon(
                            Icons.money_off_rounded,
                            color: Colors.grey,
                          )),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: const Text(
                          "Rp. 23.000",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const Text("Aktifkan",
                          style: TextStyle(color: Colors.green))
                    ]),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(3, 3),
                              blurRadius: 20,
                              color: Colors.grey.withOpacity(0.3))
                        ]),
                  )),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: CarouselSlider(
              items: images.map((e) {
                return Image.asset(
                  e,
                  fit: BoxFit.cover,
                  width: 1000,
                );
              }).toList(),
              options: CarouselOptions(
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: myDefaultPadding),
              padding: const EdgeInsets.symmetric(horizontal: myDefaultPadding),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomLeft,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 0, 10),
                      child: Text("About Us",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                    child: Text(
                      "Tokopedia adalah perusahaan teknologi Indonesia dengan misi mencapai pemerataan ekonomi secara digital",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
