import 'package:connect/utils/url_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    super.initState();
    _isLogin();
  }

  _isLogin() async {
    await Future.delayed(Duration(seconds: 1));
    Get.offNamed(Urlconstants.firstPageUrl);
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
