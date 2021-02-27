import 'package:flutter/material.dart';

class templex4 extends StatefulWidget {
  @override
  _templex4State createState() => _templex4State();
}

class _templex4State extends State<templex4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Central Thailand Temple'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Image(
                  image: AssetImage('assets/immages/pic_temple/midtemple1.jpg'),
                ),
              ),
              Text(
                '- Wat Phrachettuphonwimonmangkhalaram',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :2 Sanam Chai Road,\n Phraborom Maharajawang,\n Phra Nakhon District, Bangkok'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/pic_temple/midtemple2.jpg'),
                ),
              ),
              Text(
                '- Wat Pranon Jaksi Worawiharn',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Baan Phra Non, Village No. 2,\n Sai 2, Chak Si Subdistrict, Mueang Sing Buri District,\n Sing Buri'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/pic_temple/midtemple3.jpg'),
                ),
              ),
              Text(
                '- Wat Huay Mongkol',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Hua Hin - Huai Mongkol Road,\n Village No. 6, Huai Mongkhon Road,\n Thap Tai Subdistrict, Hua Hin District,\n Prachuap Khiri Khan'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/pic_temple/midtemple4.jpg'),
                ),
              ),
              Text(
                '- Wat Tham Sua',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Muang Chum Subdistrict, Tha Muang District,\n Kanchanaburi'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/pic_temple/midtemple5.jpg'),
                ),
              ),
              Text(
                '- Wat Yannasang Wararam(Khao Cheechan)',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Location :Village No. 11, Pattaya City,\n Bang Lamung District, Chon Buri'),
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
