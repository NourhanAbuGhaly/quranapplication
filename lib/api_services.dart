import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:quranapplication/Sajda.dart';
import 'package:quranapplication/SurahTranslationList.dart';

import 'Surah.dart';
import 'aya_of_the_day.dart';
import 'juz.dart';

class ApiServices {
  final endPointUrl = "http://api.alquran.cloud/v1/surah";
  List<Surah> list = [];

  Future<AyaOfTheDay> getAyaOfDay() async {
    // for random Aya we need to generate random number
    // (1,6237) from 1 from  6237
    String url =
        'http://api.alquran.cloud/v1/ayah/${random(1, 6237)}/editions/quran-uthmani,en.asad,en.pickthall';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return AyaOfTheDay.fromJSON(jsonDecode(response.body));
    } else {
      print('Failed to load ');
      throw ("Failed to load post");
    }
  }

  random(min, max) {
    var rn = new Random();
    return min + rn.nextInt(max - min);
  }

  Future<List<Surah>> getSurah() async {
    http.Response res = await http.get(Uri.parse(endPointUrl));
    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);
      json['data'].forEach((element) {
        if (list.length < 114) {
          list.add(Surah.fromJson(element));
        }
      });
      return list;
    } else {
      throw (" Can't get the Surah ");
    }
  }

  Future<SajdaList> getSajda() async {
    String Url = "http://api.alquran.cloud/v1/sajda/en.asad";
    http.Response res = await http.get(Uri.parse(Url));
    if (res.statusCode == 200) {
      return SajdaList.fromJSON(json.decode(res.body));
    } else {
      throw Exception("Fail to load Post");
    }
  }
  Future<JuzModel> getJuzz(int index) async{
    String url ="http://api.alquran.cloud/v1/juz/$index/quran-uthmani";
    final response =await http .get(Uri.parse(url));
    if (response.statusCode==200){
      return JuzModel.fromJSON(json.decode(response.body));
    }else {
      print("Faild to load ");
      throw Exception("Failed to load Post");
    }
  }
  Future <SurahTranslationList> getTranslation (int index) async{
    final url ="https://quranenc.com/api/translation/sura/urdu_junagarhi/$index";
    var res=await http.get(Uri.parse(url));
    return SurahTranslationList.fromJSON(json.decode(res.body));
  }

}
