import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({Key? key}) : super(key: key);

  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2C384A),
      appBar: AppBar(
        title: Text('Edit Page'),
        centerTitle: true,
        backgroundColor: Color(0xFFF57C00),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: Color(0xFF2C384A),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
