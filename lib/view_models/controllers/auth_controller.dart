import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

  // Phone authentication
  Future<void> signInWithPhoneCredential(String smsCode, String verificationId) async {
    _isLoading.value = true;
    try {
      final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      _user.value = await _authUseCase.signInWithPhoneCredential(phoneAuthCredential);
      _isLoading.value = false;
      if (_user.value != null) {
        Get.offNamed('/home');
      }
    } catch (e) {
      _errorMessage.value = e.toString();
      _isLoading.value = false;
    }
  }
}
