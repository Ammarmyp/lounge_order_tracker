import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/sign_in_screen.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/sign_up.dart';
import 'package:paamy_order_tracker/features/home/presentation/home_screen.dart';
import 'package:paamy_order_tracker/features/orders/presentation/order_list.dart';
import 'package:paamy_order_tracker/features/users/presentation/lounge_choice.dart';
import 'package:paamy_order_tracker/features/users/presentation/user_screen.dart';

class AppRouter {
  static final List<GetPage> routes = [
    GetPage(
      name: "/",
      page: () => HomeScreen(),
    ),
    GetPage(
      name: "/signIn",
      page: () => SignInScreen(),
    ),
    GetPage(
      name: "/signUp",
      page: () => SignUp(),
    ),
    GetPage(
      name: "/user",
      page: () => LoungeChoice(),
    ),
    GetPage(
      name: "/orderList",
      page: () => OrderListScreen(),
    ),
    GetPage(
      name: "/user_form",
      page: () => UserScreen(),
    ),
  ];
}
