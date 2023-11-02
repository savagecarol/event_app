import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageBrother extends StatefulWidget {
  const HomePageBrother({super.key});

  @override
  State<HomePageBrother> createState() => _HomePageBrotherState();
}

class _HomePageBrotherState extends State<HomePageBrother> {
  Color x = Colors.black;
  var t = "dhhhhhh";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          onPressed: () {
            setState(() {
              t = "kartik app";
              int p = Random().nextInt(255);
              x = Color.fromRGBO(p, p, p, .5);
            });
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          shadowColor: Colors.grey,
          toolbarHeight: 70,
          title: Container(
            color: x,
            child: Column(
              children: [
                Text(t),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.chat),
                    Icon(Icons.add),
                    Icon(Icons.logout)
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Container(
          height: 500,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < 10;i++)
                 Container(
                  padding: const EdgeInsets.all(8) , 
                 color: Colors.blue,
                 margin: const EdgeInsets.all(8),
                 child: Column(
                   children: [
                     Container( height: 300, color: Colors.greenAccent, ),
                     SizedBox(height: 10,),
                     Text("PIYUSH POST")
                   ],
                 ),
                 )
              ],
            ),
          ),
        ),
      ),
    
    );
  }
}
