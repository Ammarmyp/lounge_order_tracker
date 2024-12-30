import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:paamy_order_tracker/core/utils/helper.dart';

class CafeListController extends GetxController {
  var cafes = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCafes();
  }

  void fetchCafes() async {
    try {
      isLoading(true);
      final snapshot =
          await FirebaseFirestore.instance.collection("cafes").get();
      cafes.value = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      showSnackbar("Error", "Failed to fetch cafes: $e");
    } finally {
      isLoading(false);
    }
  }
}
