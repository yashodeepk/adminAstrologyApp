import 'package:admin/AllPageutils/MenuItemModel.dart';
import 'package:admin/VerificationPageUtils/VerifivationPage.dart';
import 'package:admin/model/AstrologerVerification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        actions: [
          PopupMenuButton<MenuIteam>(
              color: Color(0xFF2C384A),
              onSelected: (item) => onSelect(context, item),
              itemBuilder: (context) => [
                    ...MenuIteams.iteamsSuperAdmin.map(buildIteam).toList(),
                  ]),
        ],
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
                      String phoneNumber = userinfo['phonenumber'];
                      int fees = userinfo['fees'];
                      // int rating = userinfo['rating'];
                      String experience = userinfo['experience'];
                      String expertise = userinfo['expertise'];

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
                            onTap: () {
                              AstrologerInfo.email = docID;
                              AstrologerInfo.name = name;
                              AstrologerInfo.phoneNo = phoneNumber;
                              AstrologerInfo.fees = fees;
                              AstrologerInfo.experience = experience;
                              AstrologerInfo.rating = 5;
                              AstrologerInfo.expertise = expertise;
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => AstrologerInfo()),
                              );
                            },
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
