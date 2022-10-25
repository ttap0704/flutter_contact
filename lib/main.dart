import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: const [
              Text('플러터 앱임')
            ]
          )
        ),
        body: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: double.infinity,
            height: 50,
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              color: Colors.blue,
            ),
          ),
        )
      )
    );
  }
}
