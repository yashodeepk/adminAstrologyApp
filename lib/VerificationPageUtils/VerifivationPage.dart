import 'package:admin/model/AstrologerVerification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
  final formKey = GlobalKey<FormState>();

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
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Container(
              // padding: EdgeInsets.only(
              //     bottom: MediaQuery.of(context).viewInsets.bottom,
              //     top: MediaQuery.of(context).viewInsets.top),
              // width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                child: Text(
                                  'Name - ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // height: 150,
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty
                                        ? "enter a valid Expertise"
                                        : null,
                                    initialValue: AstrologerInfo.name,
                                    enabled: true,
                                    onChanged: (_val) {
                                      AstrologerInfo.name =
                                          toBeginningOfSentenceCase(_val);
                                    },
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    // inputFormatters: [
                                    //   LengthLimitingTextInputFormatter(3),
                                    // ],
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade900,
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ])),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                child: Text(
                                  'Email - ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty ||
                                            !val.contains("@gmail.com")
                                        ? "enter a valid gmail"
                                        : null,
                                    initialValue: AstrologerInfo.email,
                                    enabled: true,
                                    onChanged: (_val) {
                                      AstrologerInfo.email = _val;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    // inputFormatters: [
                                    //   LengthLimitingTextInputFormatter(3),
                                    // ],
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade900,
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ])),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                child: Text(
                                  'Phone Number - ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: TextFormField(
                                    validator: (val) =>
                                        val!.isEmpty || val.length != 10
                                            ? "enter a valid Phone Number"
                                            : null,
                                    initialValue: AstrologerInfo.phoneNo,
                                    enabled: true,
                                    onChanged: (_val) {
                                      AstrologerInfo.phoneNo = _val;
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    // inputFormatters: [
                                    //   LengthLimitingTextInputFormatter(3),
                                    // ],
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade900,
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ])),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                child: Text(
                                  'Expertise - ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  // height: 150,
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty
                                        ? "enter a valid Expertise"
                                        : null,
                                    initialValue: AstrologerInfo.expertise,
                                    enabled: true,
                                    onChanged: (_val) {
                                      AstrologerInfo.expertise = _val;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                    // inputFormatters: [
                                    //   LengthLimitingTextInputFormatter(3),
                                    // ],
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade900,
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                            ])),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                child: Text(
                                  'experience - ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty
                                        ? "enter a valid experience"
                                        : null,
                                    initialValue: AstrologerInfo.experience,
                                    enabled: true,
                                    onChanged: (_val) {
                                      AstrologerInfo.experience = _val;
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(3),
                                    ],
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade900,
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ])),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                        child: Row(
                            mainAxisSize: MainAxisSize.max,
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(15, 0, 10, 0),
                                child: Text(
                                  'Fees \u{20B9} - ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  child: TextFormField(
                                    validator: (val) => val!.isEmpty
                                        ? "enter a valid fees"
                                        : null,
                                    initialValue:
                                        AstrologerInfo.fees.toString(),
                                    enabled: true,
                                    onChanged: (_val) {
                                      AstrologerInfo.fees = int.parse(_val);
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(3),
                                    ],
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20),
                                        ),
                                      ),
                                      filled: true,
                                      fillColor: Colors.grey.shade900,
                                    ),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ])),
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
                            if (formKey.currentState!.validate()) {
                              Astrologer.addItem(
                                  name: AstrologerInfo.name!,
                                  email: AstrologerInfo.email!,
                                  fees: AstrologerInfo.fees!,
                                  experience: AstrologerInfo.experience!,
                                  expertise: AstrologerInfo.expertise!,
                                  rating: AstrologerInfo.rating!,
                                  phonenumber: AstrologerInfo.phoneNo!,
                                  context: context);
                            }
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
              ),
            ),
          ),
        ));
  }
}
