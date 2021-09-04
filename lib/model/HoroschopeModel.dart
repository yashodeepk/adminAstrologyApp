import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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
      "UpdatedAt": DateFormat.yMMMMd('en_US').add_jm().format(DateTime.now())
    };

    await documentReferencer
        .update(data)
        .whenComplete(() => print("Note item updated in the database"))
        .catchError((e) => print(e));
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readItems() {
    CollectionReference<Map<String, dynamic>> notesItemCollection =
        FirebaseFirestore.instance.collection('horoscope');

    return notesItemCollection.snapshots();
  }
}
