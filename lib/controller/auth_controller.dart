



import 'package:flutter/material.dart';

import '../repository/auth_repo.dart';


class AuthController extends ChangeNotifier {
  // AuthenticationRepository sınıfının bir örneği.
  final repo = AuthenticationRepository();

  //doğrulama formlarındaki kullanıcı girişini işlemek için TextEditingControllers.
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final telnoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final tcController = TextEditingController();
  final passwordController2 = TextEditingController();

bool _nameController() {
    if (nameController.text.isEmpty) {
      print("name boş");
      return false;
    } else {
      print("name dolu");
      return true;
    }
  }

bool _surnameController(){
    if(surnameController.text.isEmpty){
      print("surname boş");
      return false;
    }else{
      print("surname dolu");
      return true;
    }
  }

  bool _EpostaController() {
    if (emailController.text.isEmpty) {
      print("email boş");
      return false;
    } else {
      print("email dolu");
      return true;
    }
  }

 bool _telnoController(){
    if(telnoController.text.isEmpty){
      print("telno boş");
      return false;
    }else{
      print("telno dolu");
      return true;
    }
  }

 bool _tcnoController(){
    if(tcController.text.isEmpty){
      print("tcno boş");
      return false;
    }else{
      print("tcno dolu");
      return true;
    }
  }

  bool _passwordController() {
    if (passwordController.text.isEmpty || passwordController.text.length < 8) {
      print("password boş");
      return false;
    } else {
      print("password dolu");
      return true;
    }
  }

 bool _passwordController2(){
  if(passwordController.text == passwordController2.text){
    print("sifre ayni");
    return true;
  }else{
    print("sifre ayni degil");
    return false;
  }
 }

  Future<String?> register() async {
    if (_nameController() == true &&
        _surnameController() == true &&
        _EpostaController() == true &&
        _telnoController() == true &&
        _tcnoController() == true &&
        _passwordController() == true &&
        _passwordController2() == true 
        ) {
      return await repo
          .registerWithEmailAndPassword(
            nameController.text,
            surnameController.text,
            emailController.text,
            telnoController.text,
            tcController.text,
            passwordController.text
          )
          .then((value) {
        if (value != null) {
          return value.uid;
        } else {
          print("hata");
        }
        return null;
      });
    } else {
      return null;
    }
  }


  Future<String?> login() async {
    if (_EpostaController() == true && _passwordController() == true) {
      return await repo
          .signInWithEmailAndPassword(
              emailController.text,
              passwordController.text
              )
          .then((value) {
        if (value != null) {
          return value.uid;
        } else {
          print("hata");
        }
        return null;
      });
    } else {
      return null;
    }
  }
}
