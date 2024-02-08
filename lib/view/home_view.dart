import 'package:flutter/material.dart';
import 'package:uzaydan_misafirler/models/Hospitalmodel.dart';
import 'package:uzaydan_misafirler/models/pharmcymodel.dart';
import 'package:uzaydan_misafirler/services/pharmcyService.dart';
import 'package:uzaydan_misafirler/services/hospital_services.dart';
import '../models/user_model.dart';
import '../repository/user_repo.dart';


class HomeView extends StatelessWidget {
  final String uid;
  const HomeView({super.key,required this.uid});

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      body: ElevatedButton(onPressed: () {
      }, child: null,

      ),
    );

  }
}
