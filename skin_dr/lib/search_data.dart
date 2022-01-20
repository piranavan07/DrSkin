import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class SearchData extends StatefulWidget {
  const SearchData({Key? key}) : super(key: key);

  @override
  _SearchDataState createState() => _SearchDataState();
}

class _SearchDataState extends State<SearchData> {
  List _items = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/db/database.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Load Data'),
              onPressed: readJson,
            ),
            _items.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return _listdata(index);
                },
              ),
            )
                : Container()
          ],
        ),
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

  _listdata(index) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue[100],
          child: Text(_items[index]["title"][0].toUpperCase(),
          style: TextStyle(
            fontSize: 26
          ),),
            // GestureDetector(onTap: () {}),
        ),
        title: Text(_items[index]["title"],
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Color(0xFF302f51),
          ),),
        // title: Text(_items[index]["symptoms"]),
        // subtitle: Text(_items[index]["description"]),
      ),
    );
  }
}
