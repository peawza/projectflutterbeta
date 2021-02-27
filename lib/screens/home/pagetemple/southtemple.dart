import 'package:flutter/material.dart';

class templex2 extends StatefulWidget {
  @override
  _templex2State createState() => _templex2State();
}

class _templex2State extends State<templex2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Southern Temple'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Image(
                  image:
                      AssetImage('assets/immages/pic_temple/southtemple1.jpg'),
                ),
              ),
              Text(
                '- Wat Phra Borommathat Chaiya Worawihan',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text('Location :Wiang Subdistrict, Chaiya District, Surat Thani'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image:
                      AssetImage('assets/immages/pic_temple/southtemple2.jpg'),
                ),
              ),
              Text(
                '- Khao Na Nai Luang Dharma Park',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Surat Thani, Ton Yuan Subdistrict,\n Phanom District, Surat Thani'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image:
                      AssetImage('assets/immages/pic_temple/southtemple3.PNG'),
                ),
              ),
              Text(
                '- Wat Bang Thong',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Village No. 3, Na Nuea Sub-district,\n Ao Luek District, Krabi'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image:
                      AssetImage('assets/immages/pic_temple/southtemple4.jpg'),
                ),
              ),
              Text(
                '- Wat Sri Sunthon',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Thep Krasattri Road, Si Sunthon Subdistrict,\n Thalang District, Phuket'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image:
                      AssetImage('assets/immages/pic_temple/southtemple5.jpg'),
                ),
              ),
              Text(
                '- Wat Phra Mahathat Woramahawihan',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :435 Ratchadamnoen Road, Nai Mueang Subdistrict,\n Mueang Nakhon Si Thammarat District'),
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
