import 'package:paamy_order_tracker/features/authentication/data/models/user_model.dart';
import 'package:paamy_order_tracker/features/authentication/data/sources/firebase_auth_source.dart';

class FirebaseAuthRepository {
  final FirebaseAuthSource authSource;

  FirebaseAuthRepository(this.authSource);

  Future<UserModel?> signUp(
    String email,
    String password,
    String cafeName,
    String phone,
  ) async {
    try {
      final user = await authSource.sigUp(email, password);
      if (user != null) {
        return UserModel(
            cafeName: cafeName, id: user.uid, phone: phone, email: email);
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}
