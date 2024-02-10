import 'package:flutter/material.dart';
import 'package:uzaydan_misafirler/models/Hospitalmodel.dart';
import 'package:uzaydan_misafirler/models/pharmcymodel.dart';
import 'package:uzaydan_misafirler/services/pharmcyService.dart';
import 'package:uzaydan_misafirler/services/hospital_services.dart';
import '../models/user_model.dart';
import '../repository/user_repo.dart';


class HomeView extends StatelessWidget {



  const HomeView({Key? key,});

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      backgroundColor: Colors.grey.shade600,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "hastane ara",
                          filled: true,
                          prefixIcon: Icon(Icons.search),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black38,
                    child: IconButton(
                      icon: Icon(Icons.person),
                      color: Colors.white,
                      onPressed: () {
                        // will change later to go to the profile page
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

  }
}
