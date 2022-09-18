import 'package:flutter/material.dart';
import 'package:tokopedia/login.dart';

void main(List<String> args) {
  runApp(const Tokopedia());
}

// create with 'st' sneepad -> stateless widget
// if want to convert to statefull -> right click -> refactor -> convert to statefull
class Tokopedia extends StatelessWidget {
  const Tokopedia({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Tokopedia",
      home: LoginPage(),
    );
  }
}
