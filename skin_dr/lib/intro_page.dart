import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import 'menu.dart';

const pageDecoration =  PageDecoration(
  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
  bodyTextStyle: TextStyle(fontSize: 19.0),
  descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.zero,
);

class IntroPage extends StatelessWidget {

  List<PageViewModel> getPages(){
    return [
      PageViewModel(
        image: Center(
            child: Lottie.asset('assets/time.json')
        ),
        title: 'Say No To Skin Diseases',
        body: 'Check your skin on smartphone and get instant results with in a minite',
        footer: const Text('ICE Batch 2021 @SLTC '),
        decoration: pageDecoration,
      ),
      PageViewModel(
          image: Lottie.asset('assets/robot-ai-help.json'),
          title: 'Machine Leaning',
          body: 'Show your photo to the Machine learning model. The system will analyze it and send you the result.',
          footer: const Text('ICE Batch 2021 @SLTC '),
          decoration: pageDecoration,
      ),
      PageViewModel(
          image: Lottie.asset('assets/spash_bg.json'),
          title: 'Skin Dr',
          body: 'Your Personal ML Dermatologist',
          footer: const Text('Batch 2021 ICE @SLTC '),
          decoration: pageDecoration,
      ),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,elevation: 0),
        body: IntroductionScreen(
          done: const Text(
            'Done',
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
          onDone: (){Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const menu()));},
          pages: getPages(),
          globalBackgroundColor: Colors.white,
          showSkipButton: true, //Is the skip button should be display
          skip: const Text('Skip'),
          next: const Icon(Icons.forward),
        ),
      ),
    );
  }
}