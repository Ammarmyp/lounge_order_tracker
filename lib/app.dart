import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/core/utils/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppRouter.routes,
      initialRoute: "/",
    );
  }
}
