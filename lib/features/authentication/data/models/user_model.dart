class UserModel {
  final String id;
  final String email;
  final String phone;
  final String cafeName;
  final List<Map<String, dynamic>> orders;

  UserModel({
    required this.id,
    required this.email,
    required this.phone,
    required this.cafeName,
    this.orders = const [],
  });

  factory UserModel.fromFirestore(
      Map<String, dynamic> data, String documentId) {
    return UserModel(
      id: documentId,
      email: data["email"],
      phone: data["phone"],
      cafeName: data["cafeName"],
      orders: List<Map<String, dynamic>>.from(data["orders"] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'cafeName': cafeName,
      "orders": orders,
    };
  }
}
