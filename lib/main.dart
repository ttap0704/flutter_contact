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
  var total = 3;
  var name = ['김영숙', '홍길동', '피자집'];
  var likes = [0, 0, 0];

  void test(String new_name) {
    print(name);
    setState(() {
      name.add(new_name);
      likes.add(0);
      total++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return CustomTest(onSubmit: test);
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text(total.toString()),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('woogi.jpeg'),
            title: Text(name[index]),
          );
        },
        itemCount: total,
      ),
    );
  }
}

class CustomTest extends StatelessWidget {
  CustomTest({Key? key, this.onSubmit}) : super(key: key);
  final onSubmit;

  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: TextField(
        controller: inputData,
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        TextButton(
            onPressed: () {
              onSubmit(inputData.text);
              Navigator.pop(context);
            },
            child: Text('OK')),
      ],
    );
  }
}
