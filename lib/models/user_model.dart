class UserModel {

  String? uid;

  String? name;

  String? surname;

  String? email;

  String? telno;

  String? tcno;

  String? sifre;



  UserModel({required this.uid, required this.name, required this.email,this.telno,this.surname, this.tcno});


  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    surname = json['surname'] ?? '';
    email = json['email'] ;
    telno = json['phone'] ?? '';
    tcno  =json['tcno'] ?? '';
    sifre = json['sifre'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email ?? '' ,
      'telno': telno?? '',
      'surname': surname ?? '',
      'tcno': tcno ?? '',
      'sifre': sifre?? '',
    };
  }
}
