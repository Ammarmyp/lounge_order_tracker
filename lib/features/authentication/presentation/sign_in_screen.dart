import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in page"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                child: const Text("home"),
                onPressed: () {
                  context.go("/");
                })
          ],
        ),
      ),
    );
  }
}
