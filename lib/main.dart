import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var name = ['김영숙', '홍길동', '피자집'];
  var likes = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Contact'),
                content: TextField(),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  TextButton(onPressed: () {}, child: Text('Ok')),
                ],
              );
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text('ㅗㅑㅗㅑ'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('woogi.jpeg'),
            title: Text(name[index]),
          );
        },
        itemCount: 3,
      ),
    );
  }
}
