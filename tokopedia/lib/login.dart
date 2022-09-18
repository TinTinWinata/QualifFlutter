import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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

  void handleLogin() {
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
    return Scaffold(
        body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset("assets/logo.png"),
            const Text("Email"),
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const Text("Password"),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            ElevatedButton(onPressed: handleLogin, child: const Text("Login")),
          ],
        ),
      ),
    ));
  }
}
