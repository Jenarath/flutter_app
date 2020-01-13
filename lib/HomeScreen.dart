import 'package:flutter/material.dart';

import 'package:enetb/FirstScreen.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({
    @required this.userId,
  });
  final userId;

  @override
  HomeScreentState createState() => new HomeScreentState(userId == null ? '0' : userId);

}


class HomeScreentState extends State<HomeScreen> {

    HomeScreentState(this.userId);  //constructor
    final userId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('หน้าหลัก'),
          leading: new IconButton(icon: new Icon(Icons.account_circle),
              onPressed: () => {
              Navigator.of(context)
                  .push(MaterialPageRoute<Null>(builder: (BuildContext context) { return new FirstScreen();
              }))
              }),
          ),
        body: Container(
            padding: EdgeInsets.only(top: 50.0, left: 80, right: 80),
            child: SingleChildScrollView(
              child:
              Text(userId == '0' ? 'หน้าหลัก' : 'เข้าสู่ระบบเรียบร้อย : ${userId}'),

            )
        )
    );
  }
}

