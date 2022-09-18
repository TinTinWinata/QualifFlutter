import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tokopedia/detail.dart';
import 'package:tokopedia/item.dart';
import 'package:tokopedia/profile.dart';

class HomePage extends StatelessWidget {
  String username;
  HomePage({super.key, required this.username});

  var items = [
    Item("Maxicorn", "assets/maxicorn.jpg"),
    Item("Bihunku", "assets/bihunku.jpg"),
    Item("Hardisk", "assets/hardisk.png"),
    Item("Sensodyne", "assets/sensodyne.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tokopedia")),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("Header")),
            ListTile(
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ProfilePage();
                  },
                ));
              },
            )
          ],
        ),
      ),
      body: Container(
          child: Column(
        children: [
          Text(username),
          Expanded(
              child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Column(children: [
                Text(items[index].name),
                Image.asset(items[index].image),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const DetailPage();
                        },
                      ));
                    },
                    child: const Text("View Detail"))
              ]);
            },
          ))
        ],
      )),
    );
  }
}
