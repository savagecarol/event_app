import 'package:event_app/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> k = [0, 1, 2, 3, 4, 5, 6, 7, 8, 3, 3, 3 , 2 , 2 , 2 , 2 , 2,2];

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
          ),
          Builder(builder: ((context) {
            for (int i = 0; i < k.length; i++) {
              if (k[i] % 2 == 0) count++;
            }

            if (count <= 5) {
              print("AAAA");
              return Text("PIYUSH", style: TextStyle(fontSize: 60));
            } else if (count > 5 && count <= 10) {
                       print("BBB");
              return Text("PIYUSH", style: TextStyle(fontSize: 50));
            } else if (count > 10) {
                       print("CCCC");
              return Text("PIYUSH", style: TextStyle(fontSize: 40));
            }
            {
                       print("DDDD");
              return Text("PIYUSH", style: TextStyle(fontSize: 30));
            }
          })),
        ],
      ),
    );
  }
}
