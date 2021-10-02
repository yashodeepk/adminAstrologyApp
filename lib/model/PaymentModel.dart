import 'package:admin/Pages/PaymentDetailsOfUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class Payment {
  static Stream<QuerySnapshot<Map<String, dynamic>>> readItems() {
    CollectionReference<Map<String, dynamic>> notesItemCollection =
        FirebaseFirestore.instance.collection('Payments');

    return notesItemCollection.snapshots();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> readPayments() {
    CollectionReference<Map<String, dynamic>> notesItemCollection =
        FirebaseFirestore.instance
            .collection('Payments')
            .doc(PaymentDetailsPage.useremail)
            .collection('DonePayments');

    return notesItemCollection.snapshots();
  }
}
