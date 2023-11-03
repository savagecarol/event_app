import 'package:event_app/presentation/pages/home_pages.dart';
import 'package:event_app/presentation/pages/post.dart';
import 'package:event_app/presentation/pages/profile.dart';
import 'package:event_app/utils/global.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 
  _getBody() {
    switch (currentPage) {
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
        setState(() {
          currentPage = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(5), 
              decoration: BoxDecoration(
                color: currentPage == index ? Colors.black : Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Icon(
                  icontab,
                  color: currentPage == index ? Colors.white : Colors.black38,
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
        body: Column(
          children: <Widget>[Expanded(child: _getBody()), _getBottomBar()],
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}
