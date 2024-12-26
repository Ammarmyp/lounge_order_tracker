import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoungeChoice extends StatelessWidget {
  const LoungeChoice({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> lounges = [
      {"Name": "Central"},
      {"Name": "KK Yellow"},
      {"Name": "KK Green"},
      {"Name": "Workers"},
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Choose a Lounge",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: lounges.length,
                itemBuilder: (context, index) {
                  final lounge = lounges[index];
                  return GestureDetector(
                    onTap: () => context.push("/user_form"),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.5),
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        lounge["Name"]!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
