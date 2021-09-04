import 'package:flutter/material.dart';

class VerifyUser extends StatefulWidget {
  const VerifyUser({Key? key}) : super(key: key);

  @override
  _VerifyUserState createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify'),
        backgroundColor: Color(0xFFF57C00),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF2C384A),
      body: Container(),
    );
  }
}
