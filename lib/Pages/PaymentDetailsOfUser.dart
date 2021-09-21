import 'package:admin/AllPageutils/MenuItemModel.dart';
import 'package:admin/model/PaymentModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PaymentDetailsPage extends StatefulWidget {
  static String? useremail;

  const PaymentDetailsPage({Key? key}) : super(key: key);

  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          PaymentDetailsPage.useremail!,
          style: TextStyle(fontSize: 16),
        ),
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
        stream: Payment.readPayments(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(height: 10.0),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var noteInfo = snapshot.data!.docs[index].data();
                // String docID = snapshot.data!.docs[index].id;
                String paymentId = noteInfo['paymentId'];
                String description = noteInfo['description'];
                int amount = noteInfo['amount'];
                String paidTo = noteInfo['paidTo'];
                String from = noteInfo['from'];
                String date = noteInfo['paymentDateTime'];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                      decoration: BoxDecoration(
                        color: Color(0xFFECEFF1).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ExpansionTile(
                        iconColor: Colors.orange,
                        collapsedIconColor: Colors.white,
                        title: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  'Payment ID - ' + paymentId,
                                  // maxLines: 1,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Description - ' + description,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Amount - ' + amount.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Paid to - ' + paidTo,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('From - ' + from,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Payment ID - ' + paymentId,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Payment DateTime - ' + date,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                      // ListTile(
                      //   shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(8.0),
                      //   ),
                      //   onTap: () {
                      //     // Navigator.of(context).push(MaterialPageRoute(
                      //     //     builder: (context) => PaymentDetailsPage()));
                      //   },

                      //   subtitle: Text(
                      //     'Tap for details',
                      //     maxLines: 1,
                      //     style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      //     overflow: TextOverflow.ellipsis,
                      //   ),
                      // ),
                      ),
                );
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
