import 'package:flutter/material.dart';
import 'package:quranapplication/SurahTranslationList.dart';
import 'package:quranapplication/api_services.dart';

import 'Constants.dart';
import 'TranslationTile.dart';

class Surahdetail extends StatefulWidget {
  static const String id = 'surahDetail_screen';

  @override
  State<Surahdetail> createState() => _SurahdetailState();
}

class _SurahdetailState extends State<Surahdetail> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiServices.getTranslation(Constants.surahIndex!),
        builder: (BuildContext context,
            AsyncSnapshot<SurahTranslationList> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.translationList.length,
              itemBuilder: (context, index) {
                return TranslationTile(
                    index: index,
                    surahTranslation: snapshot.data!.translationList[index]);
              },
            );
          } else
            return Center(
              child: Text('Translation Not found'),
            );
        },
      ),
    );
  }
}
