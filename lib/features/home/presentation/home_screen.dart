import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:paamy_order_tracker/features/home/presentation/components/select_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor =
        Color.fromARGB(255, 74, 226, 94); // Subtle primary color
    const backgroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF1E1E1E),
        Color.fromARGB(209, 18, 18, 18),
      ],
    );

    return SafeArea(
      child: Scaffold(
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
                  Icons.table_restaurant_outlined,
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
                    onTap: () => Get.toNamed("/user"),
                  ),
                  const SizedBox(width: 30),
                  ModeBtn(
                    icon: Icons.restaurant_rounded,
                    label: "Owner",
                    primaryColor: primaryColor,
                    onTap: () => Get.toNamed("/signIn"),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextButton(
                      onPressed: () => Get.toNamed("/superAdmin"),
                      child: const Text(
                        "Super Admin",
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
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
      ),
    );
  }
}
