import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:paamy_order_tracker/features/home/presentation/components/select_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF4A90E2); // Subtle primary color
    const backgroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF1E1E1E),
        Color(0xFF121212),
      ],
    );

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: backgroundGradient,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // Logo placeholder
            const CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: Icon(
                Icons.track_changes,
                size: 50,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Welcome To",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Order & Table Tracker",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            // Decorative divider
            Container(
              height: 3,
              width: 100,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ModeBtn(
                  icon: Icons.person,
                  label: "User",
                  primaryColor: primaryColor,
                  onTap: () => context.push("/user"),
                ),
                const SizedBox(width: 30),
                ModeBtn(
                  icon: Icons.restaurant_rounded,
                  label: "Owner",
                  primaryColor: primaryColor,
                  onTap: () => context.push("/signIn"),
                ),
              ],
            ),
            const Spacer(),
            // Footer text
            const Text(
              "Effortless Tracking at Your Fingertips",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
