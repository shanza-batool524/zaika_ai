import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Email and password sign in
  Future<User?> signInWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Failed to sign in: $e');
    }
  }

  // Email and password sign up
  Future<User?> signUpWithEmailPassword(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      throw Exception('Failed to sign up: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Phone number verification
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String verificationId, int? resendToken) onVerificationCompleted,
    required Function(String smsCode) onCodeAutoRetrievalTimeout,
    required Function(Exception error) onVerificationFailed,
    required Function(PhoneAuthCredential) onCodeSent,
  }) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (phoneAuthCredential) {
          // Check if verificationId is null before calling the callback
          String verificationId = phoneAuthCredential.verificationId ?? '';
          if (verificationId.isNotEmpty) {
            onVerificationCompleted(verificationId, null);
          } else {
            throw Exception('Verification ID is null.');
          }
        },
        verificationFailed: (error) {
          onVerificationFailed(error);
        },
        codeSent: (verificationId, resendToken) {
          // Pass the verificationId without null safety issues
          onCodeSent(PhoneAuthProvider.credential(verificationId: verificationId, smsCode: ""));
        },
        codeAutoRetrievalTimeout: (smsCode) {
          onCodeAutoRetrievalTimeout(smsCode);
        },
      );
    } catch (e) {
      throw Exception('Failed to verify phone number: $e');
    }
  }

  // Sign in with phone credential
  Future<User?> signInWithPhoneCredential(PhoneAuthCredential phoneAuthCredential) async {
    try {
      final userCredential = await _firebaseAuth.signInWithCredential(phoneAuthCredential);
      return userCredential.user;
    } catch (e) {
      throw Exception('Failed to sign in with phone: $e');
    }
  }
}
