import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medizine2/Screens/DashBoardpage.dart';
import 'package:medizine2/Screens/HomePage.dart';
import 'package:medizine2/Screens/LearnPage.dart';
import 'package:medizine2/Screens/SettingsPage.dart';
import 'package:medizine2/globalConst.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return MaterialApp(
      title: 'Rapid Resume',
      debugShowCheckedModeBanner: false,
      home: Main(),
    );
  }
}

//Home page widget
class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  void pageChanged(int index) {
    setState(() {
      if (!tap) {
        currentPageIndex = index;
      }
    });
  }

  //sliding page view
  int currentPageIndex = 0;
  late bool tap = false;
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget pageViewBuilder() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: PageView(
        controller: pageController,
        allowImplicitScrolling: true,
        onPageChanged: (index) {
          pageChanged(index);
        },
        children: <Widget>[
          HomePage(),
          DashboardPage(),
          LearnPage(),
          SettingsPage()
        ],
      ),
    );
  }

  //temporary bottom navigation bar may redesign
  //this tap thing is to prevent the pageView from setState while we change the pages by tapping

  void navigationBarTap(int index) {
    setState(() {
      tap = true;
      currentPageIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 400), curve: Curves.ease);
      Timer(Duration(milliseconds: 300), () {
        tap = false;
      });
    });
  }

  Widget navButton(IconData icon1, IconData icon2, String navName, int index) {
    return Material(
      elevation: 0,
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
        color: Colors.white,
        child: Center(
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(2, 2, 0, 0),
                child: Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                      color: currentPageIndex == index
                          ? secondaryColor
                          : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),
              ),
              IconButton(
                icon: currentPageIndex == index
                    ? Icon(icon1, color: Colors.black87)
                    : Icon(icon2, color: Colors.black),
                onPressed: () {
                  navigationBarTap(index);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pageViewBuilder(),
        bottomNavigationBar: Row(
          children: [
            navButton(Icons.home, Icons.home_outlined, 'Home', 0),
            navButton(Icons.school, Icons.school_outlined, 'Scanner', 1),
            navButton(Icons.storage, Icons.storage_outlined, 'Resume', 2),
            navButton(Icons.settings, Icons.settings_outlined, 'Settings', 3)
          ],
        ));
  }
}
