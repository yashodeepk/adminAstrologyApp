import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AdminsInfo {
  static Future<void> add({
    required String name,
    required String email,
    required String createdAt,
    required BuildContext context,
    required bool isSuperAdmin,
  }) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('Admin').doc(email);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
      "isSuperAdmin": isSuperAdmin,
      "createdAt": createdAt,
    };

    await documentReferencer.set(data).whenComplete(() {
      Fluttertoast.showToast(msg: 'Astrologer Added');
      delete(docId: email, context: context);
    }).catchError(
        (e) => Fluttertoast.showToast(msg: 'Oops!! Something Went Wrong.'));
  }

  static Future<void> update({
    required String name,
    required String email,
    required bool isSuperAdmin,
    required BuildContext context,
  }) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('Admin').doc(email);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
      "isSuperAdmin": isSuperAdmin,
    };

    await documentReferencer.update(data).whenComplete(() {
      Fluttertoast.showToast(msg: 'Astrologer Added');
      delete(docId: email, context: context);
    }).catchError(
        (e) => Fluttertoast.showToast(msg: 'Oops!! Something Went Wrong.'));
  }

  static Future<void> delete({
    required String docId,
    required BuildContext context,
  }) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('Admin').doc(docId);

    await documentReferencer.delete().whenComplete(() {
      Fluttertoast.showToast(msg: 'Success');
      Navigator.pop(context);
    }).catchError(
        (e) => Fluttertoast.showToast(msg: 'Oops!! Something Went Wrong.'));
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readItems() {
    CollectionReference<Map<String, dynamic>> astrologerCollection =
        FirebaseFirestore.instance.collection('Admin');

    return astrologerCollection.snapshots();
  }
}
