import 'package:flutter/material.dart';
import 'package:uzaydan_misafirler/models/Hospitalmodel.dart';
import 'package:uzaydan_misafirler/models/pharmcymodel.dart';
import 'package:uzaydan_misafirler/services/pharmcyService.dart';
import 'package:uzaydan_misafirler/services/hospital_services.dart';
import '../models/user_model.dart';
import '../repository/user_repo.dart';
import '../services/hospital.dart';
import '../services/pharmcy.dart';


class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      body: ElevatedButton(
        onPressed: () async {
         var fireBaseHospital = PharmcyServices();
         Pharmcy? m1 = await PharmcyDD().fetchData();

          if(m1 != null){
            m1.data!.forEach((element) {
              fireBaseHospital.AddPharmcy(element);
            });
          }
      },
        child: Text("Gönderr!!!!"),

      ),
    );

  }
}
