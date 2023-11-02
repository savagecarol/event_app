import 'package:event_app/presentation/HomePage.dart';
import 'package:event_app/presentation/HomePageBrother.dart';
import 'package:event_app/presentation/Routers.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'event_app',
      home:   Routers(x: "edfere"),
    );
  }
}

