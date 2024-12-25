import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up page"),
      ),
      body: Center(
        child: TextButton(
            onPressed: () => context.go("/"), child: const Text("home")),
      ),
    );
  }
}
