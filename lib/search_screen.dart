import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int currentPage = 1;
  bool isLoading = false;
  dynamic data, dataNumberofSurah, dataNumberInSurah, dataPageSearch;
  TextEditingController controller = TextEditingController();

  late PageController pageController;

  getData(int page) async {
    data = [];
    http.Response response = await http.get(
      Uri.parse('http://api.alquran.cloud/v1/page/$page/quran-uthmani'),
    );

    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = true;
        data = result['data']['ayahs'] as List;
      });
    }
    return null;
  }

  getSearch(String search) async {
    data = [];
    http.Response response = await http.get(
      Uri.parse('https://api.alquran.cloud/v1/search/$search/all/ar'),
    );

    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = true;
        dataNumberofSurah = result['data']['matches'][0]['surah']['number'];
        dataNumberInSurah = result['data']['matches'][0]['numberInSurah'];
        getPageSurah();
      });
      print(dataNumberInSurah);
      print(dataNumberofSurah);
    }
    return null;
  }

  getPageSurah() async {
    data = [];
    http.Response response = await http.get(
      Uri.parse(
          'http://api.alquran.cloud/v1/surah/${dataNumberofSurah}/en.asad'),
    );

    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        isLoading = true;
        dataPageSearch = result['data']['ayahs'][dataNumberInSurah]['page'];
        getData(dataPageSearch);
      });
    }
    getData(dataPageSearch);
    return null;
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1);
    getData(currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: !isLoading
            ? CircularProgressIndicator()
            : SafeArea(
                child: Container(
                  child: PageView.builder(
                    itemCount: 604,
                    controller: pageController,
                    onPageChanged: (page) {
                      setState(() {
                        currentPage = page;
                        getData(page);
                      });
                    },
                    itemBuilder: (BuildContext context, int index) {
                      if (index == currentPage && data.length != 0) {
                        return Container(
                          margin: EdgeInsetsDirectional.all(16),
                          padding: EdgeInsetsDirectional.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 1,
                                    offset: Offset(0, 1))
                              ]),
                          child: SingleChildScrollView(
                            child: RichText(
                              overflow: TextOverflow.visible,
                              textAlign: TextAlign.justify,
                              text: TextSpan(
                                  text: '',
                                  recognizer: DoubleTapGestureRecognizer()
                                    ..onDoubleTap = () {
                                      setState(() {});
                                    },
                                  style: TextStyle(
                                    fontFamily: 'Kitab',
                                    // fontFamily: 'HafsSmart',
                                    color: Colors.black,
                                    fontSize: 24,
                                    // height: 2,
                                    textBaseline: TextBaseline.alphabetic,
                                  ),
                                  children: [
                                    for (int i = 0; i < data.length; i++) ...{
                                      TextSpan(
                                        text: '${data[i]['text']}',
                                      ),
                                      WidgetSpan(
                                        baseline: TextBaseline.alphabetic,
                                        child: Container(
                                          padding: EdgeInsets.all(8),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 6, vertical: 8),
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              opacity: 0.5,
                                              image: AssetImage(
                                                'assets/end.png',
                                              ),
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                              '${data[i]['numberInSurah']}'),
                                        ),
                                      ),
                                    }
                                  ]),
                            ),
                          ),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 200,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: 'Hint Text',
                          helperText: 'Enter In Arabic',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text('Enter to search'), Icon(Icons.send)],
                        ),
                        onPressed: () {
                          print(controller.text);
                          getSearch(controller.text);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
