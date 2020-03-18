import 'package:flutter/material.dart';

class Callcente_Page extends StatefulWidget {
  @override
  _Callcente_PageState createState() => _Callcente_PageState();
}

class _Callcente_PageState extends State<Callcente_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBartab,
      body: ListView(
        children: <Widget>[
          Image(image: AssetImage('assets/immages/photocallcenter.png'),)
        ],
      )
    );
  }
}


Widget appBartab = AppBar(
  title: Text('Food',style: TextStyle(fontSize: 40, fontFamily: "Samantha")), //ใส่ฟอน
  backgroundColor: Colors.brown[400],
  elevation: 0.0,
);

