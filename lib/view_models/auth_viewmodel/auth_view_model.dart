import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User> user = Rxn<User>();
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    user.value = _auth.currentUser;
    super.onInit();
  }

  Future<void> signUp(String email, String password, String username) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      user.value = result.user;

      // Save additional user data to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(result.user!.uid)
          .set({
        'uid': result.user!.uid,
        'email': email,
        'username': username,
        'createdAt': FieldValue.serverTimestamp(),
      });

      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      user.value = result.user;
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        errorMessage.value = 'Google sign in cancelled';
        return;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final result = await _auth.signInWithCredential(credential);
      user.value = result.user;
      errorMessage.value = '';
    } catch (e) {
      errorMessage.value = e.toString();
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    user.value = null;
  }
}
