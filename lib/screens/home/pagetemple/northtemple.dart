import 'package:flutter/material.dart';

class templex1 extends StatefulWidget {
  @override
  _templex1State createState() => _templex1State();
}

class _templex1State extends State<templex1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Northern Temple'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Image(
                  image: AssetImage('assets/immages/pic_temple/temple1.jpg'),
                ),
              ),
              Text(
                '- Wat Phra That Doi Suthep',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Village No. 9, Mueang Chiang Mai District,\n Chiang Mai'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/pic_temple/temple2.jpg'),
                ),
              ),
              Text(
                '- Wat Suan Dok Temple',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :139 Suthep Road, Suthep Subdistrict,\n Mueang Chiang Mai District, Chiang Mai'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/pic_temple/temple3.jpg'),
                ),
              ),
              Text(
                '- Wat Rong Suea Ten',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Village No. 306 Mae Kok Road,\n Mueang Chiang Rai District, Chiang Rai'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/pic_temple/temple4.jpg'),
                ),
              ),
              Text(
                '- Wat Phra That Lampang Luang',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :271 Lampang Luang Subdistrict,\n Ko Kha District, Lampang'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/pic_temple/temple5.jpg'),
                ),
              ),
              Text(
                '- Wat Phra That Chae Haeng',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :89 Mahaprom, Pha Sing Subdistrict,\n Mueang Nan District, Nan'),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ],
      ),
    );
  }
}
