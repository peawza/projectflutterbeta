import 'package:flutter/material.dart';

class foodx7 extends StatefulWidget {
  @override
  _foodx7State createState() => _foodx7State();
}

class _foodx7State extends State<foodx7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thai Fruit'),
        backgroundColor: Colors.orange[200],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/fruit1.PNG'),
                ),
              ),
              Text(
                '- Durian',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Durian is a fruit with a unique smell.Is a fruit which is known as the king of fruits'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/fruit2.PNG'),
                ),
              ),
              Text(
                '- Dragon fruit',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'This type of dragon fruit will have a sweet taste. Juicy, therefore, began to become famous and very popular. Which is considered an economic crop of Thailand'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/fruit3.PNG'),
                ),
              ),
              Text(
                '- Mangosteen',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'One of the Thai fruits is nicknamed the "Queen of Fruits" because it has calyx-like sepals. In which mangosteen is a tropical fruit'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/fruit4.PNG'),
                ),
              ),
              Text(
                '- Jackfruit',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Jackfruit ripe to be eaten as fruit And can be used to make a variety of desserts such as ice cream in Singapore Chongchak mixed with sticky rice with moon Or take to dry'),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Image(
                  image: AssetImage('assets/immages/food/fruit5.PNG'),
                ),
              ),
              Text(
                '- Rambutan',
                style: TextStyle(fontSize: 20.0, color: Colors.red),
              ),
              Text(
                  'Is a sweet fruit and Sour and eating fresh rambutan can cure severe diarrhea'),
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
