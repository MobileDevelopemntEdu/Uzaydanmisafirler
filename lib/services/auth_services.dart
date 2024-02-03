import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Oturum açmış kullanıcının durumunu izleme
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Kullanıcı oturum açma
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential =
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Hata: $e');
      return null;
    }
  }

  // Kullanıcı kayıt olma
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print('Hata: $e');
      return null;
    }
  }

  // Kullanıcı oturumu kapatma
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
