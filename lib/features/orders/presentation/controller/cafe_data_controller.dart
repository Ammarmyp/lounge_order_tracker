import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CafeDataController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Observable list to hold orders
  var orders = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;

  // Method to fetch orders for a cafe by email
  Future<void> fetchOrders(String cafeEmail) async {
    isLoading.value = true;
    try {
      final querySnapshot = await firestore
          .collection('cafes')
          .where('email', isEqualTo: cafeEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        final cafeData = querySnapshot.docs.first.data();
        if (cafeData.containsKey('orders')) {
          orders.value = List<Map<String, dynamic>>.from(cafeData['orders']);
        } else {
          orders.clear();
        }
      } else {
        orders.clear();
        Get.snackbar("Error", "Cafe not found!");
      }
    } catch (e) {
      // print("Error fetching orders: $e");
      Get.snackbar("Error", "Failed to fetch orders!");
    } finally {
      isLoading.value = false;
    }
  }
}
