import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokopedia/model/comment.dart';
import 'package:tokopedia/model/item.dart';

class DetailPage extends StatefulWidget {
  Item item;
  DetailPage({super.key, required this.item});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController reviewController = TextEditingController();
  var comments = [];

  void handleSend() async {
    final prefs = await SharedPreferences.getInstance();
    var username = prefs.getString('username');
    String review = reviewController.text;

    if (review.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Review cannot be empty!")));
    }

    var comment = Comment(username.toString(), review);
    setState(() {
      reviewController.text = "";
      comments.add(comment);
    });
  }

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
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Image.asset(widget.item.image),
                  Text(widget.item.price.toString()),
                  Text(widget.item.name),
                  TextField(
                    controller: reviewController,
                    decoration: const InputDecoration(hintText: "Comment"),
                  ),
                  ElevatedButton(
                      onPressed: handleSend, child: const Text("Send Comment")),
                ],
              ))),
          Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      Text(comments[index].name),
                      Text(comments[index].comment),
                    ]);
                  },
                ))
              ]))
        ]),
      ),
    );
  }
}
