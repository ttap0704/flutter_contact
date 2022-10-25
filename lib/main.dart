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
          title: SizedBox(
            child: Row(
              children: const[
                Text('금호동3가',
                  style: TextStyle(color: Colors.black),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.black,)
              ]
            ),
          ),
          actions: const [
            Icon(Icons.search, color: Colors.black,),
            Icon(Icons.menu, color: Colors.black,),
            Icon(Icons.alarm, color: Colors.black,),
          ],
          backgroundColor: Colors.white,
        ),
        body: SizedBox(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  child: Image.asset('woogi.jpeg'),
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.only(right: 10),
                ),
                SizedBox(
                  width: 230,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                        textAlign: TextAlign.left,
                      ),
                      Text('성동구 행당동 - 끌올 10분 전', style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),textAlign: TextAlign.left,),
                      Text('210,000원', textAlign: TextAlign.left,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Icon(Icons.star),
                          Text('4')
                        ]
                      )
                    ],
                  ),
                )
              ]
            ),
          )
        )
      )
    );
  }
}
