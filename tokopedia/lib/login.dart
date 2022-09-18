import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tokopedia/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isAgree = false;
  List<String> countries = ["Indonesia", "Singapore", "Malaysia"];
  String selectedCountry = "Indonesia";
  var darkMode = false;
  String selectedGender = "";
  var currentDate = DateTime.now();
  double satisfaction = 0.0;

  TextEditingController usernameController = TextEditingController();

  void handleLogin() {
    String username = usernameController.text;
    if (username.length <= 3) {
      // error

      // USING SNACKBAR
      // Find closed parent
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(content: Text("Username must be 3 characters!")));

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Error Validation"),
            content: const Text("Username must be 3 characters!"),
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
      return;
    }
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return HomePage(
          username: username,
        );
      },
    ), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Tokopedia")),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Text("Name"),
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(hintText: "Username"),
                ),
                CheckboxListTile(
                  value: isAgree,
                  onChanged: (value) {
                    setState(() {
                      isAgree = value!;
                      // Bang Operator
                    });
                  },
                  title: const Text("Agree to Terms and Conditions"),

                  // To make subtitle for the checkboxes
                  subtitle: const Text("Agree"),

                  // To active an icon to checkbox
                  // secondary: const Icon(Icons.alarm),
                ),
                DropdownButton(
                    value: selectedCountry,
                    items: countries.map((e) {
                      return DropdownMenuItem<String>(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value!;
                      });
                    }),
                RadioListTile(
                    title: const Text("Male"),
                    value: "Male",
                    groupValue: selectedGender,
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    }),
                RadioListTile(
                  title: const Text("Female"),
                  value: "Female",
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value!;
                    });
                  },
                ),
                SwitchListTile(
                  value: darkMode,
                  onChanged: (value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: Text("$currentDate"),
                  trailing: ElevatedButton(
                    child: const Text("Change date"),
                    onPressed: () async {
                      DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: currentDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2030));
                      setState(() {
                        currentDate = picked!;
                      });
                    },
                  ),
                ),
                Slider(
                  // Max 100
                  max: 100,
                  // Divide slider by 5 divison,
                  divisions: 5,

                  label: satisfaction.toString(),
                  value: satisfaction,
                  onChanged: (value) {
                    setState(() {
                      satisfaction = value;
                    });
                  },
                ),
                ElevatedButton(
                    onPressed: handleLogin, child: const Text("Login")),
              ],
            ),
          ),
        ));
  }
}
