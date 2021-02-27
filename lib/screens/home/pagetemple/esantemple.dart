import 'package:flutter/material.dart';

class templex3 extends StatefulWidget {
  @override
  _templex3State createState() => _templex3State();
}

class _templex3State extends State<templex3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('North-Eastern Temple'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Image(
                  image:
                      AssetImage('assets/immages/pic_temple/esantemple1.jpg'),
                ),
              ),
              Text(
                '- Wat Neramit Wipatsana',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Ban Hua Na Yung, Dan Sai Subdistrict,\n Dan Sai District, Loei'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image:
                      AssetImage('assets/immages/pic_temple/esantemple2.png'),
                ),
              ),
              Text(
                '- Wat Pa Phu Kon',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Village No. 6, Ban Kong Sub-district,\n Na Yung District, Udon Thani'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image:
                      AssetImage('assets/immages/pic_temple/esantemple3.jpg'),
                ),
              ),
              Text(
                '- Wat Sirindhonwararam',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Chongmek Sub-district Sirindhorn District,\n Ubon Ratchathani'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image:
                      AssetImage('assets/immages/pic_temple/esantemple4.jpg'),
                ),
              ),
              Text(
                '- Wat Pra Cha Kom Wa Naram',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Si Somdet Subdistrict,\nSi Somdet District, Roi Et'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image:
                      AssetImage('assets/immages/pic_temple/esantemple5.jpg'),
                ),
              ),
              Text(
                '- Wat Phra That Phanom',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :That Phanom Subdistrict,\n That Phanom District Nakhon Phanom'),
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
