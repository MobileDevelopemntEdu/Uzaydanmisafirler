class HospitalModel {
  String? status;
  String? message;
  int? rowCount;
  int? systemTime;
  List<HospitalData>? data;

  HospitalModel(
      {this.status, this.message, this.rowCount, this.systemTime, this.data});

  HospitalModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    rowCount = json['rowCount'];
    systemTime = json['systemTime'];
    if (json['data'] != null) {
      data = <HospitalData>[];
      json['data'].forEach((v) {
        data!.add(new HospitalData.fromJson(v));
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

class HospitalData {
  String? ad;
  String? adres;
  String? tel;
  String? email;
  String? website;
  String? sehir;
  String? ilce;
  double? latitude;
  double? longitude;

  HospitalData(
      {this.ad,
        this.adres,
        this.tel,
        this.email,
        this.website,
        this.sehir,
        this.ilce,
        this.latitude,
        this.longitude});

  HospitalData.fromJson(Map<String, dynamic> json) {
    ad = json['Ad'];
    adres = json['Adres'];
    tel = json['Tel'];
    email = json['Email'];
    website = json['Website'];
    sehir = json['Sehir'];
    ilce = json['ilce'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Ad'] = this.ad;
    data['Adres'] = this.adres;
    data['Tel'] = this.tel;
    data['Email'] = this.email;
    data['Website'] = this.website;
    data['Sehir'] = this.sehir;
    data['ilce'] = this.ilce;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}