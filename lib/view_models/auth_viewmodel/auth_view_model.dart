import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../usecases/usecases.dart';

class AuthViewModel extends GetxController {
  final AuthUseCase _authUseCase = AuthUseCase();

  // Observable user
  Rx<User?> _user = Rx<User?>(null);
  User? get user => _user.value;

  // Loading state
  RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  // Error message
  RxString _errorMessage = ''.obs;
  String get errorMessage => _errorMessage.value;

  // Phone authentication
  RxString _verificationId = ''.obs;
  String get verificationId => _verificationId.value;

  RxInt? _resendToken;
  int? get resendToken => _resendToken?.value;

  RxBool _isPhoneVerificationInProgress = false.obs;
  bool get isPhoneVerificationInProgress => _isPhoneVerificationInProgress.value;

  // Sign In with Email and Password
  Future<void> signIn(String email, String password) async {
    _isLoading.value = true;
    try {
      _user.value = await _authUseCase.signInWithEmailPassword(email, password);
      _isLoading.value = false;
    } catch (e) {
      _errorMessage.value = e.toString();
      _isLoading.value = false;
    }
  }

  // Sign Up with Email and Password
  Future<void> signUp(String email, String password) async {
    _isLoading.value = true;
    try {
      _user.value = await _authUseCase.signUpWithEmailPassword(email, password);
      _isLoading.value = false;
    } catch (e) {
      _errorMessage.value = e.toString();
      _isLoading.value = false;
    }
  }

  // Sign Out
  Future<void> signOut() async {
    await _authUseCase.signOut();
    _user.value = null;
  }

  // // Phone verification
  // Future<void> verifyPhoneNumber({
  //   required String phoneNumber,
  //   required Function(String verificationId, int? resendToken) onVerificationCompleted,
  //   required Function(String smsCode) onCodeAutoRetrievalTimeout,
  //   required Function(FirebaseAuthException error) onVerificationFailed,
  //   required Function(PhoneAuthCredential phoneAuthCredential) onCodeSent,  // Corrected function signature
  // }) async {
  //   _isPhoneVerificationInProgress.value = true;
  //
  //   try {
  //     await _authUseCase.verifyPhoneNumber(
  //       phoneNumber: phoneNumber,
  //       onVerificationCompleted: (verificationId, resendToken) {
  //         _verificationId.value = verificationId;
  //         // _resendToken?.value = resendToken;
  //         onVerificationCompleted(verificationId, resendToken);
  //       },
  //       onVerificationFailed: (error) {
  //         // Pass FirebaseAuthException directly
  //         // onVerificationFailed(error);
  //       },
  //       // onCodeSent: (verificationId, resendToken) {
  //       //   _verificationId.value = verificationId;
  //       //   _resendToken?.value = resendToken;
  //       //
  //       //   // Create PhoneAuthCredential here
  //       //   PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
  //       //     verificationId: verificationId, // Pass verificationId (String)
  //       //     smsCode: "",  // Initially empty, we will set it later
  //       //   );
  //       //
  //       //   // Now pass the PhoneAuthCredential to the callback (as expected by Firebase)
  //       //   onCodeSent(phoneAuthCredential); // This is the corrected callback
  //       // },
  //       onCodeAutoRetrievalTimeout: onCodeAutoRetrievalTimeout,
  //     );
  //     _isPhoneVerificationInProgress.value = false;
  //   } catch (e) {
  //     _errorMessage.value = e.toString();
  //     _isPhoneVerificationInProgress.value = false;
  //   }
  // }

  // Sign in with phone credential (SMS code)
  Future<void> signInWithPhoneCredential(String smsCode) async {
    _isLoading.value = true;

    try {
      final phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId.value,  // This is the verificationId (String)
        smsCode: smsCode,
      );
      _user.value = await _authUseCase.signInWithPhoneCredential(phoneAuthCredential);
      _isLoading.value = false;
    } catch (e) {
      _errorMessage.value = e.toString();
      _isLoading.value = false;
    }
  }

//   // Reset phone verification state
//   void resetPhoneVerification() {
//     _verificationId.value = '';  // Resetting verificationId
//     _resendToken?.value = null;
//     _isPhoneVerificationInProgress.value = false;
//   }
 }
