import 'package:admin/AstrologerUtils/AstrologerEdit.dart';
import 'package:admin/model/AstrologerRead.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllAstrologer extends StatefulWidget {
  const AllAstrologer({Key? key}) : super(key: key);

  @override
  _AllAstrologerState createState() => _AllAstrologerState();
}

class _AllAstrologerState extends State<AllAstrologer> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: AstrologerRead.readItems(),
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
                  separatorBuilder: (context, index) => SizedBox(height: 10.0),
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var userinfo = snapshot.data!.docs[index].data();
                    String docID = snapshot.data!.docs[index].id;
                    String name = userinfo['name'];
                    String phoneNumber = userinfo['phonenumber'];
                    int fees = userinfo['fees'];
                    int rating = userinfo['rating'];
                    String experience = userinfo['experience'];
                    String photoUrl = userinfo['photoUrl'];
                    String expertise = userinfo['expertise'];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Color(0xFFECEFF1).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            child: ClipOval(
                              child: FadeInImage.assetNetwork(
                                image: photoUrl,
                                placeholder: 'assets/noimage.jpg',
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset('assets/noimage.jpg',
                                      fit: BoxFit.fitWidth);
                                },
                              ),
                            ),
                            radius: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          onTap: () {
                            AstrologerEdit.email = docID;
                            AstrologerEdit.name = name;
                            AstrologerEdit.phoneNo = phoneNumber;
                            AstrologerEdit.fees = fees;
                            AstrologerEdit.experience = experience;
                            AstrologerEdit.rating = rating;
                            AstrologerEdit.expertise = expertise;
                            AstrologerEdit.photourl = photoUrl;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => AstrologerEdit()),
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
    );
  }
}
