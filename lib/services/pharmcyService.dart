import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pharmcymodel.dart';


class UserServices {

  final  CollectionReference _userDB = FirebaseFirestore.instance.collection('pharmcy');

  Future<void> AddPharmcy(Eczanedata data) async {
    try {
      return await _userDB.doc().set(data.toJson());
    } catch(e) {
      print(e.toString());
    }
  }

  Future<Eczanedata?> getpharmcy(String uid) async {
    try {
      DocumentSnapshot userData = await _userDB.doc(uid).get();
      return Eczanedata.fromJson(userData.data() as Map<String, dynamic>);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<Eczanedata>> getAllpharmcy() async {
    try {
      QuerySnapshot usersData = await _userDB.get();
      return usersData.docs.map((e) => Eczanedata.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch(e) {
      print(e.toString());
    }
    return [];
  }
}