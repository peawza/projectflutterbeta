import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectflutterbeta/screens/home/brew_title.dart';
import 'package:projectflutterbeta/screens/home/food/food.dart';
import 'package:projectflutterbeta/screens/home/pagetemple/temple.dart';
import 'package:projectflutterbeta/screens/home/pang/Message.dart';
import 'package:projectflutterbeta/screens/home/pang/callcenter.dart';
import 'package:projectflutterbeta/screens/home/pang/convertermoney.dart';
import 'package:projectflutterbeta/screens/home/pang/mapbangkok.dart';
import 'package:projectflutterbeta/screens/home/pang/mapcentral.dart';
import 'package:projectflutterbeta/screens/home/pang/mapeast.dart';
import 'package:projectflutterbeta/screens/home/pang/mapnorth.dart';
import 'package:projectflutterbeta/screens/home/pang/mapsouthern.dart';
import 'package:projectflutterbeta/screens/home/pang/mapwest.dart';
import 'package:projectflutterbeta/screens/home/pang/test.dart';
import 'package:projectflutterbeta/screens/home/pang/test2.dart';
import 'package:provider/provider.dart';
import 'package:projectflutterbeta/models/brew.dart';
import 'package:projectflutterbeta/models/user.dart';
import 'package:projectflutterbeta/models/movie_model.dart';
import 'package:projectflutterbeta/screens/home/pang/movie_screen.dart';
import 'package:projectflutterbeta/widgets/content_scroll.dart';

class Home_Pang extends StatefulWidget {
  @override
  _Home_PangState createState() => _Home_PangState();
}

class _Home_PangState extends State<Home_Pang> {
  PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieScreen(movie: movies[index]),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(movies[index].imageUrl),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  movies[index].title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        Container(
          height: 280.0,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index) {
              return _movieSelector(index);
            },
          ),
        ),

        Center(
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              height: 175,
              width: 380,
              child: FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CurrencyConverter()));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Image.asset('assets/immages/exchange.png')),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),

        Center(
          child: Wrap(
            children: <Widget>[
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                  height: 175,
                  width: 175,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Callcente_Page()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.asset('assets/immages/callcenter.png')),
                ),
              ),
              SizedBox(
                width: 25,
              ),
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                    height: 175,
                    width: 175,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => pagetemple()));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Image(
                        image: AssetImage('assets/immages/temple.png'),
                        fit: BoxFit.fill,
                        width: size.width,
                        height: size.height,
                      ),
                    )),
              ),
            ],
          ),
        ),
        //เทศ

        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => food_pang()));
                  },
                  child: Container(
                    height: 150,width: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [Color.fromRGBO(30, 247, 58,0.9),Color.fromRGBO(186, 247, 194, 1)
                          ],//30, 247, 58,0.9
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(186, 247, 194, 0.9),
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                ),

                Positioned.fill(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Image.asset(
                          'assets/immages/foodnew.png',
                          height: 200,
                          width: 250,
                        ),
                        flex: 4,
                      ),
                      Expanded(
                        flex: 4,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Food',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'assets/images/food/icon.png',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
         Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MessageScreen(user.uid)));                      
                    },
                    child: Container(
                      height: 150,width: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: LinearGradient(
                            colors: [Color(0xffD76EF5),Color(0xff8F7AFE)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff8F7AFE),
                            blurRadius: 12,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset(
                            'assets/immages/chatroom.png',
                            height: 100,
                            width: 150,
                          ),
                          flex: 4,
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Chat Room',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'assets/images/food/icon.png',
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                ),                              
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        

        
      ],
    );
  }
}
