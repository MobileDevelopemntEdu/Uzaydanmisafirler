import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Hospitalmodel.dart';


class UserServices {

  final  CollectionReference _userDB = FirebaseFirestore.instance.collection('hospital');

  Future<void> addHospital(HospitalData data) async {
    try {
      return await _userDB.doc().set(data.toJson());
    } catch(e) {
      print(e.toString());
    }
  }

  Future<HospitalData?> getHospital(String uid) async {
    try {
      DocumentSnapshot userData = await _userDB.doc(uid).get();
      return HospitalData.fromJson(userData.data() as Map<String, dynamic>);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }
 
  Future<List<HospitalData>> getAllHospital() async {
    try {
      QuerySnapshot usersData = await _userDB.get();
      return usersData.docs.map((e) => HospitalData.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch(e) {
      print(e.toString());
    }
    return [];
  }
}