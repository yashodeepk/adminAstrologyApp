import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AstrologerRead {
  // static Future<void> add({
  //   required String name,
  //   required String email,
  //   required String createdAt,
  //   required BuildContext context,
  //   required bool isSuperAdmin,
  // }) async {
  //   DocumentReference documentReferencer =
  //       FirebaseFirestore.instance.collection('Admin').doc(email);

  //   Map<String, dynamic> data = <String, dynamic>{
  //     "name": name,
  //     "email": email,
  //     "photoUrl": 'no_image',
  //     "id": '',
  //     "superAdmin": isSuperAdmin,
  //     "createdAt": createdAt,
  //   };

  //   await documentReferencer.set(data).whenComplete(() {
  //     Navigator.pop(context);
  //     Fluttertoast.showToast(msg: 'Admin Added');
  //     // delete(docId: email, context: context);
  //   }).catchError(
  //       (e) => Fluttertoast.showToast(msg: 'Oops!! Something Went Wrong.'));
  // }

  static Future<void> update({
    required String email,
    required String experience,
    required String name,
    required String expertise,
    required int fees,
    required String phonenumber,
    required int rating,
    required BuildContext context,
  }) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('Astrologer').doc(email);

    Map<String, dynamic> data = <String, dynamic>{
      "name": name,
      "email": email,
      "fees": fees,
      "experience": experience,
      "expertise": expertise,
      "rating": rating,
      "phonenumber": phonenumber,
    };

    await documentReferencer.update(data).whenComplete(() {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: 'Admin updated');
    }).catchError(
        (e) => Fluttertoast.showToast(msg: 'Oops!! Something Went Wrong.'));
  }

  static Future<void> delete({
    required String docId,
    required BuildContext context,
  }) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('Astrologer').doc(docId);

    await documentReferencer.delete().whenComplete(() {
      Fluttertoast.showToast(msg: 'Success');
      Navigator.pop(context);
    }).catchError(
        (e) => Fluttertoast.showToast(msg: 'Oops!! Something Went Wrong.'));
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readItems() {
    CollectionReference<Map<String, dynamic>> astrologer =
        FirebaseFirestore.instance.collection('Astrologer');

    return astrologer.snapshots();
  }
}
