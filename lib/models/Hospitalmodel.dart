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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['rowCount'] = rowCount;
    data['systemTime'] = systemTime;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Ad'] = ad;
    data['Adres'] = adres;
    data['Tel'] = tel;
    data['Email'] = email;
    data['Website'] = website;
    data['Sehir'] = sehir;
    data['ilce'] = ilce;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}