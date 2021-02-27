import 'package:flutter/material.dart';

class Callcente_Page extends StatefulWidget {
  @override
  _Callcente_PageState createState() => _Callcente_PageState();
}

class _Callcente_PageState extends State<Callcente_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: ListView(
        children: <Widget>[
          Image(image: AssetImage('assets/immages/photocallcenter.png'),)
        ],
      )
    );
  }
}


Widget appBar = AppBar(
  title: Text('Callcenter',style: TextStyle(fontSize: 40, fontFamily: "Samantha")), //ใส่ฟอน
  backgroundColor: Colors.orange[200],
  elevation: 0.0,
);

