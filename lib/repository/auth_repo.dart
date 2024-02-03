
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../services/auth_services.dart';
import '../services/user_services.dart';


class AuthenticationRepository {

  // AuthServices sınıfının bir örneği.
  final AuthServices _authServices = AuthServices();

  // UserServices sınıfının bir örneği.
  final UserServices _userServices = UserServices();


  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _authServices.signInWithEmailAndPassword(email, password);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }


  Future<User?> registerWithEmailAndPassword(String name, String email, String password) async {
    return await _authServices.registerWithEmailAndPassword(email, password).then((value) {
      if (value != null) {
        var model = UserModel(uid: value.uid, name: name, email: email);
        _userServices.createUser(model);
        return value;
      } else {
        return null;
      }
    });
  }


  Future<void> signOut() async {
    try {
      return await _authServices.signOut();
    } catch(e) {
      print(e.toString());
    }
  }



  Future<User?> getCurrentUser() async {
    try {
      return await _authServices.getCurrentUser();
    } catch(e) {
      print(e.toString());
    }
    return null;
  }
}