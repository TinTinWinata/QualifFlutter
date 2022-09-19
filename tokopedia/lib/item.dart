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
    var size = MediaQuery.of(context).size;
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
          alignment: Alignment.center,
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Image.asset(items[index].image)),
                      Flex(direction: Axis.horizontal, children: [
                        Column(
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                items[index].name,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            Container(
                                alignment: Alignment.bottomLeft,
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                child: Text(
                                  items[index].price.toString(),
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          width: 200,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return DetailPage(item: items[index]);
                                  },
                                ));
                              },
                              child: const Text("Buy")),
                        )
                      ]),
                    ]),
                  );
                },
              ))
            ],
          )),
    );
  }
}
