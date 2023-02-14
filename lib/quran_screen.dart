import 'package:flutter/material.dart';
import 'package:quranapplication/Sajda.dart';
import 'package:quranapplication/Surah_datail.dart';
import 'package:quranapplication/api_services.dart';
import 'package:quranapplication/Surah.dart';

import 'Constants.dart';
import 'JuzScreen.dart';
import 'SajdaCustomTile.dart';
import 'SurahCustomListTile.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: Text("Quran"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Text(
                "Surah",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "sajda",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "Juz",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: apiServices.getSurah(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Surah>> snapshot) {
                if (snapshot.hasData) {
                  List<Surah>? surah = snapshot.data;
                  return ListView.builder(
                      itemCount: surah!.length,
                      itemBuilder: (context, index) => SurahCustomListTile(
                          surah: surah[index],
                          context: context,
                          ontap: () {
                            setState(() {
                              Constants.surahIndex = (index + 1);
                            });

                            Navigator.pushNamed(context, Surahdetail.id);
                          }));
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            FutureBuilder(
                future: apiServices.getSajda(),
                builder: (context, AsyncSnapshot<SajdaList> snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Something went wrong"),
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView.builder(
                      itemCount: snapshot.data!.sajdaAyahs.length,
                      itemBuilder: (context, index) => SajdaCustomTile(
                          snapshot.data!.sajdaAyahs[index], context));
                }),
            GestureDetector(
                child: Container(
              padding: EdgeInsets.all(8.0),
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          Constants.juzIndex = (index + 1);
                        });
                        Navigator.pushNamed(context, JuzScreen.id);
                      },
                      child: Card(
                        elevation: 4,
                        color: Colors.blueGrey,
                        child: Center(
                            child: Text(
                          "${index + 1}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                      ),
                    );
                  }),
            ))
          ],
        ),
      )),
    );
  }
}
