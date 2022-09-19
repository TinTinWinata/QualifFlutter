import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokopedia/navigation.dart';
import 'package:tokopedia/item.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void handleLogin() async {
    String error = "";
    String username = usernameController.text;
    String password = passwordController.text;

    if (username.length <= 3) {
      error = "Username length must be greater than 3";
    } else if (username.isEmpty || password.isEmpty) {
      error = "Please input all text fields!";
    } else if (password == username) {
      error = "Username and password cannot be same";
    }

    if (error != "") {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error Validation"),
            content: Text(error),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Ok"))
            ],
          );
        },
      );
    } else {
      // Set Shared Preferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("username", username);

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
        builder: (context) {
          return NavigationPage(
            username: username,
          );
        },
      ), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 250,
            ),
            // const Text("Email"),

            Container(
              alignment: Alignment.center,
              width: size.width * 0.8,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(fontSize: 13, height: 0),
                    controller: usernameController,
                    decoration: const InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.3))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    obscureText: true,
                    style: const TextStyle(fontSize: 13, height: 0),
                    controller: passwordController,
                    decoration: const InputDecoration(
                        hintText: "Password", border: OutlineInputBorder()),
                  ),
                ),
              ]),
            ),
            Container(
              width: size.width * 0.8,  
              height: 50,
              child: ElevatedButton(
                  onPressed: handleLogin, child: const Text("Login")),
            ),
          ],
        ),
      ),
    ));
  }
}
