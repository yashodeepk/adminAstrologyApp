import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TempAstrologer {
  static Future<void> addItem({
    required String name,
    required String email,
    required int fees,
    required String experience,
    required String expertise,
    required int rating,
    required String phonenumber,
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
      "photoUrl": "",
      "rating": rating,
      "phonenumber": phonenumber,
    };

    await documentReferencer.set(data).whenComplete(() {
      Fluttertoast.showToast(msg: 'Astrologer Added');
      deleteItem(docId: email, context: context);
    }).catchError(
        (e) => Fluttertoast.showToast(msg: 'Oops!! Something Went Wrong.'));
  }

  static Future<void> deleteItem({
    required String docId,
    required BuildContext context,
  }) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('temp_astrologer').doc(docId);

    await documentReferencer.delete().whenComplete(() {
      Fluttertoast.showToast(msg: 'Success');
      Navigator.pop(context);
    }).catchError(
        (e) => Fluttertoast.showToast(msg: 'Oops!! Something Went Wrong.'));
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readItems() {
    CollectionReference<Map<String, dynamic>> astrologerCollection =
        FirebaseFirestore.instance.collection('temp_astrologer');

    return astrologerCollection.snapshots();
  }
}
