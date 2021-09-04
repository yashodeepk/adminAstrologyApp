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
        backgroundColor: Color(0xFFF57C00),
      ),
      backgroundColor: Color(0xFF2C384A),
      body: Container(),
    );
  }
}
