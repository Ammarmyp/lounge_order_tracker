import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                context.go("/signIn");
              },
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
