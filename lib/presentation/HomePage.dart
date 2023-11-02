import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Color x = Colors.black;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            x = Colors.pink;
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
                Text("PIYUSH APP"),
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
        body: Container(),
      ),
    );
  }
}
