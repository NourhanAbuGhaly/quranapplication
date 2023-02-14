import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:quranapplication/Constants.dart';
import 'package:quranapplication/main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: IntroductionScreen(
              pages: [
                PageViewModel(
                  title: "Read Quran",
                  bodyWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Customize Your reading view ,read in  multiple language,Listen different audio",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  image: Center(
                    child: Image.asset(
                      'assets/quran.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                PageViewModel(
                  title: "Prayer Alerts",
                  bodyWidget: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Customize Your adhan , which prayer to be notified of and how often .",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  image: Center(
                    child: Image.asset(
                      'assets/prayer.png',
                      //  fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                PageViewModel(
                  title: "Build Better Habits",
                  bodyWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          " Make Islamic practices a part of your daily life in a way that bst suits your life",
                            textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                  image: Center(
                    child: Image.asset(
                      'assets/zakat.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ],
              showNextButton: true,
              skip: const Icon(Icons.skip_next),
              next: const Icon(
                Icons.arrow_forward,
                color: Colors.black,
              ),
              done: const Text("Done",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black)),
              onDone:
                () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainScreen())),

                // On Done button pressed

              // onSkip: () {
              //   // On Skip button pressed
              // },

              dotsDecorator: DotsDecorator(
                size: const Size.square(10.0),
                activeSize: const Size(20.0, 10.0),
                activeColor: Constants.KPrimary,
                color: Colors.grey,
                spacing: const EdgeInsets.symmetric(horizontal: 3.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            )));
  }
}
