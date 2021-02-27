import 'package:flutter/material.dart';

class foodx5 extends StatefulWidget {
  @override
  _foodx5State createState() => _foodx5State();
}

class _foodx5State extends State<foodx5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tradional Thai Style'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/midfood1.PNG'),
                ),
              ),
              Text(
                '-  Sour prawn soup(Tom Yum Kung)',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a central Thai food in Tom Yum category. Which is popular to eat in every region in Thailand Is a dish eaten and Is primarily sour and spicy, mixed with salty and slightly sweet'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/midfood2.PNG'),
                ),
              ),
              Text(
                '- Green curry chicken in coconut milk',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a curry Thai food Consisting of meat, fish, chicken or pork and vegetables flavored with coconut milk, eggplant, sugar, fish sauce, kaffir lime leaves and basil leaves, preferable to eat with steamed rice or rice noodles. Some locals put the chilli leaves down too.'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/midfood3.PNG'),
                ),
              ),
              Text(
                '- Sour soup made of Tamarind Paste',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a curry dish that has sour taste Which is a curry with meat Mostly fish or shrimp Has a spicy, sweet, salty, sour taste'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/midfood4.PNG'),
                ),
              ),
              Text(
                '- Steamed duck',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'The duck is trimmed and boiled with water and spices. Flavored with seasonings such as soy sauce, sugar'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/midfood5.PNG'),
                ),
              ),
              Text(
                '- Rice topped with stir-fried pork and basil',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Stir basil is a food that is highly popular among Thais in all regions.With delicious taste, easy to make and can be easily eaten'),
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
