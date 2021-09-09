import 'package:flutter/material.dart';

class CreateAdmin extends StatefulWidget {
  const CreateAdmin({Key? key}) : super(key: key);
  static String? name;

  @override
  _CreateAdminState createState() => _CreateAdminState();
}

class _CreateAdminState extends State<CreateAdmin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: BoxDecoration(
          color: Color(0xFF2C384A),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Column(
        children: [],
      ),
    );
  }
}
