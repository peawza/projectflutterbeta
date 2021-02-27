import 'package:flutter/material.dart';

class foodx2 extends StatefulWidget {
  @override
  _foodx2State createState() => _foodx2State();
}

class _foodx2State extends State<foodx2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Northern Food'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/northfood1.PNG'),
                ),
              ),
              Text(
                '- KHAO SAWY',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  ' Is a local food in northern Thailand, formerly known as "Ho   Noodles".In the broth filled with spicy spices'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/northfood2.PNG'),
                ),
              ),
              Text(
                '- NAM PRIK NUM',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Made from a type of chili peppers, known as young chili, may be used for young chillies Eaten with steamed pork and steamed pork in steamed pork.'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/northfood3.PNG'),
                ),
              ),
              Text(
                '- Nam ngiao Rice Noodle',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a dish of the Thai Yai people but originally uses noodle Thai people call that Khao Soi Ngao The unique characteristics of Kanom Jeen Nam Ngao is that it must be concentrated, not too clear, oily, and red. Salty taste, followed by slightly sour, moderately spicy'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/northfood4.PNG'),
                ),
              ),
              Text(
                '- Nam Prik Ong',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Nam Prik Ong is one of the most widely known Lanna chili paste.\nA distinctive feature of Nam Phrik Ong is the orange color of the tomatoes and the dried chilies.'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/northfood5.PNG'),
                ),
              ),
              Text(
                '- Kang Ho',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a food preservation of the northern people in the past Meaning bringing curry And various foods Leftover Stir together in a pan. Add the Hunglae ​​curry. Stir until the dry curry is good. Can eat'),
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
