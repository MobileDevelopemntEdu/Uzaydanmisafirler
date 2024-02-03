import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';


class UserServices {

  // Firebase kullanıcı örneği koleksiyon referansı
  final  CollectionReference _userDB = FirebaseFirestore.instance.collection('users');

  /// Yeni bir kullanıcı oluşturur.
  /// `UserModel` alır ve bu modeli JSON'a dönüştürerek Firestore'a kaydeder.
  /// Hata durumunda, hatayı yazdırır.
  Future<void> createUser(UserModel model) async {
    try {
      return await _userDB.doc(model.uid).set(model.toJson());
    } catch(e) {
      print(e.toString());
    }
  }

  /// Belirli bir kullanıcının verilerini alır.
  /// Kullanıcının benzersiz kimliğini (uid) alır ve Firestore'dan kullanıcının verilerini alır.
  /// Hata durumunda, hatayı yazdırır ve null döndürür.
  Future<UserModel?> getUser(String uid) async {
    try {
      DocumentSnapshot userData = await _userDB.doc(uid).get();
      return UserModel.fromJson(userData.data() as Map<String, dynamic>);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  /// Tüm kullanıcıların verilerini alır.
  /// Firestore'dan tüm kullanıcıların verilerini alır ve bir `UserModel` listesi döndürür.
  /// Hata durumunda, hatayı yazdırır ve boş bir liste döndürür.
  Future<List<UserModel>> getAllUsers() async {
    try {
      QuerySnapshot usersData = await _userDB.get();
      return usersData.docs.map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch(e) {
      print(e.toString());
    }
    return [];
  }

  /// Kullanıcı verilerini günceller.
  /// `UserModel` alır ve bu modeli JSON'a dönüştürerek Firestore'daki ilgili kullanıcının verilerini günceller.
  /// Hata durumunda, hatayı yazdırır.
  Future<void> updateUser(UserModel model) async {
    try {
      return await _userDB.doc(model.uid).update(model.toJson());
    } catch(e) {
      print(e.toString());
    }
  }
}