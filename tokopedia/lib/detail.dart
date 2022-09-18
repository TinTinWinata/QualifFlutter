import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: const Text("Tokopedia"),
            bottom: const TabBar(tabs: [
              Tab(icon: Icon(Icons.ac_unit)),
              Tab(icon: Icon(Icons.comment)),
            ])),
        body: TabBarView(children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [Text("Ini adalah konten")],
              )),
          Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [Text("Ini adalah comments")],
              ))
        ]),
      ),
    );
  }
}
