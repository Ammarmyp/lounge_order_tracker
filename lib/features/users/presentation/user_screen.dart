import 'package:flutter/material.dart';
import 'package:paamy_order_tracker/components/my_button.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/components/my_textField.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final tableNumberController = TextEditingController();
  final orderNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: MyTextField(
                      controller: tableNumberController,
                      labelText: "Enter Table Number",
                      hintText: "34",
                      obscureText: false,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.grey.shade100,
                          // borderRadius: BorderRadius.circular(10),
                          ),
                      child: IconButton(
                        alignment: Alignment.center,
                        iconSize: 30,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.qr_code_scanner,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              MyTextField(
                  controller: orderNumberController,
                  labelText: "Order Number",
                  hintText: "33",
                  obscureText: false),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(onTap: () {}, label: "Submit"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
