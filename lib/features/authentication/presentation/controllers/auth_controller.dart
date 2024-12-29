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

  Future<void> login(String email, String password) async {
    isLoading.value = true;

    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        Get.snackbar("Success", "Logged in Successfully");
        Get.offAllNamed("/orderList");
      } else {
        Get.snackbar("error", "Login Failed. Please try again");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        Get.snackbar("Error", "Incorrect password");
      } else {
        Get.snackbar("Error", e.message ?? "An error occurred");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
