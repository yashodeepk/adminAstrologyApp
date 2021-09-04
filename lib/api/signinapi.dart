import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class GoogleSignInProvider extends ChangeNotifier {
  Future googleLogin() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    String email = googleUser!.email;
    FirebaseFirestore.instance
        .collection('Admin')
        .doc(email)
        .get()
        .then((onValue) async {
      if (onValue.exists) {
        try {
          final googleUser = await googleSignIn.signIn();
          if (googleUser == null)
            return print("google user null");
          else {
            // _user = googleUser;

            final googleAuth = await googleUser.authentication;

            final credential = GoogleAuthProvider.credential(
              accessToken: googleAuth.accessToken,
              idToken: googleAuth.idToken,
            );
            await FirebaseAuth.instance.signInWithCredential(credential);

            final currentUser = FirebaseAuth.instance.currentUser;

            if (currentUser != null) {
              print('Admin');
              // Check is already sign up
              final QuerySnapshot result = await FirebaseFirestore.instance
                  .collection('Admin')
                  .where('id', isEqualTo: currentUser.email)
                  .get();
              final List<DocumentSnapshot> documents = result.docs;
              if (documents.length == 0) {
                print('user created');
                // Update data to server if new user
                FirebaseFirestore.instance
                    .collection('Admin')
                    .doc(currentUser.email)
                    .set({
                  'name': currentUser.displayName,
                  'email': currentUser.email,
                  'photoUrl': currentUser.photoURL,
                  'id': currentUser.uid,
                  'createdAt':
                      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now()),
                  // 'superadmin': false
                });
              }
              print('admin data updated');
              notifyListeners();
              Fluttertoast.showToast(msg: "Sign in success");
            } else {
              print('user data update fail');
              await googleSignIn.disconnect();
              FirebaseAuth.instance.signOut();
              Fluttertoast.showToast(msg: "Sign in fail");
            }
            // Fluttertoast.showToast(msg: "Sign in success");

          }
        } catch (e) {
          Fluttertoast.showToast(msg: "Sign in fail");
          await googleSignIn.disconnect();
          FirebaseAuth.instance.signOut();
          print(e.toString());
        }
      } else {
        await googleSignIn.disconnect();
        FirebaseAuth.instance.signOut();
        Fluttertoast.showToast(msg: "please register before login");
      }
    });
  }

  Future logout() async {
    final googleSignIn = GoogleSignIn();
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
