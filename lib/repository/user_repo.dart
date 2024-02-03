import '../models/user_model.dart';
import '../services/user_services.dart';


class UserRepository {

  // UserServices sınıfının bir örneği.
  final UserServices _userServices = UserServices();


  Future<UserModel?> getUser(String uid) async {
    try {
      return await _userServices.getUser(uid);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

}