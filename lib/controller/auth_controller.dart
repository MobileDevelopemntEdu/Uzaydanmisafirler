



import 'package:flutter/material.dart';

import '../repository/auth_repo.dart';

/// `AuthController` bir sınıftır ve kullanıcı kimlik doğrulama işlemlerini yönetir.
/// Gerçek kimlik doğrulama işlemlerini gerçekleştirmek için `AuthenticationRepository`'i kullanır.
/// Tepkisel durum yönetimi sağlamak için `ChangeNotifier`'ı genişletir.
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
  /// `_EpostaControll` bir metoddur.
  /// Kullanıcının e-posta girişini kontrol eder.
  /// Eğer e-posta alanı boşsa, "email boş" mesajını yazdırır ve `false` döndürür.
  /// Eğer e-posta alanı doluysa, `true` döndürür.
  bool _EpostaControll() {
    if (emailController.text.isEmpty) {
      print("email boş");
      return false;
    } else {
      print("email dolu");
      return true;
    }
  }

  /// `_passwordController` bir metoddur.
  /// Kullanıcının şifre girişini kontrol eder.
  /// Eğer şifre alanı boşsa veya şifre uzunluğu 8 karakterden azsa, "password boş" mesajını yazdırır ve `false` döndürür.
  /// Eğer şifre alanı doluysa ve şifre uzunluğu 8 karakterden fazla veya eşitse, `true` döndürür.
  bool _passwordController() {
    if (passwordController.text.isEmpty || passwordController.text.length < 8) {
      print("password boş");
      return false;
    } else {
      print("password dolu");
      return true;
    }
  }

  /// `_nameController` bir metoddur.
  /// Kullanıcının isim girişini kontrol eder.
  /// Eğer isim alanı boşsa, "name boş" mesajını yazdırır ve `false` döndürür.
  /// Eğer isim alanı doluysa, `true` döndürür.
  bool _nameController() {
    if (nameController.text.isEmpty) {
      print("name boş");
      return false;
    } else {
      print("name dolu");
      return true;
    }
  }

  /// `register` bir asenkron metoddur.
  /// Bu metod, `_nameController`, `_EpostaControll` ve `_passwordController` metodlarını kontrol eder.
  /// Eğer bu metodlar `true` döndürürse, `AuthenticationRepository`'den `registerWithEmailAndPassword` metodunu çağırır.
  /// Bu metod, kullanıcının ismini, e-postasını ve şifresini parametre olarak alır.
  /// `registerWithEmailAndPassword` metodunun döndürdüğü değer null değilse, bu değerin `uid` özelliğini döndürür.
  /// Eğer `registerWithEmailAndPassword` metodunun döndürdüğü değer null ise, "hata" mesajını yazdırır ve null döndürür.
  /// Eğer `_nameController`, `_EpostaControll` veya `_passwordController` metodlarından herhangi biri `false` döndürürse, bu metod da null döndürür.
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

  /// `login` bir asenkron metoddur.
  /// Bu metod, `_EpostaControll` ve `_passwordController` metodlarını kontrol eder.
  /// Eğer bu metodlar `true` döndürürse, `AuthenticationRepository`'den `signInWithEmailAndPassword` metodunu çağırır.
  /// Bu metod, kullanıcının e-postasını ve şifresini parametre olarak alır.
  /// `signInWithEmailAndPassword` metodunun döndürdüğü değer null değilse, bu değerin `uid` özelliğini döndürür.
  /// Eğer `signInWithEmailAndPassword` metodunun döndürdüğü değer null ise, "hata" mesajını yazdırır ve null döndürür.
  /// Eğer `_EpostaControll` veya `_passwordController` metodlarından herhangi biri `false` döndürürse, bu metod da null döndürür.
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
