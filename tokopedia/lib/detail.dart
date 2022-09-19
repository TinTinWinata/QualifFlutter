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
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 3),
                    child: Text(
                      widget.item.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                      child: Text(widget.item.price.toString())),
                  TextField(
                    controller: reviewController,
                    decoration: const InputDecoration(hintText: "Comment"),
                  ),
                  Container(
                    width: 800,
                    child: ElevatedButton(
                        onPressed: handleSend,
                        child: const Text(
                          "Send Comment",
                          style: TextStyle(backgroundColor: Colors.green),
                        )),
                  ),
                ],
              ))),
          Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Expanded(
                    child: ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    return Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 0, 10),
                                child: Text(
                                  comments[index].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                            Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: const Offset(3, 1),
                                          blurRadius: 20,
                                          color: Colors.grey.withOpacity(0.3))
                                    ],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text(comments[index].comment)),
                          ]),
                    );
                  },
                ))
              ]))
        ]),
      ),
    );
  }
}
