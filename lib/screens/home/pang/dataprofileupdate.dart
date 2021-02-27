import 'package:flutter/material.dart';
import 'package:projectflutterbeta/models/user.dart';
import 'package:projectflutterbeta/models/userprofile.dart';
import 'package:projectflutterbeta/services/database.dart';
import 'package:projectflutterbeta/shared/constants.dart';
import 'package:projectflutterbeta/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

final database = Firestore.instance;
// form values
String _name;
String _email;
String _phone;

class profiledate extends StatefulWidget {
  @override
  _profiledateState createState() => _profiledateState();
}

final _formKey = GlobalKey<FormState>();

class _profiledateState extends State<profiledate> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(

        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/immages/backbg.png"),
                    fit: BoxFit.cover),
              ),
            ),
            ListView(
              children: <Widget>[
                StreamBuilder(
                    stream: Firestore.instance
                        .collection('user')
                        .document(user.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        //UserData userData = snapshot.data;
                        //print(snapshot.data);
                        print(snapshot.data['Nickname']);
                        print(snapshot.data['Phone']);
                        print(snapshot.data['email']);
                        print(snapshot.data['photo']);
                        print(snapshot.data['uid']);
                        //print('11');
                        print(user.uid);
                        //String  ID = userData.uid;

                        //print(ID);
                        //print(userData.name);
                        final photo = snapshot.data['photo'];
                        final Nickname = snapshot.data['Nickname'];
                        final url = snapshot.data['uid'];
                        final email = snapshot.data['email'];
                        final phone = snapshot.data['Phone'];
                        return SafeArea(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    IconButton(
                                      padding: EdgeInsets.only(left: 30.0,top: 20),
                                      onPressed: () => Navigator.pop(context),
                                      icon: Icon(Icons.arrow_back),
                                      iconSize: 40.0,
                                      color: Colors.black,
                                    ),

                                  ],
                                ),


                                CircleAvatar(
                                  radius: 100,
                                  backgroundImage: NetworkImage(photo),
                                ),
                                InfoCard(
                                  text: email,
                                  icon: Icons.email,
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 200,
                                  child: Divider(
                                    color: Colors.teal.shade700,
                                  ),
                                ),
                                Container(
                                  child: Card(
                                    color: Colors.white,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 25.0),
                                    child: TextFormField(
                                      initialValue: snapshot.data['Nickname'],
                                      decoration: InputDecoration(
                                          labelText: '   Name',
                                          labelStyle: TextStyle(fontSize: 15.0)),
                                      validator: (val) => val.isEmpty
                                          ? 'Please enter a name'
                                          : null,
                                      onChanged: (val) =>
                                          setState(() => _name = val),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 200,
                                  child: Divider(
                                    color: Colors.teal.shade700,
                                  ),
                                ),
                                Container(
                                  child: Card(
                                    color: Colors.white,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 25.0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      initialValue: snapshot.data['Phone'],
                                      decoration: InputDecoration(
                                          labelText: '    Phone',
                                          labelStyle: TextStyle(fontSize: 15.0)),
                                      validator: (val) => val.isEmpty
                                          ? 'Please enter a phone'
                                          : null,
                                      onChanged: (val) =>
                                          setState(() => _phone = val),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    RaisedButton(
                                      color: Color(0xff476cfb),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      elevation: 4.0,
                                      splashColor: Colors.blueGrey,
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16.0),
                                      ),
                                    ),
                                    RaisedButton(
                                      color: Color(0xff476cfb),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          if (_formKey.currentState.validate()) {
                                            if (_name != null) {
                                              database
                                                  .collection('user')
                                                  .document(snapshot.data['uid'])
                                                  .updateData(
                                                  {'Nickname': _name});
                                              print('เปลี่ยนชื่อแล้ว');
                                            }
                                          }
                                          if (_formKey.currentState.validate()) {
                                            if (_phone != null) {
                                              database
                                                  .collection('user')
                                                  .document(snapshot.data['uid'])
                                                  .updateData({'Phone': _phone});
                                              print('เปลี่ยนเบอร์แล้ว');
                                            }
                                          }
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content:
                                                  Text('Success')));
                                        }
                                      },
                                      elevation: 4.0,
                                      splashColor: Colors.blueGrey,
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      } else {}
                      return Container();
                    }),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.teal[200]);
  }
}

void _showDialog(BuildContext context, {String title, String msg}) {
  final dialog = AlertDialog(
    title: Text(title),
    content: Text(msg),
    actions: <Widget>[
      RaisedButton(
        color: Colors.teal,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Close',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
  showDialog(context: context, builder: (x) => dialog);
}

class InfoCard extends StatelessWidget {
  final String text;
  final IconData icon;
  Function onPressed;

  InfoCard({
    @required this.text,
    @required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.teal,
          ),
          title: Text(
            text,
            style: TextStyle(
              fontFamily: 'Source Sans Pro',
              fontSize: 20.0,
              color: Colors.teal,
            ),
          ),
        ),
      ),
    );
  }
}
