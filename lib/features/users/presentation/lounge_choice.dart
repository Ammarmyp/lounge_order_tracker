import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/features/users/presentation/controller/cafe_list_controller.dart';

class LoungeChoice extends StatelessWidget {
  const LoungeChoice({super.key});

  @override
  Widget build(BuildContext context) {
    final cafeListController = Get.put(CafeListController());

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hey There👋",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    "Where are you dining today?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ],
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
                    Obx(() {
                      if (cafeListController.isLoading.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (cafeListController.cafes.isEmpty) {
                        return const Center(
                          child: Text(
                            "Oops!! No Registered Cafes are available currently!",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        );
                      }

                      return Container(
                          height: MediaQuery.of(context).size.height *
                              0.6, // Adjust the height as needed
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: cafeListController.cafes.length,
                            itemBuilder: (context, index) {
                              final cafe = cafeListController.cafes[index];
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
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 5,
                                            offset: const Offset(0, 2))
                                      ]),
                                  child: Row(
                                    children: [
                                      // Icon(
                                      //   cafe["Icon"],
                                      //   size: 30,
                                      //   color: cafe["Name"] == "KK Yellow"
                                      //       ? Colors.yellow[400]
                                      //       : cafe["Name"] == "KK Green"
                                      //           ? Colors.green
                                      //           : Colors.black,
                                      // ),
                                      const SizedBox(width: 10),
                                      Text(
                                        cafe["cafeName"],
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
                          ));
                    }),
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
