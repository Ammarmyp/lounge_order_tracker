import 'package:paamy_order_tracker/features/authentication/data/models/user_model.dart';

abstract class CafeDataRepositoryInterface {
  Future<UserModel?> getUserData(String uid);
}
