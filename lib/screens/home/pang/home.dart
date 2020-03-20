import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterbeta/screens/home/brew_title.dart';
import 'package:projectflutterbeta/screens/home/pang/callcenter.dart';
import 'package:projectflutterbeta/screens/home/pang/convertermoney.dart';
import 'package:projectflutterbeta/screens/home/pang/food.dart';
import 'package:projectflutterbeta/screens/home/pang/mapbangkok.dart';
import 'package:projectflutterbeta/screens/home/pang/mapeast.dart';
import 'package:projectflutterbeta/screens/home/pang/mapnorth.dart';
import 'package:projectflutterbeta/screens/home/pang/mapsouthern.dart';
import 'package:projectflutterbeta/screens/home/pang/mapwest.dart';
import 'package:projectflutterbeta/screens/home/pang/test.dart';
import 'package:provider/provider.dart';
import 'package:projectflutterbeta/models/brew.dart';

class Home_Pang extends StatefulWidget {
  @override
  _Home_PangState createState() => _Home_PangState();
}

class _Home_PangState extends State<Home_Pang> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Center(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              Card(
                child: Material(
                  child: ClipOval(
                    child: Card(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/immages/coin.png'),
                          ),
                        ),
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            //CurrencyConverter
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CurrencyConverter()));
                              //debugPrint('Button clicked');
                            },
                            child: null),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Card(
                child: Material(
                  child: ClipOval(
                    child: Card(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/immages/tableware.png'),
                          ),
                        ),
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => food_pang()));
                              //debugPrint('Button clicked');
                            },
                            child: null),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Center(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              Card(
                child: Material(
                  child: ClipOval(
                    child: Card(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/immages/telephone.png'),
                          ),
                        ),
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Callcente_Page()));
                              //debugPrint('Button clicked');
                            },
                            child: null),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Card(
                child: Material(
                  child: ClipOval(
                    child: Card(
                      child: Container(
                        width: 150.0,
                        height: 150.0,
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/immages/temple.png'),
                          ),
                        ),
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Test123()));
                              //debugPrint('Button clicked');
                            },
                            child: null),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              Card(
                child: Material(
                  child: ClipOval(
                    child: Card(
                      child: Container(
                        width: 340.0,
                        height: 150.0,
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/immages/telephone.png'),
                          ),
                        ),
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => mapbankokPage()));
                              //debugPrint('Button clicked');
                            },
                            child: null),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              Card(
                child: Material(
                  child: ClipOval(
                    child: Card(
                      child: Container(
                        width: 340.0,
                        height: 150.0,
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/immages/telephone.png'),
                          ),
                        ),
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => mapnorthPage()));
                              //debugPrint('Button clicked');
                            },
                            child: null),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              Card(
                child: Material(
                  child: ClipOval(
                    child: Card(
                      child: Container(
                        width: 340.0,
                        height: 150.0,
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/immages/telephone.png'),
                          ),
                        ),
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapsouthernPage()));
                              //debugPrint('Button clicked');
                            },
                            child: null),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              Card(
                child: Material(
                  child: ClipOval(
                    child: Card(
                      child: Container(
                        width: 340.0,
                        height: 150.0,
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/immages/telephone.png'),
                          ),
                        ),
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => mapeastPage()));
                              //debugPrint('Button clicked');
                            },
                            child: null),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 25,
              ),
              Card(
                child: Material(
                  child: ClipOval(
                    child: Card(
                      child: Container(
                        width: 340.0,
                        height: 150.0,
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/immages/telephone.png'),
                          ),
                        ),
                        child: FlatButton(
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => mapwestPage()));
                              //debugPrint('Button clicked');
                            },
                            child: null),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
