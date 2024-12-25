import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paamy_order_tracker/features/home/presentation/components/select_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome To",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const Text(
              "Order/ table tracking app",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ModeBtn(
                  icon: Icons.person,
                  label: "User",
                  onTap: () => context.push("/"),
                ),
                const SizedBox(
                  width: 30,
                ),
                ModeBtn(
                  icon: Icons.restaurant_rounded,
                  label: "Owner",
                  onTap: () => context.push("/signIn"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
