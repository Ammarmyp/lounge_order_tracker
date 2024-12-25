import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/components/my_textField.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final cafeNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up page"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // TextButton(
                //   onPressed: () => context.go("/"),
                //   child: const Text("home"),
                // ),
                const SizedBox(
                  height: 25,
                ),
                const Icon(
                  Icons.table_restaurant_rounded,
                  size: 150,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Welcome!!",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  controller: cafeNameController,
                  labelText: "Cafe Name",
                  hintText: "Central",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 7,
                ),
                MyTextField(
                  controller: phoneNumberController,
                  labelText: "Phone",
                  hintText: "+251***",
                  obscureText: false,
                ),
                const SizedBox(
                  height: 7,
                ),
                MyTextField(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "********",
                  obscureText: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
