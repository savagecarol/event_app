import 'package:connect/presentation/components/custom_post_card.dart';
import 'package:connect/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 16.h , horizontal: 16.w),
        child: Column(
          children: [
            for(int i = 0 ; i < postList.length  ; i++)
                CustomPostCard(
                  post : postList[i]
                )
          ],
        ),
      ),
    );
  }
}
