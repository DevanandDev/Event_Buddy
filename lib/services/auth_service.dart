import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final CollectionReference userCollection = FirebaseFirestore.instance
      .collection('users');

  Future<User?> registerUser({
    required String name,
    required String email,
    required String password,
    required String mobile,
  }) async {
    try {
      UserCredential userData = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userData.user != null) {
        await userCollection.doc(userData.user!.uid).set({
          'name': name,
          'email': email,
          'mobile': mobile,
          'User_Id': userData.user!.uid,
        });
        return userData.user;
      }
    } on FirebaseAuthException catch (e) {
      throw e.message ?? 'Something went wrong during registration.';
    }
    return null;
  }

  Future<User?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential userData = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
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
    } catch (_) {
      throw 'An unexpected error occurred. Please try again.';
    }
  }

  Future<UserCredential?> loginGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }

      final googleAuth = await googleUser.authentication;
      final cred = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await auth.signInWithCredential(cred);
    } catch (_) {
      throw 'Sign-In failed: Try again';
    }
  }

  Future<User?> guestSign()async{
  try {
    UserCredential userGuest = await auth.signInAnonymously();
    return userGuest.user;
  } catch (e) {
    print('Error while enter as a guest : $e');
    return null;
  }
  }
}
