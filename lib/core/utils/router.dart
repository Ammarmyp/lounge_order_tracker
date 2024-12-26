import 'package:go_router/go_router.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/sign_in_screen.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/sign_up.dart';
import 'package:paamy_order_tracker/features/home/presentation/home_screen.dart';
import 'package:paamy_order_tracker/features/orders/presentation/order_list.dart';
import 'package:paamy_order_tracker/features/users/presentation/user_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: "/signIn",
        builder: (context, state) => SignInScreen(),
      ),
      GoRoute(
        path: "/signUp",
        builder: (context, state) => SignUp(),
      ),
      GoRoute(
        path: "/user",
        builder: (context, state) => UserScreen(),
      ),
      GoRoute(
        path: "/orderList",
        builder: (context, state) => const OrderListScreen(),
      ),
    ],
  );
}
