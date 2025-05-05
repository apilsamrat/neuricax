import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neuricax/main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppAuth with ChangeNotifier {
  final Ref ref;
  AppAuth(this.ref);
  Future<User?> signInWithGoogle1() async {
    try {
      final res = await auth.signInWithProvider(GoogleAuthProvider());
      if (res.user != null) {
        return res.user!;
      } else {
        throw "Something went wrong please try again later.";
      }
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError(e.message!);
      throw e.message!;
    }
  }

  Future<User?> signInWithGoogle() async {
    const List<String> scopes = <String>[
      'email',
      'https://www.googleapis.com/auth/userinfo.profile',
    ];
    final googleSignin = GoogleSignIn(scopes: scopes);
    try {
      await googleSignin.disconnect();
    } catch (e) {
      debugPrint(e.toString());
    }
    googleSignin
        .signIn()
        .then((account) async {
          if (account != null) {
            final accountCred = await account.authentication;
            final res = await auth.signInWithCredential(
              GoogleAuthProvider.credential(
                idToken: accountCred.idToken,
                accessToken: accountCred.accessToken,
              ),
            );
            return res.user;
          }
          EasyLoading.showError("Login Cancelled!");
        })
        .catchError((e) {
          EasyLoading.showError(e.toString());
        });
    return null;
  }

  void signOut() async {
    await auth.signOut();
    notifyListeners();
  }
}





















// import 'package:firebase_auth/firebase_auth.dart';

// class AppAuth {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<User?> signInWithPhoneAndPassword({
//     required String phone,
//     required String password,
//   }) async {
//     try {
//       final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: phone,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

//   Future<User?> signUpWithPhoneAndPassword({
//     required String phone,
//     required String password,
//   }) async {
//     try {
//       final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: phone,
//         password: password,
//       );
//       return userCredential.user;
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// //sigin with google
//   
//   Future<void> signOut() async {
//     await _auth.signOut();
//   }
// }
