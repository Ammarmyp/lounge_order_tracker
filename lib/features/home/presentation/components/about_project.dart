import 'package:flutter/material.dart';

class AboutProject extends StatelessWidget {
  const AboutProject({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade200, Colors.green.shade50],
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
              ),
            ),
            child: const Center(
              child: Text(
                "Order & Table Tracking App",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "Problem set",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                // Description
                const Text(
                  "     It's a common sight in campus lounges to hear waiters shouting order numbers until someone claims their food. This process can be tiring and time-consuming. Let’s be honest, the constant shouting of random numbers can be disruptive, especially when you're relaxing with a cup of coffee. Our app allows you to enter your order name and table number, so the waiter can deliver your food directly to your table once it's ready—making the process smoother and more enjoyable.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400, //
                    height: 1.5,
                  ),
                ),

                const SizedBox(height: 20),
                // Divider for a sleek touch
                Container(
                  height: 2,
                  color: Colors.white30,
                  width: double.infinity,
                ),
                const SizedBox(height: 20),
                // Icon for visual engagement
                const Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      // color: Colors.white,
                      size: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Effortless tracking at your fingertips",
                      style: TextStyle(
                        fontSize: 16,
                        // color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
