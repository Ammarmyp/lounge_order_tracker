import 'package:flutter/material.dart';
import 'package:paamy_order_tracker/components/my_button.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/components/my_textField.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final tableNumberController = TextEditingController();
  final orderNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  // Heading
                  const Text(
                    "Order & Table Tracking",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Table Number Input with QR Code Button
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: MyTextField(
                          controller: tableNumberController,
                          labelText: "Enter Table Number",
                          hintText: "34",
                          obscureText: false,
                          textColor: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.qr_code_scanner,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Order Number Input
                  MyTextField(
                    controller: orderNumberController,
                    labelText: "Order Number",
                    hintText: "33",
                    obscureText: false,
                    textColor: Colors.black,
                  ),
                  const SizedBox(height: 40),

                  // Submit Button
                  MyButton(onTap: () {}, label: "Submit"),

                  const SizedBox(height: 50),

                  // Footer text
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
