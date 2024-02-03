import 'package:firebase_auth/firebase_auth.dart';

/// Firebase kimlik doğrulama, kullanıcıların uygulamanıza güvenli bir şekilde oturum açmasını sağlar.
/// Firebase kimlik doğrulama, kullanıcıların e-posta ve şifre, telefon numarası, Google, Facebook, Twitter ve GitHub gibi popüler kimlik sağlayıcıları kullanarak oturum açmasını sağlar.
///
/// Firebase kimlik doğrulama kullanmanın birkaç nedeni vardır:
/// 1. **Güvenlik**: Firebase kimlik doğrulama, kullanıcıların kimlik bilgilerini güvenli bir şekilde saklar ve yönetir. Bu, uygulamanın güvenliğini artırır.
/// 2. **Kolaylık**: Firebase kimlik doğrulama, kullanıcıların popüler kimlik sağlayıcıları kullanarak hızlı ve kolay bir şekilde oturum açmasını sağlar.
/// 3. **Ölçeklenebilirlik**: Firebase kimlik doğrulama, uygulamanızın kullanıcı tabanı büyüdükçe ölçeklenebilir.
/// 4. **Entegrasyon**: Firebase kimlik doğrulama, Firebase'in diğer hizmetleriyle (örneğin, Firestore, Cloud Functions) kolayca entegre olur.
///
/// Firebase kimlik doğrulamanın nasıl kullanılacağına gelince, aşağıdaki adımları izleyebilirsiniz:
/// 1. **Firebase Projesi Oluşturma**: Firebase konsolunda yeni bir proje oluşturun ve projenizi Firebase ile bağlayın.
/// 2. **Kimlik Doğrulama Etkinleştirme**: Firebase konsolunda, kimlik doğrulama bölümüne gidin ve e-posta/şifre oturum açmayı etkinleştirin.
/// 3. **Firebase Auth Örneği Oluşturma**: Uygulamanızda, FirebaseAuth sınıfından bir örnek oluşturun. Bu örnek, kimlik doğrulama işlemlerini gerçekleştirmek için kullanılacaktır.
/// 4. **Oturum Açma ve Kayıt Olma İşlemleri**: FirebaseAuth örneğini kullanarak, kullanıcıların e-posta ve şifre ile oturum açmasını ve kaydolmasını sağlayın.
/// 5. **Oturumu Kapatma ve Mevcut Kullanıcıyı Alma**: FirebaseAuth örneğini kullanarak, kullanıcıların oturumunu kapatabilir ve mevcut kullanıcıyı alabilirsiniz.
///
/// `AuthServices` sınıfı, Firebase kimlik doğrulama işlemlerini yönetir.
/// Bu sınıf, e-posta ve şifre ile oturum açma, e-posta ve şifre ile kayıt olma, oturumu kapatma ve mevcut kullanıcıyı alma gibi işlemleri gerçekleştirir.
/// Firebase kimlik doğrulama kullanarak, uygulamanın geri kalanı bu işlemleri daha soyut bir şekilde gerçekleştirebilir ve kullanıcıların kimlik bilgilerini güvenli bir şekilde yönetebilir.

/// `AuthServices` sınıfı, Firebase kimlik doğrulama işlemlerini yönetir.
/// Firebase Auth örneğini içerir.
class AuthServices {
  // Firebase Auth örneği.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// E-posta ve şifre ile oturum açma metodu.
  /// Bir hata oluşursa, hatayı yazdırır ve null döndürür.
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  /// E-posta ve şifre ile kayıt olma metodu.
  /// Bir hata oluşursa, hatayı yazdırır ve null döndürür.
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  /// Oturumu kapatma metodu.
  /// Bir hata oluşursa, hatayı yazdırır.
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
    }
  }

  /// Mevcut kullanıcıyı alma metodu.
  /// Bir hata oluşursa, hatayı yazdırır ve null döndürür.
  Future<User?> getCurrentUser() async {
    try {
      return _auth.currentUser;
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

}