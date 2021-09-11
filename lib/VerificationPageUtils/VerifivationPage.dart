import 'package:admin/model/AstrologerVerification.dart';
import 'package:flutter/material.dart';

class AstrologerInfo extends StatefulWidget {
  const AstrologerInfo({Key? key}) : super(key: key);
  static String? name;
  static String? phoneNo;
  static String? email;
  static String? experience;
  static String? expertise;
  static int? rating;
  static int? fees;

  @override
  _AstrologerInfoState createState() => _AstrologerInfoState();
}

class _AstrologerInfoState extends State<AstrologerInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF2C384A),
        appBar: AppBar(
          title: Text(
            "AstrologerInfo",
          ),
          backgroundColor: Color(0xFFF57C00),
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18),
                child: Text(
                  AstrologerInfo.name!,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Email - ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        AstrologerInfo.email!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Phone Number - ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      AstrologerInfo.phoneNo!,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Expertise - ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        AstrologerInfo.expertise!,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Experience - ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        AstrologerInfo.experience!,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(
                        'Fees - ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        AstrologerInfo.fees!.toString(),
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Astrologer.deleteItem(
                          docId: AstrologerInfo.email!, context: context);
                    },
                    child: Center(
                      child: Text("Delete"),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      fixedSize: Size(150, 45),
                      primary: Colors.white,
                      backgroundColor: Colors.red,
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Astrologer.addItem(
                          name: AstrologerInfo.name!,
                          email: AstrologerInfo.email!,
                          fees: AstrologerInfo.fees!,
                          experience: AstrologerInfo.experience!,
                          expertise: AstrologerInfo.expertise!,
                          rating: AstrologerInfo.rating!,
                          phonenumber: AstrologerInfo.phoneNo!,
                          context: context);
                    },
                    child: Center(
                      child: Text("Verify"),
                    ),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      fixedSize: Size(150, 45),
                      primary: Colors.white,
                      backgroundColor: Colors.green,
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
