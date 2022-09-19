import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tokopedia/navigation.dart';
import 'package:tokopedia/item.dart';
import 'package:tokopedia/settings/constant.dart';

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
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Image.asset(
                "assets/logo.png",
                width: 300,
              ),
            ),

            // const Text("Email"),

            Container(
              alignment: Alignment.center,
              width: size.width * 0.8,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: const Text(
                        "Nomor HP atau Email",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          myDefaultPadding, 5, myDefaultPadding, 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: myDefaultPadding),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        style: const TextStyle(fontSize: 15),
                        controller: usernameController,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.person,
                              color: Colors.green,
                            ),
                            hintText: "Email",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(
                          myDefaultPadding, 0, myDefaultPadding, 30),
                      padding: const EdgeInsets.symmetric(
                          horizontal: myDefaultPadding),
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        obscureText: true,
                        style: const TextStyle(fontSize: 15),
                        controller: passwordController,
                        decoration: const InputDecoration(
                            icon: Icon(
                              Icons.key,
                              color: Colors.green,
                            ),
                            hintText: "Password",
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none),
                      ),
                    ),
                  ]),
            ),
            Container(
              width: size.width * 0.75,
              height: 40,
              child: ElevatedButton(
                  onPressed: handleLogin,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.fromLTRB(0, 7, 60, 0),
              child: const Text(
                "Butuh bantuan ?",
                style: TextStyle(color: Colors.green),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
