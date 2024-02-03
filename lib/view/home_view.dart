import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../repository/user_repo.dart';


class HomeView extends StatelessWidget {
  final String uid;
  const HomeView({super.key,required this.uid});

  @override
  Widget build(BuildContext context) {


    return  Scaffold(
      body: FutureBuilder<UserModel?>(
          future: UserRepository().getUser(uid),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else {

              return Text("User name is ${snapshot.data?.name}");
            }
          }
    ),
    );
  }
}
