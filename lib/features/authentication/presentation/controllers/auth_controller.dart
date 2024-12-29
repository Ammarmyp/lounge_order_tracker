import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/features/authentication/domain/usecases/sign_up_usecase.dart';

class AuthController extends GetxController {
  final SignUpUsecase signUpUseCase;

  AuthController(this.signUpUseCase);

  final isLoading = false.obs;

  Future<void> signUp(
    String email,
    String password,
    String cafeName,
    String phone,
  ) async {
    isLoading.value = true;

    try {
      final user =
          await signUpUseCase.execute(email, password, cafeName, phone);
      if (user != null) {
        // ** success logic here
        Get.snackbar("Success", "User created successfully");
        Get.offAllNamed("/orderList");
      } else {
        Get.snackbar("Error", "Failed to register user");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar(
            "Error", "The email address is already in use by another account",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar("Error", e.message ?? "An error has occurred",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      String errorMessage = e.toString();
      Get.snackbar("Error", errorMessage, snackPosition: SnackPosition.BOTTOM);
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
