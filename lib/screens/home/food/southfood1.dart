import 'package:flutter/material.dart';

class foodx3 extends StatefulWidget {
  @override
  _foodx3State createState() => _foodx3State();
}

class _foodx3State extends State<foodx3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sourthern Food'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/southfood1.PNG'),
                ),
              ),
              Text(
                '-  Kaeng Lueng',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'The southern curry of the southern region has a saffron obtained from turmeric,most of which Is a fish curry that usually has to be put on pickled bamboo shoots or fresh'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/southfood2.PNG'),
                ),
              ),
              Text(
                '- Rice Noodles with curried fish sauce',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Using Southern curry coconut milk (Yellow with turmeric), the taste is rich, fragrant, chili, curry, kaffir lime leaves, the main thing is boiled fish meat When combined with the curry paste, will be fragrant when eating'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/south3.PNG'),
                ),
              ),
              Text(
                '- Fish organs sour soup',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Fish kidneys are made from fish belly. And there are many fish maw, such as fish belly and belly fish belly. Which is considered as a food preservation When marinated for about 1 month, then bring to make curry with meat, fish, vegetables that are spicy, salty, hot.'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/southfood4.PNG'),
                ),
              ),
              Text(
                '- Stir Fried Pork with yellow curry paste',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Stir Fried Pork with yellow curry paste is another Southern dish that clearly demonstrates local identity. Because there is a spicy taste of curry that includes fresh chillies, dried chillies and pronounced herbs When stir frying, must also add chopped herbs.'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/southfood5.PNG'),
                ),
              ),
              Text(
                '- Thai Southern Spicy Rice Salad \n   with Vegetables',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'It was found that southern Thai rice is a food that has high nutritional value and is an herb. Because it consists of many vegetables Has a taste, smell, and color that is unique to one self Reflecting the local culture of the southern region'),
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
