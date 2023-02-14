import 'package:flutter/material.dart';
import 'package:quranapplication/Constants.dart';
import 'package:quranapplication/api_services.dart';

import 'JuzCustomTile.dart';
import 'juz.dart';

class JuzScreen extends StatelessWidget {
  static const String id = 'juz_screen';

  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder<JuzModel>(
          future: apiServices.getJuzz(Constants.juzIndex!),
          builder: (context, AsyncSnapshot<JuzModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              print("${snapshot.data!.juzAyahs.length} length");
              return ListView.builder(
                itemCount: snapshot.data!.juzAyahs.length,
                itemBuilder: (context, index) {
                  return JuzCustomTile(
                      list: snapshot.data!.juzAyahs, index: index);
                },
              );
            } else {
              return Center(
                child: Text(
                  "Data not found",
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
