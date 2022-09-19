import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tokopedia/item.dart';
import 'package:tokopedia/login.dart';
import 'package:tokopedia/home.dart';
import 'package:tokopedia/settings/config.dart';

class NavigationPage extends StatefulWidget {
  String username;
  NavigationPage({super.key, required this.username});

  @override
  State<NavigationPage> createState() => NavigationPageState();
}

enum MenuItem {
  item1,
  item2,
}

class NavigationPageState extends State<NavigationPage> {
  int idx = 0;
  var pages = [
    HomePage(),
    const ItemPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[idx],
      // extendBodyBehindAppBar: true,

      appBar: AppBar(
        leading: const Icon(Icons.sms_outlined),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Search",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none),
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<MenuItem>(
            onSelected: (value) {
              if (value == MenuItem.item1) {
                currentTheme.switchTheme();
              } else if (value == MenuItem.item2) {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ), (route) => false);
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: MenuItem.item1,
                child: Text("Change Theme"),
              ),
              const PopupMenuItem(
                value: MenuItem.item2,
                child: Text("Logout"),
              )
            ],
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
        ),
        backgroundColor: Colors.green, // Colors.white.withOpacity(0.1),
        elevation: 0,
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: idx,
        onDestinationSelected: (index) {
          setState(() {
            idx = index;
          });
        },
        destinations: [
          NavigationDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: "Home"),
          NavigationDestination(
              icon: const Icon(Icons.shop_2_outlined),
              selectedIcon: const Icon(Icons.shop_2),
              label: "Item")
        ],
      ),
    );
  }
}
