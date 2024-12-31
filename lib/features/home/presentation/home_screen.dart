import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:paamy_order_tracker/features/home/presentation/components/about_project.dart';
import 'package:paamy_order_tracker/features/home/presentation/components/select_icon.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthController authController = Get.find();

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
        appBar: AppBar(
          backgroundColor: const Color(0xFF1E1E1E),
          elevation: 0,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Open the drawer when the menu button is pressed
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: const AboutProject(),
        body: Container(
          decoration: const BoxDecoration(
            gradient: backgroundGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                      onTap: () {
                        final user = authController.currentUser.value;
                        if (user != null) {
                          Get.toNamed("/orderList");
                        } else {
                          Get.toNamed("/signIn");
                        }
                      }),
                ],
              ),
              const SizedBox(
                height: 10,
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
