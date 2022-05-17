import 'package:flutter/material.dart';
import 'package:keroi/screens/home/main_page.dart';

import 'home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String errorMessage = '';

  Widget appTitle() {
    return Text(
      "Keroi",
      style: TextStyle(
        color: Colors.blue[600],
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget emailInput() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextFormField(
        controller: usernameController,
        autofocus: true,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade300, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade500, width: 2.0),
          ),
          labelText: 'Username',
          hintText: "Enter your username here",
          alignLabelWithHint: true,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Widget passwordInput() {
    return Container(
      margin: const EdgeInsets.all(20),
      child: TextFormField(
        controller: passwordController,
        obscureText: true,
        enableSuggestions: false,
        autocorrect: false,
        autofocus: true,
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade300, width: 2.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade500, width: 2.0),
          ),
          labelText: 'Password',
          hintText: "Enter your password here",
          alignLabelWithHint: true,
          labelStyle: TextStyle(color: Colors.grey.shade500),
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Widget submitButton() {
    return Container(
      height: 55,
      width: 120,
      decoration: const ShapeDecoration(
          shape: StadiumBorder(), color: Colors.blueAccent),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const StadiumBorder(),
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          checkIfInputIsValid();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              appTitle(),
              const SizedBox(
                height: 32,
              ),
              emailInput(),
              passwordInput(),
              submitButton(),
              const SizedBox(
                height: 12,
              ),
              Text(
                errorMessage,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void checkIfInputIsValid() {
    if (usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MainPage(
            username: usernameController.text,
          ),
        ),
      );
    } else {
      setState(() {
        errorMessage = "Please enter a username and password";
      });
    }
  }
}
