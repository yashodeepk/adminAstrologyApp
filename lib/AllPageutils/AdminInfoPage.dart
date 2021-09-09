import 'package:flutter/material.dart';

class AdminInfoPage extends StatefulWidget {
  const AdminInfoPage({Key? key}) : super(key: key);
  static String? name;
  static String? photourl;

  @override
  _AdminInfoPageState createState() => _AdminInfoPageState();
}

class _AdminInfoPageState extends State<AdminInfoPage> {
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
        children: [
          CircleAvatar(
            child: ClipOval(
              child: FadeInImage.assetNetwork(
                image: AdminInfoPage.photourl!,
                placeholder: 'assets/noimage.jpg',
              ),
            ),
            radius: 20,
          ),
        ],
      ),
    );
  }
}
