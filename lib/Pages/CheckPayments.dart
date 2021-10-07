import 'package:admin/model/MenuItemModel.dart';
import 'package:admin/Pages/PaymentDetailsOfUser.dart';
import 'package:admin/model/PaymentModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaymentCheck extends StatefulWidget {
  const PaymentCheck({Key? key}) : super(key: key);

  @override
  _PaymentCheckState createState() => _PaymentCheckState();
}

class _PaymentCheckState extends State<PaymentCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payments'),
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
      backgroundColor: Color(0xFF2C384A),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: Payment.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('error');
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            print(snapshot.data);
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.0),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                // var noteInfo = snapshot.data!.docs[index].data();
                // print(snapshot.data!.docs.length);
                dynamic docID = snapshot.data!.docs[index].id;
                // print(docID);

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
                          PaymentDetailsPage.useremail = docID;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PaymentDetailsPage()));
                        },
                        title: Text(
                          docID,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            'Tap to checkout payments details',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ));
              },
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
