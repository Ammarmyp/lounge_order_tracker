import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/core/utils/helper.dart';
import 'package:paamy_order_tracker/features/authentication/domain/usecases/sign_up_usecase.dart';
import 'package:paamy_order_tracker/features/orders/domain/cafe_data_repository.dart';
import 'package:paamy_order_tracker/features/orders/presentation/controller/cafe_data_controller.dart';

class AuthController extends GetxController {
  final SignUpUsecase signUpUseCase;

  AuthController(this.signUpUseCase);

  final isLoading = false.obs;
  final Rxn<User> currentUser = Rxn<User>();
  // final CafeDataController cafeDataController = Get.find();

  @override
  void onInit() {
    super.onInit();
    // Get.lazyPut<CafeDataController>(
    //     () => CafeDataController(Get.find<CafeDataRepository>()));
    currentUser.bindStream(FirebaseAuth.instance.authStateChanges());
  }

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
        currentUser.value = FirebaseAuth.instance.currentUser;

        //* add cafe to firestore
        if (currentUser.value == null) {
          showSnackbar("Error", "No authenticated user found");
          return;
        }
        final uid = currentUser.value!.uid;
        try {
          await FirebaseFirestore.instance.collection("cafes").doc(uid).set({
            "email": email,
            "phone": phone,
            "cafeName": cafeName,
            "isActive": false,
            "role": "admin",
            "orders": [],
            "createdAt": FieldValue.serverTimestamp(),
          });
          showSnackbar("Success", "User created successfully");
          navigateTo("/orderList");
        } catch (e) {
          showSnackbar("Error", "Failed to save user details: $e");
        }
      } else {
        showSnackbar("Error", "Failed to register user");
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
        currentUser.value = userCredential.user;

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

  //*logout

  Future<void> logout() async {
    isLoading.value = true;

    try {
      await FirebaseAuth.instance.signOut();
      // final CafeDataController cafeDataController =
      //     Get.find<CafeDataController>();
      // // cafeDataController.clearUserData();
      currentUser.value = null;
      showSnackbar("Success", "Signed Out Successfully");
      Get.offAllNamed("/");
    } catch (e) {
      showSnackbar("Error", "Sorry can't log out");
    } finally {
      isLoading.value = false;
    }
  }
}
