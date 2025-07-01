import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final auth = FirebaseAuth.instance;
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('users');

  Future<User?> registerUser({
    required String name,
    required String email,
    required String password,
    required String mobile,
  }) async {
    try {
      UserCredential userData = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userData.user != null) {
        userCollection.add({
          'name': name,
          'email': email,
          'mobile': mobile,
          'User_Id': userData.user?.uid,
        });
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'no data';
    }
  }

  Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userData = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userData.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw 'The email address is badly formatted.';
        case 'user-disabled':
          throw 'This account has been disabled.';
        case 'user-not-found':
          throw 'No account found with this email.';
        case 'wrong-password':
          throw 'Incorrect password. Please try again.';
        default:
          throw 'Login failed. Please try again later.';
      }
    } catch (e) {
      throw 'An unexpected error occure, pleace try again';
    }
  }
}
