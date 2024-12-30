import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void handleSubmit({
  required Map<String, dynamic> cafe,
  required TextEditingController tableNumberController,
  required TextEditingController orderNumberController,
}) async {
  final tableNumber = tableNumberController.text.trim();
  final orderNumber = orderNumberController.text.trim();

  if (tableNumber.isEmpty || orderNumber.isEmpty) {
    Get.snackbar("Error", "Please fill in all fields.",
        backgroundColor: Colors.white);
    return;
  }

  final newItem = {
    "cafeName": cafe['cafeName'],
    "tableNumber": tableNumber,
    "orderNumber": orderNumber,
  };

  try {
    final cafeEmail = cafe["email"];
    // print("Cafe email: $cafeEmail");

    // Query Firestore to find the document by email
    final querySnapshot = await FirebaseFirestore.instance
        .collection("cafes")
        .where("email", isEqualTo: cafeEmail)
        .get();

    if (querySnapshot.docs.isEmpty) {
      print("No document found for email: $cafeEmail");
      Get.snackbar("Error", "Cafe does not exist in the database.",
          backgroundColor: Colors.white);
      return;
    }

    // Get the document reference
    final cafeDoc = querySnapshot.docs.first.reference;

    // print("New item being added: $newItem");

    // Update Firestore
    await cafeDoc.update({
      "orders": FieldValue.arrayUnion([newItem]),
    });

    Get.snackbar("Success", "Item created successfully!",
        backgroundColor: Colors.white);
  } catch (e) {
    // print("Submit Error: $e");
    Get.snackbar("Error", "Failed to send order to the cafe!!!",
        backgroundColor: Colors.white);
  }
}
