



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

  bool _EpostaControll() {
    if (emailController.text.isEmpty) {
      print("email boş");
      return false;
    } else {
      print("email dolu");
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


  bool _nameController() {
    if (nameController.text.isEmpty) {
      print("name boş");
      return false;
    } else {
      print("name dolu");
      return true;
    }
  }


  Future<String?> register() async {
    if (_nameController() == true &&
        _EpostaControll() == true &&
        _passwordController() == true) {
      return await repo
          .registerWithEmailAndPassword(nameController.text,
              emailController.text, passwordController.text)
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
    if (_EpostaControll() == true && _passwordController() == true) {
      return await repo
          .signInWithEmailAndPassword(
              emailController.text, passwordController.text)
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
