import 'package:event_app/presentation/components/custom_text.dart';
import 'package:event_app/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  Widget backgroundImageContainer() {
    return Container(
        height: 200,
        color: ColorConstants.lightRed,
        child: Center(
          child: headingText("SETTINGS"),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          expandedHeight: 100,
          flexibleSpace: FlexibleSpaceBar(
              background: Container(
                  decoration: BoxDecoration(
            color: ColorConstants.darkRed,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
          ))),

          floating: true, // Your appBar appears immediately
          pinned: true, // Your appBar pinned to top
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return ListTile(
            title: Text("DSFdsf"),
          );
        }))
      ]),
    );
  }
}
