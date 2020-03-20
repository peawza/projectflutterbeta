import 'dart:io';

import 'package:projectflutterbeta/models/brew.dart';
import 'package:projectflutterbeta/screens/home/appbar.dart';
import 'package:projectflutterbeta/screens/home/brew_list.dart';
import 'package:projectflutterbeta/screens/home/pang/home.dart';
import 'package:projectflutterbeta/screens/home/settings_form.dart';
import 'package:projectflutterbeta/screens/home/pang/profile.dart';
import 'package:projectflutterbeta/services/auth.dart';
import 'package:projectflutterbeta/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final AuthService _auth = AuthService();

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    Widget Mydrawertab1 = Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Colors.red,
                Colors.white,
                Colors.blue,
                Colors.white,
                Colors.red,
              ])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/immages/rsm2.jpg',
                            width: 100,
                            height: 100,
                          )),
                    ),
                    Text(
                      'Name',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ],
                ),
              )),
          CustomListTile(
            Icons.person,
            'Profile',
            () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => profile())),
          ),
          CustomListTile(Icons.edit, 'Changed-Password', () => {}),
          CustomListTile(Icons.settings, 'Setting', () => {}),
          //

          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
            child: Container(
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey.shade400))),
              child: InkWell(
                splashColor: Colors.orangeAccent,
                onTap: () async {
                  Navigator.pop(context);
                  {
                    await _auth.signOut();
                  }
                },
                child: Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.exit_to_app),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Logout',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ),
            ),
          ),

          //
          CustomListTile(Icons.exit_to_app, 'exitApp', () => exit(0)),
        ],
      ),
    );

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: appBartab,

        /*
        AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),*/
        drawer: Mydrawertab1,
        body: Home_Pang(),
      ),
    );
  }
}

Widget appBartab = AppBar(
  title: Text('Brew Crew'),
  backgroundColor: Colors.brown[400],
  elevation: 0.0,
  actions: <Widget>[
    FlatButton.icon(
      icon: Icon(Icons.person),
      label: Text('logout'),
      onPressed: () async {
        await _auth.signOut();
      },
    ),
  ],
);

class CustomListTile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
          splashColor: Colors.orangeAccent,
          onTap: onTap,
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
