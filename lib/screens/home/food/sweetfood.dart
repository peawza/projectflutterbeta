import 'package:flutter/material.dart';

class foodx6 extends StatefulWidget {
  @override
  _foodx6State createState() => _foodx6State();
}

class _foodx6State extends State<foodx6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thai desert'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/sweetfood1.PNG'),
                ),
              ),
              Text(
                '-  Mangoes and sticky rice',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a popular Thai dessert And will be especially popular in the summer Made from sticky rice.Then eat with mango'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/sweetfood2.PNG'),
                ),
              ),
              Text(
                '- Mock pomegranate seed',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a Thai dessert Tubtim crispy is a dessert that can be eaten in every season. Most popular in the summer Eat and fragrant, sweet, cool, delicious, cool the heat well. Consisting of bright red pomegranate seeds and beautiful pink pomegranate seeds When chewing, then crispy it with the taste of water chestnuts'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/sweetfood3.PNG'),
                ),
              ),
              Text(
                '- Gold threads',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Features a golden fuzzy line Made from egg yolks of duck eggs Simmer in boiling water and granulated sugar.'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/sweetfood4.PNG'),
                ),
              ),
              Text(
                '- Taro balls in coconut cream',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Thai desserts, beautiful color, delicious taste, mellow, fragrant, sweet, oily'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/sweetfood5.PNG'),
                ),
              ),
              Text(
                '- Mock jack-fruit seeds',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a dessert that is considered a crest In ancient times it was used for raising Monks or guests, in ancient times would'),
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
