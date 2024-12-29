import 'package:firebase_core/firebase_core.dart';
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
    } catch (e) {
      String errorMessage = e.toString();
      if (e is FirebaseException) {
        Get.snackbar("Error", e.message ?? "An error has occured",
            snackPosition: SnackPosition.BOTTOM);
      }
      Get.snackbar("Error", errorMessage, snackPosition: SnackPosition.BOTTOM);
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
