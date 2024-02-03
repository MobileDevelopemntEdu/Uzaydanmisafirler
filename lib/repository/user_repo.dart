import '../models/user_model.dart';
import '../services/user_services.dart';


class UserRepository {

  // UserServices sınıfının bir örneği.
  final UserServices _userServices = UserServices();

  /// Belirli bir kullanıcının verilerini almak için metod.
  /// Kullanıcı verilerini almak için `UserServices`'ten `getUser` metodunu kullanır.
  /// Veri alma işlemi başarılı olursa, bir `UserModel` döndürür.
  /// Veri alma işlemi başarısız olursa, bir hata mesajı yazdırır ve null döndürür.
  Future<UserModel?> getUser(String uid) async {
    try {
      return await _userServices.getUser(uid);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

}