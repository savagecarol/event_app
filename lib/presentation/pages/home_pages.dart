import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> k = [0, 1, 2, 3, 4, 5, 6, 7, 8, 3, 3, 3, 2, 2, 2, 2, 2, 2];

  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
