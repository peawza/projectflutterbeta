import 'package:flutter/material.dart';

class foodx4 extends StatefulWidget {
  @override
  _foodx4State createState() => _foodx4State();
}

class _foodx4State extends State<foodx4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('North-Eastern Thai Food'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/esanfood1.PNG'),
                ),
              ),
              Text(
                '-  Papaya Salad',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a menu of our northeastern region that has it all The taste of papaya salad is unique, it is spicy, hot, sometimes to the point of tears. And that is the charm that makes many people become addicted to papaya salad'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/esanfood2.PNG'),
                ),
              ),
              Text(
                '- Spicy minced pork salad',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Spicy minced pork salad is made from minced meat, raw or seasoned, and mixed with different ingredients and seasonings by region.'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/esanfood3.PNG'),
                ),
              ),
              Text(
                '- Yum Khai Mod Daeng ',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a food that has a strong flavor to the heart, causing many to become fascinated by both the northeastern people themselves And even if not the northeast people still like to eatThe taste of the raw material is the yolk ant egg which is hard to find.'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/esanfood4.PNG'),
                ),
              ),
              Text(
                '- Tadpole packet',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Rare items because they are the most delicious and tricky food. One year, can eat only one season.'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/esanfood5.PNG'),
                ),
              ),
              Text(
                '- Bamboo shoot spicy salad',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is northeastern food, consisting of boiled bamboo shoots torn into pieces, flavored with sour, salty, spicy with lemon, fish sauce, chillies and roasted rice.Other soups will be liquid. Some are thick, some are clear.'),
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
