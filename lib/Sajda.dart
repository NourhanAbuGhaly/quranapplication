

class SajdaList{
  final List<SajdaAyat> sajdaAyahs;

  SajdaList({required this.sajdaAyahs});
  factory SajdaList.fromJSON(Map<String,dynamic> json){
    Iterable allSajdas=json['data']['ayahs'];
    List<SajdaAyat> sajdas =allSajdas.map((e) => SajdaAyat.fromJSON(e)).toList();
    return SajdaList(sajdaAyahs: sajdas);
  }
  
}
class SajdaAyat {
  final int number;
  final String text;
  final String surahNmae;
  final String surahEnglishName;
  final String englisNameTranslation;
  final String revelationType;
  final int juzNumber;
  final int manzilNumber;
  final int rukuNumber;
  final int sajdaNumber;

  SajdaAyat(
      {required this.number,
      required this.text,
      required this.surahNmae,
      required this.englisNameTranslation,
      required this.surahEnglishName,
      required this.revelationType,
      required this.juzNumber,
      required this.manzilNumber,
      required this.rukuNumber,
      required this.sajdaNumber});

  factory SajdaAyat.fromJSON(Map<String, dynamic> json) {
    return SajdaAyat(
        number: json['number'],
        text: json['text'],
        surahNmae: json['surah']['name'],
        englisNameTranslation: json['surah']['englishNameTranslation'],
        surahEnglishName: json['surah']['englishName'],
        revelationType: json['surah']['revelationType'],
        juzNumber: json['juz'],
        manzilNumber: json['manzil'],
        rukuNumber: json['ruku'],
        sajdaNumber: json['sajda']['id']);
  }
}
