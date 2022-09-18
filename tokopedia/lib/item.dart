import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tokopedia/detail.dart';
import 'package:tokopedia/model/item.dart';
import 'package:tokopedia/home.dart';

class ItemPage extends StatefulWidget {
  const ItemPage({super.key});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  var items = [
    Item("Maxicorn", "assets/maxicorn.jpg", 50000),
    Item("Bihunku", "assets/bihunku.jpg", 50000),
    Item("Hardisk", "assets/hardisk.png", 50000),
    Item("Sensodyne", "assets/sensodyne.jpg", 50000),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text("Header")),
            ListTile(
              title: const Text("Profile"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
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
          Expanded(
              child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Column(children: [
                Text(items[index].name),
                Text(items[index].price.toString()),
                Image.asset(items[index].image),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return DetailPage(item: items[index]);
                        },
                      ));
                    },
                    child: const Text("Buy"))
              ]);
            },
          ))
        ],
      )),
    );
  }
}
