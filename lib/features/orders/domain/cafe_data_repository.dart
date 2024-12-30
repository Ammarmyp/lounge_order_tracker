import 'package:paamy_order_tracker/core/utils/helper.dart';
import 'package:paamy_order_tracker/features/authentication/data/models/user_model.dart';
import 'package:paamy_order_tracker/features/orders/data/Firebase_cafe_data_source.dart';
import 'package:paamy_order_tracker/features/orders/domain/order_Repository_interface.dart';

class CafeDataRepository implements CafeDataRepositoryInterface {
  final Firebasecafedatasource dataSource;
  CafeDataRepository(this.dataSource);

  @override
  Future<UserModel?> getUserData(String uid) async {
    try {
      final cafeData = await dataSource.fetchCafeData(uid);
      if (cafeData != null) {
        return UserModel(
            id: uid,
            phone: cafeData["phone"],
            cafeName: cafeData["cafeName"],
            email: cafeData["email"]);
      }
      return null;
    } catch (e) {
      showSnackbar("Error", "Failed to fetch cafe Data: $e");
    }
    return null;
  }
}
