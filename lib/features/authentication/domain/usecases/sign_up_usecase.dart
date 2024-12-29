import 'package:paamy_order_tracker/features/authentication/data/models/user_model.dart';
import 'package:paamy_order_tracker/features/authentication/data/repositories/firebase_auth_repository.dart';

class SignUpUsecase {
  final FirebaseAuthRepository repository;

  SignUpUsecase(this.repository);

  Future<UserModel?> execute(
      String email, String password, String cafeName, String phone) async {
    try {
      return await repository.signUp(email, password, cafeName, phone);
    } catch (e) {
      rethrow;
    }
  }
}
