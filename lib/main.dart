import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/features/authentication/data/repositories/firebase_auth_repository.dart';
import 'package:paamy_order_tracker/features/authentication/data/sources/firebase_auth_source.dart';
import 'package:paamy_order_tracker/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/controllers/auth_controller.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:paamy_order_tracker/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Get.put(FirebaseAuthRepository(FirebaseAuthSource()));

  Get.put(SignUpUsecase(Get.find<FirebaseAuthRepository>()));

  Get.put(AuthController(Get.find<SignUpUsecase>()));

  runApp(const MyApp());
}
