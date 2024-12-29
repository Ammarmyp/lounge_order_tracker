import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoungeChoice extends StatelessWidget {
  const LoungeChoice({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> lounges = [
      {"Name": "Central", "Icon": Icons.cabin_outlined},
      {"Name": "KK Yellow", "Icon": Icons.cake},
      {"Name": "KK Green", "Icon": Icons.cake},
      {"Name": "Workers", "Icon": Icons.work_outline_sharp},
      {"Name": "Teachers", "Icon": Icons.perm_contact_cal_outlined},
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Hey There👋",
                style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Choose a Lounge",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: MediaQuery.of(context).size.height *
                          0.6, // Adjust the height as needed
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: lounges.length,
                        itemBuilder: (context, index) {
                          final lounge = lounges[index];
                          return GestureDetector(
                            onTap: () => Get.toNamed("/user_form"),
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  // border:
                                  // Border.all(color: Colors.white, width: 1.5),
                                  color: Colors.green.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 2))
                                  ]),
                              child: Row(
                                children: [
                                  Icon(
                                    lounge["Icon"],
                                    size: 30,
                                    color: lounge["Name"] == "KK Yellow"
                                        ? Colors.yellow[400]
                                        : lounge["Name"] == "KK Green"
                                            ? Colors.green
                                            : Colors.black,
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    lounge["Name"]!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
