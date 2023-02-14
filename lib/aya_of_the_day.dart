import 'package:flutter/cupertino.dart';

class AyaOfTheDay {
  final String? arText;
  final String? enTran;
  final String? surEnNAme;
  final int? sureNumber;

  AyaOfTheDay({this.arText, this.enTran, this.surEnNAme, this.sureNumber } );

  factory AyaOfTheDay.fromJSON(Map<String,dynamic> json ){
    return AyaOfTheDay(
    arText:json ['data'][0]['text'],
    enTran:json ['data'][2]['text'],
    surEnNAme:json ['data'][2]['surah']['englishName'],
    sureNumber:json ['data'][2]['numberInSurah']
    );

  }
}
