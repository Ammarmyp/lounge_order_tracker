import 'package:cloud_firestore/cloud_firestore.dart';

class Firebasecafedatasource {
  final FirebaseFirestore firestore;

  Firebasecafedatasource(this.firestore);

  Future<Map<String, dynamic>?> fetchCafeData(String uid) async {
    final doc = await firestore.collection("cafes").doc(uid).get();
    return doc.exists ? doc.data() : null;
  }
}
