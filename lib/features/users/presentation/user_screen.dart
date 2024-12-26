import 'package:flutter/material.dart';
import 'package:paamy_order_tracker/components/my_button.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/components/my_textField.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

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
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: MyTextField(
                      controller: orderNumberController,
                      labelText: "Enter Order Number",
                      hintText: "34",
                      obscureText: false,
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: IconButton(
                      alignment: Alignment.center,
                      iconSize: 30,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.qr_code_scanner,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
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
