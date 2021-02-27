import 'dart:isolate';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:projectflutterbeta/models/user.dart';

final database = Firestore.instance;

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

String up = '';
int x = 0;

class _ProfilePageState extends State<ProfilePage> {
  File _image;

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path++ $_image');
        up = 'Image Path $_image';
      });
    }
    final user = Provider.of<User>(context);
    Future uploadPic(BuildContext context) async {
      String fileName = basename(_image.path);
      StorageReference firebaseStorageRef =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
      var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      var url = downUrl.toString();
      setState(() {
        print("Profile Picture uploaded");
        print("link :+++  " + url);

        database.collection('user').document(user.uid).updateData({'photo': url});


        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
      });
    }
    return Scaffold(

        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/immages/backbg.png"),
                    fit: BoxFit.cover),
              ),
            ),          ListView(
              children: <Widget>[
                StreamBuilder(
                    stream: Firestore.instance
                        .collection('user')
                        .document(user.uid)
                        .snapshots(),
                    builder: (context, snapshot) {


                      if (snapshot.hasData) {
                        return Builder(
                          builder: (context) => Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: CircleAvatar(
                                        radius: 90,
                                        backgroundColor: Colors.white,
                                        child: ClipOval(
                                          child: new SizedBox(
                                            width: 180.0,
                                            height: 180.0,
                                            child: (_image != null)
                                                ? Image.file(
                                                    _image,
                                                    fit: BoxFit.fill,
                                                  )
                                                : Image.network(
                                                    snapshot.data['photo'],
                                                    fit: BoxFit.fill,
                                                  ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 60.0),
                                      child: IconButton(
                                        icon: Icon(
                                          FontAwesomeIcons.camera,
                                          size: 30.0,
                                        ),
                                        onPressed: () {
                                          getImage();
                                          x = 1;
                                        },
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  'Name : ' + snapshot.data['Nickname'],
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
                                  text: snapshot.data['Phone'],
                                  icon: Icons.phone,
                                ),
                                InfoCard(
                                  text: snapshot.data['email'],
                                  icon: Icons.email,
                                ),
                                SizedBox(
                                  height: 70,

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
                                        if (x == 1) {
                                          uploadPic(context);
                                          x = 0;
                                          print(x);
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
