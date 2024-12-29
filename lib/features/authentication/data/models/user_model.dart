class UserModel {
  final String id;
  // final String email;
  final String phone;
  final String cafeName;

  UserModel(
      {required this.id,
      // required this.email,
      required this.phone,
      required this.cafeName});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      // 'email': email,
      'phone': phone,
      'cafeName': cafeName,
    };
  }
}
