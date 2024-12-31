import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final Color textColor; // New property for text color customization

  const MyTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    this.textColor = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label styling
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight:
                FontWeight.w600, // Slightly lighter for better readability
          ),
        ),
        const SizedBox(height: 8),

        // TextField styling
        TextField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(color: textColor), // Use custom text color
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            ),
            border: _buildBorder(),
            enabledBorder: _buildBorder(),
            focusedBorder: _buildBorder(
                borderColor: const Color.fromARGB(
                    255, 74, 226, 94)), // Focused border color
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 15), // Comfortable padding
          ),
        ),
      ],
    );
  }

  // Helper function for borders to reduce code duplication
  OutlineInputBorder _buildBorder(
      {Color borderColor = const Color(0xFFC8E6C9)}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: borderColor, width: 1.5),
    );
  }
}
