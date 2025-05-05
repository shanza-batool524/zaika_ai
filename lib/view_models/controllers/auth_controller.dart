import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../usecases/usecases.dart';

class AuthController extends GetxController {
  final AuthUseCase _authUseCase = AuthUseCase();

  var _user = Rx<User?>(null);
  User? get user => _user.value;

  var _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  var _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  Future<void> signIn(String email, String password) async {
    _isLoading.value = true;
    try {
      _user.value = await _authUseCase.signInWithEmailPassword(email, password);
      if (_user.value != null) {
        Get.offNamed('/home');
      }
    } catch (e) {
      _errorMessage.value = e.toString();
      print('Sign in error: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> signInWithGoogle() async {
    _isLoading.value = true;
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        _errorMessage.value = 'Google sign-in cancelled.';
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      _user.value = userCredential.user;

      if (_user.value != null) {
        Get.offNamed('/home');
      }
    } catch (e) {
      _errorMessage.value = e.toString();
      print('Google sign-in error: $e');
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      _user.value = null;
    } catch (e) {
      _errorMessage.value = e.toString();
      print('Sign out error: $e');
    }
  }
}
