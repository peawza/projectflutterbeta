import 'package:flutter/material.dart';
import 'package:projectflutterbeta/models/movie_model.dart';
import 'package:projectflutterbeta/screens/home/pang/callcenter.dart';
import 'package:projectflutterbeta/screens/home/pang/mapwest.dart';
import 'package:projectflutterbeta/widgets/circular_clipper.dart';
import 'package:projectflutterbeta/widgets/content_scroll.dart';

import 'package:projectflutterbeta/screens/home/pang/mapbangkok.dart';
import 'package:projectflutterbeta/screens/home/pang/mapcentral.dart';
import 'package:projectflutterbeta/screens/home/pang/mapeast.dart';
import 'package:projectflutterbeta/screens/home/pang/mapnorth.dart';
import 'package:projectflutterbeta/screens/home/pang/mapsouthern.dart';
import 'package:projectflutterbeta/screens/home/pang/mapwest.dart';

var pang = Callcente_Page();

class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen({this.movie});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.movie.imageUrl,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(widget.movie.imageUrl),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 40.0,
                    color: Colors.black,
                  ),
                  Image(
                    image: AssetImage(
                        'assets/immages/aroundthailand-Recovered.png'),
                    height: 100.0,
                    width: 150.0,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,

                    //
                    /*
                    onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Callcente_Page()));
                              //debugPrint('Button clicked');
                            },

                    */

                    onPressed: () {
                      print(widget.movie.Pressed);
                      if (widget.movie.Pressed == 'bangkok') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mapbankokPage()));
                      }
                      if (widget.movie.Pressed == 'center') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mapcaentralPage()));
                      }
                      if (widget.movie.Pressed == 'eastern') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mapeastPage()));
                      }
                      if (widget.movie.Pressed == 'nost') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mapnorthPage()));
                      }
                      if (widget.movie.Pressed == 'southern') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapsouthernPage()));
                      }
                      if (widget.movie.Pressed == 'West') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => mapwestPage()));
                      }
                    },
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Image.asset('assets/immages/iconmap.png',height: 90,width: 90,)

                    /*
                    Icon(
                      Icons.map,
                      size: 60.0,
                      color: Colors.red,
                    ),*/
                  ),
                ),
              ),
              /*
              Positioned(
                bottom: 0.0,
                left: 20.0,
                /*
                child: IconButton(
                  onPressed: () => print('Add to My List'),
                  icon: Icon(Icons.add),
                  iconSize: 40.0,
                  color: Colors.black,
                ),*/
              ),
              Positioned( // ตำแหน่ง
                bottom: 0.0,
                right: 25.0,
              ),*/
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),
                Text(
                  widget.movie.categories,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                ),
                /*
                SizedBox(height: 12.0),
                Text(
                  '⭐ ⭐ ⭐ ⭐',
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(height: 15.0),
                */
                /*
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Year',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.movie.year.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Country',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          widget.movie.country.toUpperCase(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Length',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '${widget.movie.length} min',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                 */
                SizedBox(height: 25.0),
                Container(
                  height: 120.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.movie.description,
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContentScroll(
            images: widget.movie.screenshots,
            title: 'Screenshots',
            imageHeight: 200.0,
            imageWidth: 250.0,
          ),
        ],
      ),
    );
  }
}
