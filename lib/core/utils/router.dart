import 'package:go_router/go_router.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/sign_in_screen.dart';
import 'package:paamy_order_tracker/features/authentication/presentation/sign_up.dart';
import 'package:paamy_order_tracker/features/home/presentation/home_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: "/signIn",
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: "/signUp",
        builder: (context, state) => const SignUp(),
      ),
    ],
  );
}
