import 'package:event_app/utils/url_constants.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  /* 
  CALLED WHEN PAGE IS BUILD 
  ----> login function called in async 
   */

  @override
  void initState() {
    super.initState();
    _isLogin();
  }

  _isLogin() async {
    await Future.delayed(Duration(seconds: 1));
    await Navigator.popAndPushNamed(context, Urlconstants.firstPageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.amber,
        ),
      ),
    );
  }
}
