import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/features/authentication/data/repositories/firebase_auth_repository.dart';
import 'package:paamy_order_tracker/features/authentication/data/sources/firebase_auth_source.dart';
import 'package:paamy_order_tracker/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/controllers/auth_controller.dart';
import 'package:paamy_order_tracker/features/orders/data/Firebase_cafe_data_source.dart';
import 'package:paamy_order_tracker/features/orders/domain/cafe_data_repository.dart';
import 'package:paamy_order_tracker/features/orders/presentation/controller/cafe_data_controller.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:paamy_order_tracker/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //* auth
  Get.put(FirebaseAuthRepository(FirebaseAuthSource()));

  Get.put(SignUpUsecase(Get.find<FirebaseAuthRepository>()));

  Get.put(AuthController(Get.find<SignUpUsecase>()));

  //* cafe

  Get.put(Firebasecafedatasource(FirebaseFirestore.instance));

  Get.put(CafeDataRepository(Get.find<Firebasecafedatasource>()));

  Get.put(CafeDataController());

  runApp(const MyApp());
}
