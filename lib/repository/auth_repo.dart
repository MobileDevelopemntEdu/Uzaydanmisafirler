
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../services/auth_services.dart';
import '../services/user_services.dart';

/// `AuthenticationRepository` sınıfı, kullanıcı kimlik doğrulama işlemlerini yönetir.
/// `AuthServices` ve `UserServices` sınıflarının örneklerini içerir.
///
/// Repository (Depo) tasarım deseni, uygulamanın domain ve veri eşleme katmanları arasında arabuluculuk yapar.
/// Repository, domain nesnelerine erişim ve durumlarını yönetmek için basit, okunabilir bir arayüz sağlar.
///
/// Repository'nin kullanılmasının birkaç nedeni vardır:
/// 1. **Soyutlama**: Repository, veri katmanının soyutlamasını sağlar. Bu, uygulamanın geri kalanının verilerin nasıl alındığı veya saklandığı hakkında bilgi sahibi olmasına gerek kalmaması anlamına gelir.
/// 2. **Bağımsızlık**: Uygulama mantığını veri erişim mantığından bağımsız hale getirir. Bu, sistem parçalarının bağımsız olarak gelişmesini sağlar.
/// 3. **Test Edilebilirlik**: Repository, uygulama mantığını veri erişim mantığından ayırdığı için, birim testlerini yazmayı kolaylaştırır.
/// 4. **Yeniden Kullanılabilirlik**: Uygulamanın farklı bölümlerinde aynı repository metotlarını yeniden kullanabilirsiniz, bu da kod tekrarını azaltır.
///
/// `AuthenticationRepository` sınıfı, bu prensipleri uygular ve kullanıcı kimlik doğrulama işlemlerini yönetir.
/// Bu sınıf, `AuthServices` ve `UserServices` sınıflarını kullanarak işlemler gerçekleştirir,
/// örneğin oturum açma, kayıt olma, oturumu kapatma ve mevcut kullanıcıyı alma.
/// Repository'nin kullanılması sayesinde, uygulamanın geri kalanı bu hizmetler hakkında bilgi sahibi olmasına gerek kalmaz ve
/// kullanıcı verileriyle daha soyut bir şekilde etkileşim kurabilir.


/// `AuthenticationRepository` sınıfı, kullanıcı kimlik doğrulama işlemlerini yönetir.
/// `AuthServices` ve `UserServices` sınıflarının örneklerini içerir.
class AuthenticationRepository {

  // AuthServices sınıfının bir örneği.
  final AuthServices _authServices = AuthServices();

  // UserServices sınıfının bir örneği.
  final UserServices _userServices = UserServices();

  /// E-posta ve şifre ile oturum açma işlemi.
  /// Hata durumunda, hatayı yazdırır ve null döndürür.
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _authServices.signInWithEmailAndPassword(email, password);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  /// E-posta ve şifre ile kayıt olma işlemi.
  /// Kayıt işlemi başarılı olursa, bir `UserModel` oluşturur ve bu modeli `UserServices` aracılığıyla Firestore'a kaydeder.
  /// Hata durumunda, hatayı yazdırır ve null döndürür.
  Future<User?> registerWithEmailAndPassword(String name, String email, String password) async {
    return await _authServices.registerWithEmailAndPassword(email, password).then((value) {
      if (value != null) {
        var model = UserModel(uid: value.uid, name: name, email: email);
        _userServices.createUser(model);
        return value;
      } else {
        return null;
      }
    });
  }

  /// Oturumu kapatma işlemi.
  /// Hata durumunda, hatayı yazdırır.
  Future<void> signOut() async {
    try {
      return await _authServices.signOut();
    } catch(e) {
      print(e.toString());
    }
  }

  /// Mevcut kullanıcıyı alma işlemi.
  /// Hata durumunda, hatayı yazdırır ve null döndürür.
  Future<User?> getCurrentUser() async {
    try {
      return await _authServices.getCurrentUser();
    } catch(e) {
      print(e.toString());
    }
    return null;
  }
}