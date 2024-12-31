import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/components/my_button.dart';
import 'package:paamy_order_tracker/components/my_textField.dart';
import 'package:paamy_order_tracker/features/users/domain/submission_handler.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final tableNumberController = TextEditingController();
  final orderNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final selectedCafe = Get.arguments;

    const primaryColor = Color(0xFF4A90E2); // Primary color
    const backgroundGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF121212), // Dark background
        Color.fromARGB(220, 30, 30, 30),
      ],
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: backgroundGradient,
          ),
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),

                  // Heading
                  Text(
                    "Selected Lounge: ${selectedCafe['cafeName']}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Table Number Input (Updated)
                  MyTextField(
                    controller: tableNumberController,
                    labelText: "Enter Table Number",
                    hintText: "34",
                    obscureText: false,
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 20),

                  // Order Number Input (Updated)
                  MyTextField(
                    controller: orderNumberController,
                    labelText: "Order Number",
                    hintText: "33",
                    obscureText: false,
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 40),

                  // Submit Button (Updated)
                  MyButton(
                    onTap: () => handleSubmit(
                      cafe: selectedCafe,
                      tableNumberController: tableNumberController,
                      orderNumberController: orderNumberController,
                    ),
                    label: "Submit",
                  ),

                  const SizedBox(height: 50),

                  // Footer text (Updated)
                  const Text(
                    "Track your orders and tables with ease.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
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
