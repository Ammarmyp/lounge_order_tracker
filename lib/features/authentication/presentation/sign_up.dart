import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:paamy_order_tracker/components/my_button.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/components/my_textField.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/controllers/auth_controller.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final cafeNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void onTap() {
    if (cafeNameController.text.trim().isEmpty ||
        phoneNumberController.text.trim().isEmpty ||
        emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        confirmPasswordController.text.trim().isEmpty) {
      Get.snackbar("Error", "All fields are required",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    if (!GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar("Error", "Invalid email",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final controller = Get.find<AuthController>();
    controller.signUp(
      emailController.text.trim(),
      passwordController.text.trim(),
      cafeNameController.text.trim(),
      phoneNumberController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // TextButton(
                  //   onPressed: () => context.go("/"),
                  //   child: const Text("home"),
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Icon(
                    Icons.table_restaurant_rounded,
                    size: 130,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Welcome!!",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  MyTextField(
                    controller: cafeNameController,
                    labelText: "Cafe Name",
                    hintText: "Central",
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  MyTextField(
                    controller: emailController,
                    labelText: "Email",
                    hintText: "ammar@gmail.com",
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  MyTextField(
                    controller: phoneNumberController,
                    labelText: "Phone",
                    hintText: "+251***",
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  MyTextField(
                    controller: passwordController,
                    labelText: "Password",
                    hintText: "********",
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  MyTextField(
                    controller: confirmPasswordController,
                    labelText: "Confirm Password",
                    hintText: "********",
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  MyButton(
                    onTap: onTap,
                    label: "Sign Up",
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Registered?"),
                      TextButton(
                        onPressed: () => Get.toNamed("/signIn"),
                        child: const Text(
                          "Sign In",
                        ),
                      )
                    ],
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
