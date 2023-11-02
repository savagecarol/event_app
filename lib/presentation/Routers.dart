import 'package:event_app/presentation/HomePage.dart';
import 'package:event_app/presentation/HomePageBrother.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Routers extends StatefulWidget {
   Routers({super.key , required this.x});
  String x;

  @override
  State<Routers> createState() => _RouterState();
}

class _RouterState extends State<Routers> {
  bool isLoading = false;
  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: (!isLogin)
          ? Container(
              child: Center(
                child: InkWell(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });
                    await Future.delayed(Duration(seconds: 10));
                    setState(() {
                      isLoading = false;
                      isLogin = true;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.amber,
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Colors.black,
                          )
                        : Text(widget.x),
                  ),
                ),
              ),
            )
          : HomePage(),
    ));
  }

  
}


