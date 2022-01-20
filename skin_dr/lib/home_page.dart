import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:skin_dr/intro_page.dart';

import 'menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => IntroPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: 300,
            //   width: 300,
            //   child: Lottie.asset('assets/spash_bg.json'),
            //   // Lottie.network('https://assets5.lottiefiles.com/packages/lf20_yubjrwy7/doctors.json'),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            const Text("Skin Dr",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
