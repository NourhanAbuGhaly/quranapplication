import 'package:flutter/material.dart';
import 'package:quranapplication/Constants.dart';
import 'package:quranapplication/JuzScreen.dart';
import 'package:quranapplication/Surah_datail.dart';

import 'SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quran App',
      theme: ThemeData(
          primarySwatch: Constants.KSwatchColor,
          fontFamily: 'Poppins',
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Constants.KPrimary),
      routes: {
        Surahdetail.id: (context) => Surahdetail(),
        JuzScreen.id: (context) => JuzScreen()
      },
      home: SplashScreen(),
    );
  }
}

/*
 *  Copyright 2020 chaobinwu89@gmail.com
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
//
//
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:quranapplication/search_screen.dart';
// import 'package:quranapplication/home_screen.dart';
// import 'package:quranapplication/prayer_screen.dart';
// import 'package:quranapplication/quran_screen.dart';
//
//
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   State createState() => _State();
// }
//
// class _State extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: "/",
//       routes: {
//         "/": (_) => QuranScreen(),
//         "/prayer": (BuildContext context) => PrayerScreen(),
//         "/audio": (BuildContext context) => AudioScreen(),
//         "/home": (BuildContext context) => HomeScreen(),
//       },
//     );
//   }
// }
//
// class HelloConvexAppBar extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Hello ConvexAppBar')),
//       body: Center(
//           child: TextButton(
//             child: Text('Click to show full example'),
//             onPressed: () => Navigator.of(context).pushNamed('/prayer'),
//           )),
//       bottomNavigationBar: ConvexAppBar(
//         style: TabStyle.react,
//         items: [
//           TabItem(icon: Icons.list),
//           TabItem(icon: Icons.calendar_today),
//           TabItem(icon: Icons.assessment),
//         ],
//         initialActiveIndex: 1,
//         onTap: (int i) => print('click index=$i'),
//       ),
//     );
//   }
// }
