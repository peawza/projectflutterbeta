import 'dart:io';

import 'package:projectflutterbeta/models/brew.dart';
import 'package:projectflutterbeta/screens/home/appbar.dart';
import 'package:projectflutterbeta/screens/home/brew_list.dart';
import 'package:projectflutterbeta/screens/home/pang/Message.dart';
import 'package:projectflutterbeta/screens/home/pang/dataprofileupdate.dart';
import 'package:projectflutterbeta/screens/home/pang/home.dart';
import 'package:projectflutterbeta/screens/home/pang/updateprofile.dart';
import 'package:projectflutterbeta/screens/home/settings_form.dart';
import 'package:projectflutterbeta/screens/home/pang/profile.dart';
import 'package:projectflutterbeta/services/auth.dart';
import 'package:projectflutterbeta/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectflutterbeta/models/user.dart';

final AuthService _auth = AuthService();


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

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
      child: StreamBuilder(
          stream: Firestore.instance
              .collection('user')
              .document(user.uid)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/immages/back.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white30,
                    backgroundImage: NetworkImage(snapshot.data['photo']),
                    maxRadius: 50,
                  ),
                  accountName: Text(
                    snapshot.data['Nickname'],
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                  ),
                  accountEmail: Text(
                    snapshot.data['email'],
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
                CustomListTile(
                  Icons.person,
                  'Profile',
                  () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => profile())),
                ),
                CustomListTile(
                    Icons.edit,
                    'Editphoto',
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfilePage()))),
                CustomListTile(
                    Icons.edit,
                    'Editprofile',
                    () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => profiledate()))),
                //

                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(color: Colors.grey.shade400))),
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
            );
          }),
    );

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: appBartab,
        drawer: Mydrawertab1,
        body: Home_Pang(),


      ),
    );
  }
}

Widget appBartab = AppBar(
  title: Row(
    children: <Widget>[
      SizedBox(
        width: 20,
      ),
      Center(
          child: Image.asset(
        'assets/immages/aroundthailand-Recovered.png',
        width: 200,
        height: 90,
      )),
    ],
  ),
  backgroundColor: Colors.orange[200],
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



