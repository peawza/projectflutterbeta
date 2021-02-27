import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:projectflutterbeta/screens/home/pagetemple/esantemple.dart';
import 'package:projectflutterbeta/screens/home/pagetemple/midtemple.dart';
import 'package:projectflutterbeta/screens/home/pagetemple/northtemple.dart';
import 'package:projectflutterbeta/screens/home/pagetemple/southtemple.dart';

import 'package:projectflutterbeta/services/auth.dart';
import 'package:projectflutterbeta/screens/home/settings_form.dart';

final AuthService _auth = AuthService();
var bannerItems = [
  "Wat Phra That Doi Suthep",
  "Wat Neramit Wipatsana",
  "Khao Na Nai Luang Dharma Park",
  "Wat Phra That Chae Haeng"
];
var bannerImage = [
  "assets/immages/pic_temple/temple1.jpg",
  "assets/immages/pic_temple/esantemple1.jpg",
  "assets/immages/pic_temple/southtemple2.jpg",
  "assets/immages/pic_temple/temple5.jpg"
];

class pagetemple extends StatefulWidget {
  @override
  _pagetempleState createState() => _pagetempleState();
}

class _pagetempleState extends State<pagetemple> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    Future<List<Widget>> createList() async {
      List<Widget> items = new List<Widget>();
      String dataString =
          await DefaultAssetBundle.of(context).loadString("assets/data.json");
      List<dynamic> dataJSON = jsonDecode(dataString);

      dataJSON.forEach((object) {
        String finalString = "";
        List<dynamic> dataList = object["placeItems"];
        dataList.forEach((item) {
          finalString = finalString + item + " | ";
        });

        items.add(Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2.0,
                      blurRadius: 5.0),
                ]),
            margin: EdgeInsets.all(5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0)),
                  child: Image.asset(
                    object["placeImage"],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(object["placeName"]),
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                          child: Text(
                            finalString,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.black54,
                            ),
                            maxLines: 1,
                          ),
                        ),
                        Text(
                          "Min. Order: ${object["minOrder"]}",
                          style:
                              TextStyle(fontSize: 12.0, color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      });

      return items;
    }

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

    return Scaffold(
      appBar: appBartab,
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BannerWidgetArea(),
              /*
                  Container(
                    child: FutureBuilder(
                        initialData: <Widget>[Text("")],
                        future: createList(),
                        builder: (context,snapshot){
                          if(snapshot.hasData){
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: ListView(
                                primary: false,
                                shrinkWrap: true,
                                children: snapshot.data,
                              ),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  )
                  ,*/
              Center(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Text('Thai Temple'),
                      Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => templex1()));
                        },
                        leading: Icon(Icons.account_balance),
                        title: Text('Northern Temple'),
                        subtitle: Text('Recommended Temple'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => templex2()));
                        },
                        leading: Icon(Icons.account_balance),
                        title: Text('Southern Temple'),
                        subtitle: Text('Recommended Temple'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => templex3()));
                        },
                        leading: Icon(Icons.account_balance),
                        title: Text('North-Eastern Temple'),
                        subtitle: Text('Recommended Temple'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      Divider(),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => templex4()));
                        },
                        leading: Icon(Icons.account_balance),
                        title: Text('Central Thailand Temple'),
                        subtitle: Text('Recommended Temple'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}

class BannerWidgetArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    PageController controller =
        PageController(viewportFraction: 0.8, initialPage: 1);

    List<Widget> banners = new List<Widget>();

    for (int x = 0; x < bannerItems.length; x++) {
      var bannerView = Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                child: Image.asset(
                  bannerImage[x],
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Colors.black])),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      bannerItems[x],
                      style: TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                    Text(
                      "",
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    return Container(
      width: screenWidth,
      height: screenWidth * 9 / 16,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }
}

Widget appBartab = AppBar(
  title: Text('Temple',
      style: TextStyle(fontSize: 40, fontFamily: "Samantha")), //ใส่ฟอน
  backgroundColor: Colors.orange[200],
  elevation: 0.0,
);
