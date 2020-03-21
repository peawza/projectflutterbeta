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

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: StreamBuilder(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 100,

                        backgroundImage: NetworkImage(photo),
                      ),
                      Text(
                        'Name : '+Nickname,
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                      SizedBox(
                        height: 20,
                        width: 200,
                        child: Divider(
                          color: Colors.teal.shade700,
                        ),
                      ),
                      InfoCard(
                        text: phone,
                        icon: Icons.phone,
                      ),
                      InfoCard(
                        text: email,
                        icon: Icons.email,
                      ),
                    ],
                  ),

                );

              } else {}
              return Container();
            }
            ),
        backgroundColor: Colors.teal[200]
    );
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

