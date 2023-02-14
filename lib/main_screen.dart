import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:quranapplication/Constants.dart';
import 'package:quranapplication/search_screen.dart';
import 'package:quranapplication/home_screen.dart';
import 'package:quranapplication/quran_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectIndex = 0;
  List<Widget> _widgetList = [
    HomeScreen(),
    QuranScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: _widgetList[selectIndex],
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(
                  icon: Image.asset(
                    'assets/home.png',
                    color: Colors.white,
                  ),
                  title: 'Home'),
              TabItem(
                  icon: Image.asset(
                    'assets/holyQuran.png',
                    color: Colors.white,
                  ),
                  title: 'Quran'),
              TabItem(
                  icon: Icon(Icons.search_rounded,
                    color: Colors.white,
                    size: 28,
                  ),title: 'search'),

            ],
            initialActiveIndex: 0,
            onTap: updateIndex,
            backgroundColor: Constants.KPrimary,
            activeColor: Constants.KPrimary,
          )),
    );
  }

  void updateIndex(index) {
    setState(() {
      selectIndex = index;
    });
  }
}
