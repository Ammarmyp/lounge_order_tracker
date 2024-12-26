import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paamy_order_tracker/components/my_button.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/components/my_textField.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  void onTap() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
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
                  const SizedBox(
                    height: 15,
                  ),
                  MyButton(
                    onTap: () => context.push("/orderList"),
                    label: "Sign In",
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => context.push("/signUp"),
                        child: const Text(
                          "Register here",
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
