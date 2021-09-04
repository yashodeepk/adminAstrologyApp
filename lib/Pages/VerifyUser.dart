import 'package:admin/api/signinapi.dart';
import 'package:admin/model/AstrologerVerification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyAstrologer extends StatefulWidget {
  const VerifyAstrologer({Key? key}) : super(key: key);

  @override
  _VerifyAstrologerState createState() => _VerifyAstrologerState();
}

class _VerifyAstrologerState extends State<VerifyAstrologer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C384A),
      appBar: AppBar(
        title: Text('Verify Astrologer'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.logout_rounded,
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.logout();
          },
        ),
        backgroundColor: Color(0xFFF57C00),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: Astrologer.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    reverse: true,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 10.0),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var userinfo = snapshot.data!.docs[index].data();
                      String docID = snapshot.data!.docs[index].id;
                      String name = userinfo['name'];
                      String photoUrl = userinfo['photoUrl'];
                      String phoneNumber = userinfo['phonenumber'];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Ink(
                          decoration: BoxDecoration(
                            color: Color(0xFFECEFF1).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            leading: CircleAvatar(
                              child: ClipOval(
                                child: Image.network(photoUrl),
                              ),
                              radius: 20,
                            ),
                            // onTap: () => Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //       builder: (context) => EditPage(
                            //             docName: docID,
                            //             description: description,
                            //           )),
                            // ),
                            title: Text(
                              name,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email - ' + docID,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  'phoneNumber - ' + phoneNumber,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7)),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xFFF57C00),
              ),
            ),
          );
        },
      ),
    );
  }
}
