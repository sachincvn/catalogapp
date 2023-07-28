import 'package:flutter/material.dart';

import '../routes/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var name = "";
  final _formKey = GlobalKey<FormState>();

  loginUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamed(context, MyRoutes.HomePageRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  "assets/images/login_image.png",
                  fit: BoxFit.cover,
                  height: 400,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Welcome $name",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                child: Column(
                  children: [
                    TextFormField(
                      maxLines: 1,
                      decoration: const InputDecoration(
                          hintText: "Enter username", labelText: "username"),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "username cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter password", labelText: "password"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password cannot be empty";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => loginUser(context),
                      style: const ButtonStyle(
                          textStyle: MaterialStatePropertyAll(TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(108, 99, 255, 1)),
                          minimumSize: MaterialStatePropertyAll(Size(110, 40))),
                      child: const Text("Login"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
