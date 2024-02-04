import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';


class UserServices {

  final  CollectionReference _userDB = FirebaseFirestore.instance.collection('users');

  Future<void> createUser(UserModel model) async {
    try {
      return await _userDB.doc(model.uid).set(model.toJson());
    } catch(e) {
      print(e.toString());
    }
  }

  Future<UserModel?> getUser(String uid) async {
    try {
      DocumentSnapshot userData = await _userDB.doc(uid).get();
      return UserModel.fromJson(userData.data() as Map<String, dynamic>);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }
 
  Future<List<UserModel>> getAllUsers() async {
    try {
      QuerySnapshot usersData = await _userDB.get();
      return usersData.docs.map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch(e) {
      print(e.toString());
    }
    return [];
  }

  Future<void> updateUser(UserModel model) async {
    try {
      return await _userDB.doc(model.uid).update(model.toJson());
    } catch(e) {
      print(e.toString());
    }
  }
}