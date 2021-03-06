import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class menu extends StatefulWidget {
  const menu({Key? key}) : super(key: key);

  @override
  _menuState createState() => _menuState();
}

class _menuState extends State<menu> {
  List info = [];

  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("assets/database.json")
        .then((value) => {info = json.decode(value)});
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Skin dr"),
      // ),
      backgroundColor: const Color(0xFFfbfcff),
      body: Container(
        padding: const EdgeInsets.only(
          top: 70,
          left: 30,
          right: 20,
        ),
        child: Column(
          children: [
            Row(
              children: const [
                Text(
                  "Skin Dr",
                  style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFF302f51),
                      fontWeight: FontWeight.w700),
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.chat,
                  size: 30,
                  color: Color(0xFF3b3c5c),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text(
                  "Easy way to find your skin diseases",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF414160),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color(0xff0f17ad).withOpacity(0.8),
                  const Color(0xFF6985e8).withOpacity(0.9)
                ], begin: Alignment.bottomLeft, end: Alignment.centerRight),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(10, 10),
                    blurRadius: 20,
                    color: Color(0xFF6985e8),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Step 1 0f 3",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xfff4f5fd),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      top: 30,
                    ),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(20),
                      // image: const DecorationImage(
                      //   image: AssetImage(""),
                      //   fit: BoxFit.fill,
                      // ),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 40,
                          offset: Offset(8, 8),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      left: 50,
                      bottom: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "No Records Found!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xfff4f5fd)),
                        ),
                        // SizedBox(),
                        Lottie.asset('assets/reported.json'),
                      ],
                    ),
                    // decoration: BoxDecoration(
                    //   // color: Colors.redAccent.withOpacity(0.2),
                    //   // borderRadius: BorderRadius.circular(10),
                    //   // image: const DecorationImage(
                    //   //   image: AssetImage(""),
                    //   // fit: BoxFit.fill,
                    //   // ),
                    // ),
                  ),
                  // Container(
                  //   width: double.maxFinite,
                  //   height: 100,
                  //   color: Colors.redAccent.withOpacity(0.2),
                  //   margin: const EdgeInsets.only(right: 150, top: 50),
                  //   child: Column(
                  //     children: [
                  //       const Text(
                  //         "You can create new case.",
                  //         style: TextStyle(
                  //           fontSize: 15,
                  //           fontWeight: FontWeight.bold,
                  //           color: Color(0xff6588f4),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            Row(
              children: const [
                Text(
                  "Our database",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF302f51),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: info.length,
                  itemBuilder: (_, i) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          // child: Lottie.asset('assets/skin.json'),
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(10),
                          alignment: Alignment.centerLeft,
                          height: 100,
                          padding: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                alignment: Alignment.centerLeft,
                                image: AssetImage("assets/skin.gif")),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(5, 5),
                                color: Colors.black26,
                              ),
                              BoxShadow(
                                blurRadius: 3,
                                offset: Offset(-5, -5),
                                color: Colors.black26,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                info[i]["title"],
                                // "Skin disease",
                                style: const TextStyle(
                                    fontSize: 20, color: Color(0xff6588f4)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera_alt),
        onPressed: () {
          print('Open camera .. ');
          print(info);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'me',
          ),
        ],
      ),
    );
  }
}
