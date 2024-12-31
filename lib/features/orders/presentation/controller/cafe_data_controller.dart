import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CafeDataController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var orders = <Map<String, dynamic>>[].obs;
  var filteredOrders = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var email = "".obs;

  Future<void> fetchOrders(String cafeEmail) async {
    this.email.value = cafeEmail;
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
          filteredOrders.assignAll(orders);
        } else {
          orders.clear();
          filteredOrders.clear();
        }
      } else {
        orders.clear();
        filteredOrders.clear();
        Get.snackbar("Error", "Cafe not found!");
      }
    } catch (e) {
      // print("Error fetching orders: $e");
      Get.snackbar("Error", "Failed to fetch orders!");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteOrder(String orderNumber, String email) async {
    try {
      final snapshot = await firestore
          .collection("cafes")
          .where("email", isEqualTo: email)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final doc = snapshot.docs.first;
        final docRef = firestore.collection("cafes").doc(doc.id);
        final currentOrders =
            List<Map<String, dynamic>>.from(doc.data()["orders"]);

        //*delete using that matchs order number
        final updatedOrders = currentOrders.where((order) {
          return order["orderNumber"] != orderNumber;
        }).toList();

        await docRef.update({"orders": updatedOrders});
        orders.value = updatedOrders;

        Get.snackbar("Success", "Order deleted successfully.");
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to delete order: $e");
    }
  }

  //*on page search

  void searchOrders(String orderNumber) {
    if (orderNumber.isEmpty) {
      // If search query is empty, reset to all orders
      filteredOrders.assignAll(orders);
    } else {
      // Filter orders based on the orderNumber
      filteredOrders.assignAll(
        orders.where((order) => order["orderNumber"]
            .toString()
            .toLowerCase()
            .contains(orderNumber.toLowerCase())),
      );
    }
  }
}
