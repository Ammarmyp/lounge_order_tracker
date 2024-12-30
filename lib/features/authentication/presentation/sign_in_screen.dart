import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/components/my_button.dart';
import 'package:paamy_order_tracker/components/my_textField.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/controllers/auth_controller.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void onTap() {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      Get.snackbar("Error", "Please fill the necessary fields");
      return;
    }

    if (!GetUtils.isEmail(emailController.text.trim())) {
      Get.snackbar("Error", "Invalid email ");
      return;
    }

    final controller = Get.find<AuthController>();

    controller.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
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
                    height: 25,
                  ),
                  const Icon(
                    Icons.table_restaurant_rounded,
                    size: 150,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  const SizedBox(
                    height: 7,
                  ),
                  MyTextField(
                    controller: emailController,
                    labelText: "email",
                    hintText: "ammar@gmail.com",
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
                    height: 15,
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? const CircularProgressIndicator()
                        : MyButton(
                            onTap: onTap,
                            label: "Login",
                          ),
                  ),

                  const SizedBox(
                    height: 30,
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
                      const Text("Try for you restuarant"),
                      TextButton(
                        onPressed: () => Get.toNamed("/signUp"),
                        child: const Text(
                          "Register here",
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
