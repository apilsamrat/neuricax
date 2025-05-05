// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:neuricax/main.dart';
// class AppDatabase with ChangeNotifier {
//   final Ref? ref;
//   final User? currentUser = auth.currentUser;

//   Map<String, dynamic>? _cloudappconstants;

//   Map<String, dynamic>? get cloudconstants => _cloudappconstants;

//   Map<String, dynamic>? _userDocument;

//   Map<String, dynamic>? get userDocument => _userDocument;

//   AppDatabase({this.ref}) {
//     getCloudConstants();
//   }

//   Future<Map<String, dynamic>?> getCloudConstants() async {
//     try {
//       final snapshot =
//           await firestore.collection("appdata").doc("appdataconstants").get();
//       if (snapshot.exists) {
//         _cloudappconstants = snapshot.data();
//         notifyListeners();
//       }
//       return snapshot.data();
//     } on FirebaseException catch (e) {
//       throw e.toString();
//     }
//   }

//   Future<bool> userDataExists() async {
//     try {
//       final snapshot =
//           await firestore.collection("users").doc(currentUser?.uid).get();
//       if (snapshot.exists) {
//         _userDocument = snapshot.data();
//         ref!
//             .read(updateProfileProvider)
//             .updateData(data: _userDocument ?? {"first_name": "Random"});
//         notifyListeners();
//       }
//       return snapshot.exists;
//     } on FirebaseException catch (e) {
//       throw e.toString();
//     }
//   }

//   Future<Map<String, dynamic>?> getUserDocument() async {
//     try {
//       final snapshot =
//           await firestore.collection("users").doc(currentUser?.uid).get();
//       if (snapshot.exists) {
//         _userDocument = snapshot.data();
//         notifyListeners();
//       }
//       return snapshot.data();
//     } on FirebaseException catch (e) {
//       throw e.toString();
//     }
//   }

//   Future<void> updateProfileDocument({
//     required Map<String, dynamic> data,
//   }) async {
//     try {
//       await firestore
//           .collection('users')
//           .doc(currentUser?.uid)
//           .set(data, SetOptions(merge: true));
//       await getUserDocument();
//     } on FirebaseException catch (e) {
//       throw e.toString();
//     }
//   }

//   Future updateProfilePicture({required String url}) async {
//     try {
//       await firestore.collection('users').doc(currentUser?.uid).set({
//         "profile_image": url,
//       }, SetOptions(merge: true));
//       await auth.currentUser!.updatePhotoURL(url);
//       await getUserDocument();
//     } on FirebaseException catch (e) {
//       throw e.toString();
//     }
//   }

//   void cleanDatabaseAfterSignOut() {
//     _cloudappconstants = null;
//     _userDocument = null;
//     notifyListeners();
//   }
// }
