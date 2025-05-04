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

  // Sign in with email/password
  Future<void> signIn(String email, String password) async {
    _isLoading.value = true;
    try {
      _user.value = await _authUseCase.signInWithEmailPassword(email, password);
      _isLoading.value = false;
      if (_user.value != null) {
        Get.offNamed('/home');
      }
    } catch (e) {
      _errorMessage.value = e.toString();
      _isLoading.value = false;
    }
  }

  // Google Sign-In logic
  Future<void> signInWithGoogle() async {
    _isLoading.value = true;
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        _errorMessage.value = 'Google sign-in failed or cancelled.';
        _isLoading.value = false;
        return;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      _user.value = userCredential.user;

      _isLoading.value = false;
      if (_user.value != null) {
        Get.offNamed('/home');  // Navigate to the home page after successful login
      }
    } catch (e) {
      _errorMessage.value = e.toString();
      _isLoading.value = false;
    }
  }

  // Sign out method (optional)
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    _user.value = null;
  }
}
