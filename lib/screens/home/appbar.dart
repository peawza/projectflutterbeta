import 'dart:io';

import 'package:flutter/material.dart';
import 'package:projectflutterbeta/services/auth.dart';




TextStyle MyStyle1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold); //  กำหนด พวกขนาดตัวหนังสือ ต่างๆๆ
TextStyle MyStyle2 = TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
TextStyle MyStyle3 = TextStyle(fontSize: 25);

final AuthService _auth = AuthService();




class CustomListTile extends StatelessWidget{
  IconData icon;
  String text;
  Function onTap;
  CustomListTile(this.icon,this.text,this.onTap);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))
        ),
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
                      child: Text(text,style: TextStyle(
                          fontSize: 16.0
                      ),),
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



class Appbartab extends StatelessWidget {

  //int currentIndex = 0;
  //List Pages = [PangHome(), Accont(), Setting()];
  Widget build(BuildContext context) {

    return Scaffold(
      //appBar: appBar,
      //drawer: Mydrawer,
      //floatingActionButton: floatingAction,
      //bottomNavigationBar: bottomNavbar,
    );
  }
}




int x = 0;
Widget floatingAction = FloatingActionButton(
  child: Icon(Icons.add),
);

Widget appBartab1 = AppBar(
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
      //onPressed: () => _showSettingsPanel(),
    )
  ],
);



Widget bottomNavbar = BottomNavigationBar(
  //currentIndex: currentIndex,
  items: [
    BottomNavigationBarItem(
        icon: Icon(Icons.home),
        title: Text(
          'หน้าหลัก',
          style: MyStyle2,
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle),
        title: Text(
          'ข้อมูลส่วนตัว',
          style: MyStyle2,
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        title: Text(
          'ตั่งค่า',
          style: MyStyle2,
        )),
  ],
);







