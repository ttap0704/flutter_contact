import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('ㅗㅑㅗㅑ'),
            ),
            bottomNavigationBar: BottomNavBar(),
            body: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text(likes[index].toString()),
                  title: Text(name[index]),
                  trailing: TextButton(
                      onPressed: () {
                        setState(() {
                          likes[index]++;
                        });
                      },
                      child: Text('좋아요')),
                );
              },
              itemCount: 3,
            )));
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Icon(Icons.call), Icon(Icons.note), Icon(Icons.file_copy)],
        ),
      ),
    );
  }
}
