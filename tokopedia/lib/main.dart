import 'package:flutter/material.dart';
import 'package:tokopedia/login.dart';
import 'package:tokopedia/settings/config.dart';

void main(List<String> args) {
  runApp(const Tokopedia());
}

// create with 'st' sneepad -> stateless widget
// if want to convert to statefull -> right click -> refactor -> convert to statefull
class Tokopedia extends StatefulWidget {
  const Tokopedia({super.key});

  @override
  State<Tokopedia> createState() => _TokopediaState();
}

class _TokopediaState extends State<Tokopedia> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tokopedia",
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: const LoginPage(),
    );
  }
}
