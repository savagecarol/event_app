import 'package:connect/presentation/pages/home_pages.dart';
import 'package:connect/presentation/pages/post.dart';
import 'package:connect/presentation/pages/profile.dart';
import 'package:connect/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  _getBody() {
    print(globalController.globalvariable.value.counter);
    switch (globalController.globalvariable.value.counter) {
      case 0:
        return HomePage();
      case 1:
        return Post();
      case 2:
        return Profile();
      default:
        return HomePage();
    }
  }

  _getBottomBar() {
    print(globalController.globalvariable.value.counter);
    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      margin: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _getBottomBarItem(index: 0, icontab: Icons.home),
          _getBottomBarItem(index: 1, icontab: Icons.add),
          _getBottomBarItem(index: 2, icontab: Icons.no_accounts_outlined),
        ],
      ),
    );
  }

  Widget _getBottomBarItem({required int index, required IconData icontab}) {
    return GestureDetector(
      onTap: () {
        globalController.changeCounter(index);
        print("value changed -----> " +
            globalController.globalvariable.value.counter.toString());
      },
      child: Container(
        alignment: Alignment.center,
        height: 60.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                color: globalController.globalvariable.value.counter == index
                    ? Colors.black
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Center(
                child: Icon(
                  icontab,
                  color: globalController.globalvariable.value.counter == index
                      ? Colors.white
                      : Colors.black38,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() {
          return Column(
            children: <Widget>[Expanded(child: _getBody()), _getBottomBar()],
          );
        }),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
