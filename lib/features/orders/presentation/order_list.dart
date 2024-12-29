import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/components/my_button.dart';
import 'package:paamy_order_tracker/components/order_tile.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/components/my_textField.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/controllers/auth_controller.dart';

class OrderListScreen extends StatelessWidget {
  OrderListScreen({super.key});

  final orderNumberController = TextEditingController();

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, double>> orders = [
      {"orderNum": 1, "tableNum": 53},
      {"orderNum": 2, "tableNum": 54},
      {"orderNum": 3, "tableNum": 55},
      {"orderNum": 1, "tableNum": 53},
      {"orderNum": 2, "tableNum": 54},
      {"orderNum": 3, "tableNum": 55},
      {"orderNum": 1, "tableNum": 53},
      {"orderNum": 2, "tableNum": 54},
      {"orderNum": 3, "tableNum": 55},
      {"orderNum": 1, "tableNum": 53},
      {"orderNum": 2, "tableNum": 54},
      {"orderNum": 3, "tableNum": 55},
    ];

    final user = FirebaseAuth.instance.currentUser;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.only(
            bottom: 15,
            left: 15,
            right: 15,
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.grey.shade400, Colors.white],
                      begin: AlignmentDirectional.topCenter,
                      end: AlignmentDirectional.bottomCenter),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      Text(
                        "Search Order",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: MyTextField(
                            controller: orderNumberController,
                            labelText: "Order Number",
                            hintText: "65",
                            obscureText: false),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MyButton(onTap: () {}, label: "Search")
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Pending Orders",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Obx(() {
              final user = authController.currentUser.value;
              if (user != null) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome, ${user.displayName ?? "user"}! "),
                    Text("Email: ${user.email}"),
                    Text("Phone: ${user.phoneNumber ?? "N/A"}"),
                  ],
                );
              } else {
                return const Center(
                  child: Text("No user informaiton is available"),
                );
              }
            }),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                // shrinkWrap: true,
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: OrderTile(
                      orderNum: order["orderNum"]!,
                      tableNum: order["tableNum"]!,
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
