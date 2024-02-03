class Pharmcy {
  String? status;
  String? message;
  int? rowCount;
  int? systemTime;
  List<Eczanedata>? data;

  Pharmcy(
      {this.status, this.message, this.rowCount, this.systemTime, this.data});

  Pharmcy.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    rowCount = json['rowCount'];
    systemTime = json['systemTime'];
    if (json['data'] != null) {
      data = <Eczanedata>[];
      json['data'].forEach((v) {
        data!.add(new Eczanedata.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['rowCount'] = this.rowCount;
    data['systemTime'] = this.systemTime;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Eczanedata {
  String? eczaneAdi;
  String? adresi;
  String? semt;
  String? yolTarifi;
  String? telefon;
  String? telefon2;
  String? sehir;
  String? ilce;
  double? latitude;
  double? longitude;

  Eczanedata(
      {this.eczaneAdi,
        this.adresi,
        this.semt,
        this.yolTarifi,
        this.telefon,
        this.telefon2,
        this.sehir,
        this.ilce,
        this.latitude,
        this.longitude});

  Eczanedata.fromJson(Map<String, dynamic> json) {
    eczaneAdi = json['EczaneAdi'];
    adresi = json['Adresi'];
    semt = json['Semt'];
    yolTarifi = json['YolTarifi'];
    telefon = json['Telefon'];
    telefon2 = json['Telefon2'];
    sehir = json['Sehir'];
    ilce = json['ilce'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['EczaneAdi'] = this.eczaneAdi;
    data['Adresi'] = this.adresi;
    data['Semt'] = this.semt;
    data['YolTarifi'] = this.yolTarifi;
    data['Telefon'] = this.telefon;
    data['Telefon2'] = this.telefon2;
    data['Sehir'] = this.sehir;
    data['ilce'] = this.ilce;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}