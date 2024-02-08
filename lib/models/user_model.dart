class UserModel {

  String? uid;

  String? name;

  String? surname;

  String? email;

  String? telno;

  String? tcno;

  String? password;



  UserModel({required this.uid, required this.name, required this.email, required this.telno, required this.surname, required this.tcno, required this.password});


  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    surname = json['surname'] ?? '';
    email = json['email'] ;
    telno = json['phone'] ?? '';
    tcno  =json['tcno'] ?? '';
    password = json['sifre'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email ?? '' ,
      'telno': telno?? '',
      'surname': surname ?? '',
      'tcno': tcno ?? '',
      'sifre': password?? '',
    };
  }
}
