import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pharmcymodel.dart';


class PharmcyServices {

  final  CollectionReference _userDB = FirebaseFirestore.instance.collection('pharmcy');

  Future<void> AddPharmcy(EczaneData data) async {
    try {
      return await _userDB.doc().set(data.toJson());
    } catch(e) {
      print(e.toString());
    }
  }

  Future<EczaneData?> getpharmcy(String uid) async {
    try {
      DocumentSnapshot userData = await _userDB.doc(uid).get();
      return EczaneData.fromJson(userData.data() as Map<String, dynamic>);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  Future<List<EczaneData>> getAllpharmcy() async {
    try {
      QuerySnapshot usersData = await _userDB.get();
      return usersData.docs.map((e) => EczaneData.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch(e) {
      print(e.toString());
    }
    return [];
  }
}