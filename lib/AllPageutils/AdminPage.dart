import 'package:admin/AllPageutils/AdminInfoPage.dart';
import 'package:admin/AllPageutils/CreateAdmin.dart';
import 'package:admin/model/AdminsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C384A),
      appBar: AppBar(
        title: Text('All Admins'),
        centerTitle: true,
        leading: BackButton(),
        backgroundColor: Color(0xFFF57C00),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Color(0xFFF57C00),
        label: Row(
          children: [
            Icon(Icons.add),
            Text("Create New Admin"),
          ],
        ),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              // barrierColor: Colors.black,
              context: context,
              builder: (context) => SingleChildScrollView(
                    child: CreateAdmin(),
                  ));
        },
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: AdminsInfo.readItems(),
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
                            onTap: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  // barrierColor: Colors.black,
                                  context: context,
                                  builder: (context) => SingleChildScrollView(
                                        child: AdminInfoPage(),
                                      ));
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
                                // Text(
                                //   'phoneNumber - ' + phoneNumber,
                                //   maxLines: 1,
                                //   style: TextStyle(
                                //       color: Colors.white.withOpacity(0.7)),
                                //   overflow: TextOverflow.ellipsis,
                                // ),
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
