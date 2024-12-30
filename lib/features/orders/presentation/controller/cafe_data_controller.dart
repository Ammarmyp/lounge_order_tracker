import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/core/utils/helper.dart';
import 'package:paamy_order_tracker/features/authentication/data/models/user_model.dart';
import 'package:paamy_order_tracker/features/orders/domain/order_Repository_interface.dart';

class CafeDataController extends GetxController {
  final CafeDataRepositoryInterface repository;

  CafeDataController(this.repository);

  var currentUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    // fetchUserData();
  }

  void fetchUserData() {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      currentUser.bindStream(
        FirebaseFirestore.instance
            .collection('cafes')
            .doc(uid)
            .snapshots()
            .map((snapshot) {
          if (snapshot.exists && snapshot.data() != null) {
            return UserModel.fromFirestore(snapshot.data()!, snapshot.id);
          } else {
            showSnackbar("Error", "User data does not exist");
            return null;
          }
        }),
      );
    } else {
      showSnackbar("Error", "No user is logged in");
      currentUser.value = null;
    }
  }

  void clearUserData() {
    currentUser.value = null;
    currentUser.close(); // Unbinds any active streams
  }
}
