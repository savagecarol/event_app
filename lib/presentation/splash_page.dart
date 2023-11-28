import 'package:connect/model/global_variable.dart';
import 'package:connect/presentation/pages/Chat.dart';
import 'package:connect/presentation/pages/home_pages.dart';
import 'package:connect/presentation/pages/search.dart';
import 'package:connect/presentation/pages/profile.dart';
import 'package:connect/utils/colors_constants.dart';
import 'package:connect/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  
  _getBody() {
    switch (globalController.globalvariable.value.counter) {
      case 0:
        return HomePage();
      case 1:
        return Search();
      case 2:
        return Chat();
      case 3:
        return Profile();
      default:
        return HomePage();
    }
  }

  _getBottomBar() {
    print(globalController.globalvariable.value.counter);
    return Container(
       decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorConstants.lightRed, //New
                blurRadius: 8.h,
                offset: Offset(0, 2.h))
          ],
          shape: BoxShape.rectangle,
          color: ColorConstants.red,
          borderRadius: BorderRadius.all( Radius.circular(24.r))),
      margin:  EdgeInsets.only(bottom: 12.h , left: 16.w , right:16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _getBottomBarItem(index: 0, icontab: Icons.home),
          _getBottomBarItem(index: 1, icontab: Icons.search),
          _getBottomBarItem(index: 2, icontab: Icons.chat),
          _getBottomBarItem(index: 3, icontab: Icons.account_box),
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
        height: 54.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                color: globalController.globalvariable.value.counter == index
                    ? Colors.white
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Center(
                child: Icon(
                  icontab,
                  color: globalController.globalvariable.value.counter == index
                      ? Colors.black
                      : Colors.white,
                  size: 22.h,
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
            children: <Widget>[
           Expanded(child: _getBody()),
               _getBottomBar()],
          );
        }),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}