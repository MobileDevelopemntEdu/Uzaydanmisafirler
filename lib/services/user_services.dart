import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

/// Firebase Firestore, Google'ın sağladığı bir NoSQL bulut veritabanıdır.
/// Firestore, verileri belgeler ve koleksiyonlar olarak saklar. Bir belge, bir dizi anahtar-değer çifti içerir ve bir koleksiyon, belgeleri gruplar.
///
/// Firestore kullanmanın birkaç nedeni vardır:
/// 1. **Ölçeklenebilirlik**: Firestore, uygulamanızın kullanıcı tabanı büyüdükçe ölçeklenebilir.
/// 2. **Gerçek Zamanlı Güncellemeler**: Firestore, veri değişikliklerini gerçek zamanlı olarak dinlemenizi sağlar.
/// 3. **Çevrimdışı Desteği**: Firestore, çevrimdışıyken bile uygulamanızın düzgün çalışmasını sağlar.
/// 4. **Güvenlik**: Firestore, güçlü güvenlik kuralları ile verilerinizi korur.
///
/// Firestore'un nasıl kullanılacağına gelince, aşağıdaki adımları izleyebilirsiniz:
/// 1. **Firebase Projesi Oluşturma**: Firebase konsolunda yeni bir proje oluşturun ve projenizi Firebase ile bağlayın.
/// 2. **Firestore Etkinleştirme**: Firebase konsolunda, Firestore bölümüne gidin ve Firestore'u etkinleştirin.
/// 3. **Firestore Referansı Oluşturma**: Uygulamanızda, belirli bir koleksiyon veya belgeye işaret eden bir Firestore referansı oluşturun.
/// 4. **Veri Yazma ve Okuma**: Oluşturduğunuz referansı kullanarak, Firestore'a veri yazabilir ve Firestore'dan veri okuyabilirsiniz.
///
/// `UserServices` sınıfı, Firestore işlemlerini yönetir.
/// Bu sınıf, belirli bir kullanıcının verilerini alma, tüm kullanıcıların verilerini alma, yeni bir kullanıcı oluşturma ve kullanıcı verilerini güncelleme gibi işlemleri gerçekleştirir.
/// Firestore kullanarak, uygulamanın geri kalanı bu işlemleri daha soyut bir şekilde gerçekleştirebilir ve verileri güvenli bir şekilde saklayabilir ve yönetebilir.

/// `UserServices` sınıfı, kullanıcı verilerini yönetmek için kullanılır.
/// Firebase Firestore'dan bir koleksiyon referansı içerir.
class UserServices {

  // Firebase kullanıcı örneği koleksiyon referansı
  final  CollectionReference _userDB = FirebaseFirestore.instance.collection('users');

  /// Yeni bir kullanıcı oluşturur.
  /// `UserModel` alır ve bu modeli JSON'a dönüştürerek Firestore'a kaydeder.
  /// Hata durumunda, hatayı yazdırır.
  Future<void> createUser(UserModel model) async {
    try {
      return await _userDB.doc(model.uid).set(model.toJson());
    } catch(e) {
      print(e.toString());
    }
  }

  /// Belirli bir kullanıcının verilerini alır.
  /// Kullanıcının benzersiz kimliğini (uid) alır ve Firestore'dan kullanıcının verilerini alır.
  /// Hata durumunda, hatayı yazdırır ve null döndürür.
  Future<UserModel?> getUser(String uid) async {
    try {
      DocumentSnapshot userData = await _userDB.doc(uid).get();
      return UserModel.fromJson(userData.data() as Map<String, dynamic>);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  /// Tüm kullanıcıların verilerini alır.
  /// Firestore'dan tüm kullanıcıların verilerini alır ve bir `UserModel` listesi döndürür.
  /// Hata durumunda, hatayı yazdırır ve boş bir liste döndürür.
  Future<List<UserModel>> getAllUsers() async {
    try {
      QuerySnapshot usersData = await _userDB.get();
      return usersData.docs.map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>)).toList();
    } catch(e) {
      print(e.toString());
    }
    return [];
  }

  /// Kullanıcı verilerini günceller.
  /// `UserModel` alır ve bu modeli JSON'a dönüştürerek Firestore'daki ilgili kullanıcının verilerini günceller.
  /// Hata durumunda, hatayı yazdırır.
  Future<void> updateUser(UserModel model) async {
    try {
      return await _userDB.doc(model.uid).update(model.toJson());
    } catch(e) {
      print(e.toString());
    }
  }
}