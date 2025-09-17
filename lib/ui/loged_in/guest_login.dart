import 'package:flutter/material.dart';

class GuestLogin extends StatefulWidget {
  const GuestLogin({super.key});
  static  const String name='/guest_login';

  @override
  State<GuestLogin> createState() => _GuestLoginState();
}

class _GuestLoginState extends State<GuestLogin> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Guest Login',selectionColor: Colors.white),
        backgroundColor: Colors.white24,
      ),
    );
  }
}
