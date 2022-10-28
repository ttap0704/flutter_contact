// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

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
  void getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('허락됨');
      var contacts = await ContactsService.getContacts();
      // print(contacts[0].givenName);

      setState(() {
        name = contacts;
      });
    } else if (status.isDenied) {
      print('거절됨');
      Permission.contacts.request();
    }
  }

  int total = 3;
  List<Contact> name = [];
  List<int> likes = [0, 0, 0];

  void test() {
    setState(() async {
      var contacts = await ContactsService.getContacts();
      // print(contacts[0].givenName);
      setState(() {
        name = contacts;
      });
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
        actions: [
          IconButton(
              onPressed: () {
                getPermission();
              },
              icon: Icon(Icons.contacts)),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset('assets/woogi.jpeg'),
            title: Text(name[index].givenName ?? 'No name'),
          );
        },
        itemCount: name.length,
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
              Navigator.pop(context);
              var newContact = Contact();
              newContact.givenName = inputData.text; //새로운 연락처 만들기
              ContactsService.addContact(newContact); //실제로 연락처에 집어넣기
              onSubmit();
            },
            child: Text('OK')),
      ],
    );
  }
}
