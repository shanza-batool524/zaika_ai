import 'package:firebase_auth/firebase_auth.dart';

import '../view_models/services/firebase_services/firebase_services.dart';

class AuthUseCase {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  // Sign in with email and password
  Future<User?> signInWithEmailPassword(String email, String password) async {
    return await _firebaseAuthService.signInWithEmailPassword(email, password);
  }

  // Sign up with email and password
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    return await _firebaseAuthService.signUpWithEmailPassword(email, password);
  }

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuthService.signOut();
  }

  // Phone authentication
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId, int? resendToken) onVerificationCompleted,
    required Function(String smsCode) onCodeAutoRetrievalTimeout,
    required Function(Exception error) onVerificationFailed,
    required Function(PhoneAuthCredential) onCodeSent,
  }) async {
    return await _firebaseAuthService.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      onVerificationCompleted: onVerificationCompleted,
      onCodeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
      onVerificationFailed: onVerificationFailed,
      onCodeSent: onCodeSent,
    );
  }

  // Sign in with phone credential
  Future<User?> signInWithPhoneCredential(PhoneAuthCredential phoneAuthCredential) async {
    return await _firebaseAuthService.signInWithPhoneCredential(phoneAuthCredential);
  }
}
