import 'package:flutter/material.dart';
import 'package:projectflutterbeta/models/user.dart';
import 'package:projectflutterbeta/models/userprofile.dart';
import 'package:projectflutterbeta/services/database.dart';
import 'package:projectflutterbeta/shared/constants.dart';
import 'package:projectflutterbeta/shared/loading.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



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
        title: Text("Prodile"),
      ),
      body: StreamBuilder<UserData>(
        stream: DatabaseService(uid:user.uid).userData ,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            UserData userData = snapshot.data;
            String  ID = userData.uid;

            print(ID);
            print(userData.name);
            return Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(child:
                    RaisedButton(
                      child: Text('Delete Record'),
                      onPressed: ( ) {
                        print(ID);



                      },
                    ),




                    ),
                    RaisedButton(
                      child: Text('Delete Record'),
                      onPressed: ( ) {
                        print(ID);


                      },

                    ),
                  ],
                ),
                Container(child:

                Card(child: Text (ID),)
                ),
              ],
            );
          }else{
          }
          return Container();

        }
      )




    );
  }
}



