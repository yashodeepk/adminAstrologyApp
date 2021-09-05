import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Database {
  static Future<void> updateItem({
    required String health,
    required String love,
    required String description,
    required String docName,
  }) async {
    DocumentReference documentReferencer =
        FirebaseFirestore.instance.collection('horoscope').doc(docName);

    Map<String, dynamic> data = <String, dynamic>{
      "General Horoscope": description,
      "Love": love,
      "Health": health,
      "UpdatedAt": DateTime.now()
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => Fluttertoast.showToast(msg: '$docName updated'))
        .catchError(
            (e) => Fluttertoast.showToast(msg: 'Oops!! Something Went Wrong.'));
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readItems() {
    CollectionReference<Map<String, dynamic>> notesItemCollection =
        FirebaseFirestore.instance.collection('horoscope');

    return notesItemCollection.snapshots();
  }
}
