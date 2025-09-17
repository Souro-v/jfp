import 'package:flutter/material.dart';

class RetailerLogin extends StatefulWidget {
  const RetailerLogin({super.key});
  static const String name='/retailer_login';

  @override
  State<RetailerLogin> createState() => _RetailerLoginState();
}

class _RetailerLoginState extends State<RetailerLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retailer Login',selectionColor: Colors.white),
        backgroundColor: Colors.white24,
      ),
    );
  }
}
