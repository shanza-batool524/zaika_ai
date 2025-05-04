import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../controllers/auth_controller.dart';

class AuthViewModel extends GetxController {
  final _authController = Get.find<AuthController>();  // Use Get.find to access the AuthController

  // Observable user
  Rx<User?> _user = Rx<User?>(null);
  User? get user => _user.value;

  // Loading state
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  // Error message
  RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  // Normal sign-in with email and password
  Future<void> signIn(String email, String password) async {
    _isLoading.value = true;
    try {
      await _authController.signIn(email, password);
      _user.value = _authController.user;  // Fetch the signed-in user from AuthController
      _isLoading.value = false;

      if (_user.value != null) {
        _errorMessage.value = '';
      } else {
        _errorMessage.value = 'Sign-in failed.';
      }
    } catch (e) {
      _errorMessage.value = e.toString();
      _isLoading.value = false;
    }
  }

  // Google Sign-In
  Future<void> signInWithGoogle() async {
    _isLoading.value = true;
    try {
      // Trigger Google sign-in from AuthController
      await _authController.signInWithGoogle();

      // After sign-in, update the state based on the user
      _user.value = _authController.user;

      if (_user.value != null) {
        _errorMessage.value = '';
      } else {
        _errorMessage.value = 'Google sign-in failed.';
      }
    } catch (e) {
      _errorMessage.value = e.toString();
    } finally {
      _isLoading.value = false;
    }
  }

// Other existing methods (sign-in with phone authentication, etc.)
}
