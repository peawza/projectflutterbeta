import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:condition/condition.dart';

class mapcaentralPage extends StatefulWidget {
  @override
  mapcaentralPageState createState() => mapcaentralPageState();
}

class mapcaentralPageState extends State<mapcaentralPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("caentral"),
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchMinus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus(zoomVal);
          }),
    );
  }

  Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(FontAwesomeIcons.searchPlus, color: Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(13.2309921, 101.5311898), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(13.2309921, 101.5311898), zoom: zoomVal)));
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0), //ตำแหน่ง
                child: _boxes(
                    "assets/immages/photo/mapwest/1ErawanNationalPark.jpg",
                    15.71323,100.1265861,
                    "Erawan National Park", //1 พัทยา
                    'Kanchanaburi',
                    '4.5',
                    '4.5',
                    '905',
                    'Open 24 hours',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapwest/2NamtokPhaCharoen.jpg",
                    16.5018157,98.7523984,
                    "Namtok Pha Charoen\nNational Park",
                    'Tak',
                    '4.3',
                    '4',
                    '547',
                    'Open 24 hours',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapwest/3SaiYokPark.jpg",
                    14.4374466,98.8505249,
                    "Sai Yok\nNational Park",
                    'Kanchanaburi',
                    '4.4',
                    '4.5',
                    '1,682',
                    '7:00–17:00',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapwest/4DamnoenSaduakFloatingMarket.jpg",
                    13.5202817,99.9592564,
                    "Damnoen Saduak\nFloating Market",
                    'Ratchaburi',
                    '3.8',
                    '4',
                    '15,457',
                    '07:00–17:00',
                    '   -')), //13.7665171,100.5665007
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapwest/5SamPhanNamFloatingMarket.jpg",
                    12.501219,99.9128484,
                    "Sam Phan Nam\nFloating Market",
                    'Prachuap Khiri Khan',
                    '3.5',
                    '3.5',
                    '3,125',
                    '09:00–18:00',
                    '   -')), //13.7665171,100.5665007
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapwest/6TheVeneziaHuaHin.jpg",
                    12.650573,99.9489325,
                    "The Venezia Hua Hin",
                    'Prachuap Khiri Khan',
                    '3.5',
                    '3.5',
                    '3,749',
                    '10:00 - 20:00',
                    '   -')), //Khao San Road  13.7587268,100.4974355
            SizedBox(width: 10.0),
            //13.7558694,100.503332 Nitasrattanakosin 13.7526286,100.4941149
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapwest/7BridgeotheRiverKwai.jpg",
                    14.2179107,
                    101.8993209,
                    "The Bridge of the River Kwai",
                    'Kanchanaburi',
                    '4.4',
                    '4.5',
                    '18,384',
                    'Open 24 hours',
                    '-')),
            SizedBox(width: 10.0),
            //13.746799,100.5328184 Asiatique the Riverfront
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapwest/8KaengKrachanNationalPark.jpg",
                    2.5338205,
                    101.9403762,
                    "Kaeng Krachan\nNational Park",
                    'Phetchaburi',
                    '4.4',
                    '4.5',
                    '1,691',
                    '06:00 - 18:00',
                    '   -')),
            SizedBox(width: 10.0),
            //13.7526286,100.4941149 Bangkok City Pillar Shrine
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapwest/9BangTabunBay.jpg",
                    13.2647366,99.9359052,
                    "Bang Tabun Bay",
                    'Phetchaburi',
                    '4.0',
                    '4',
                    '794',
                    'Open 24 hours',
                    '   -')),
            SizedBox(width: 10.0),
            //13.746799,100.5328184 Sea Life Ocean World 4.5
            //12,058
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "assets/immages/photo/mapwest/10ThiLoSuWaterfall.jpg",
                  12.5710842,
                  101.8964168,
                  "Thi Lo Su Waterfall ",
                  'Tak',
                  '4.6',
                  '4.5',
                  '1,058',
                  'Open 24 hours',
                  '   -'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(
      String _image,
      double lat,
      double long,
      String restaurantName,
      String province,
      String value,
      String valueStar,
      String valuepeople,
      String time,
      String Closedday) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 160,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage(_image),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName, province,
                          value, valueStar, valuepeople, time, Closedday),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(
      String restaurantName,
      String province,
      String value,
      String valueStar,
      String valuepeople,
      String time,
      String Closedday) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(
                restaurantName,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height: 5.0),
        Conditioned(
          cases: [
            Case(valueStar == '3.5',
                builder: () => Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            )),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStarHalf,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.grey[300],
                            size: 15.0,
                          ),
                        ),
                        Container(
                            child: Text(
                              "(" + valuepeople + ")",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            )),
                      ],
                    ))),
            Case(valueStar == '4',
                builder: () => Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            )),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.grey[300],
                            size: 15.0,
                          ),
                        ),
                        Container(
                            child: Text(
                              "(" + valuepeople + ")",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            )),
                      ],
                    ))),
            Case(valueStar == '4.5',
                builder: () => Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            )),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStarHalf,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                            child: Text(
                              "(" + valuepeople + ")",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            )),
                      ],
                    ))),
            Case(valueStar == '5',
                builder: () => Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                            child: Text(
                              value,
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            )),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                          child: Icon(
                            FontAwesomeIcons.solidStar,
                            color: Colors.amber,
                            size: 15.0,
                          ),
                        ),
                        Container(
                            child: Text(
                              "(" + valuepeople + ")",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18.0,
                              ),
                            )),
                      ],
                    )))
          ],
          defaultBuilder: () => Icon(Icons.wb_sunny),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Text(
              province,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
              "Opens " + time,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
        SizedBox(height: 2.0),
        Container(
            child: Text(
              "Closed day \u00B7 " + Closedday,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(13.2309921, 101.5311898), zoom: 7), //เลือกตำแหน่ง
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          bookMarkerErawanNationalPark,
          bookMarkerBangTabunBay,
          bookMarkerNamtokPhaCharoenNationalPark,
          bookMarkerSaiYokNationalPark,
          bookMarkerDamnoenSaduakFloatingMarket,
          bookMarkerSamPhanNamFloatingMarket,
          bookMarkerTheVeneziaHuaHin,
          bookMarkerTheBridgeoftheRiverKwai,
          bookMarkerKaengKrachanNationalPark,
          bookMarkerChaoLaoBeach
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker bookMarkerErawanNationalPark = Marker(
  markerId: MarkerId('Erawan National Park'),
  position: LatLng(14.3686275,99.1417536), //ปักหมุด
  infoWindow: InfoWindow(title: 'Erawan National Park'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bookMarkerNamtokPhaCharoenNationalPark = Marker(
  markerId: MarkerId('Namtok Pha Charoen\nNational Park'),
  position: LatLng(16.5018157,98.7523984), //ปักหมุด
  infoWindow: InfoWindow(title: 'Namtok Pha Charoen\nNational Park'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerSaiYokNationalPark = Marker(
  markerId: MarkerId('Sai Yok\nNational Park'),
  position: LatLng(
    14.4374466,98.8505249,
  ), //ปักหมุด
  infoWindow: InfoWindow(title: 'Sai Yok\nNational Park'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerDamnoenSaduakFloatingMarket = Marker(
  markerId: MarkerId('Damnoen Saduak\nFloating Market'),
  position: LatLng(11.6618769, 102.4964761), //ปักหมุด
  infoWindow: InfoWindow(title: 'Damnoen Saduak\nFloating Market'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//Khao San Road  13.7587268,100.4974355
Marker bookMarkerSamPhanNamFloatingMarket = Marker(
  markerId: MarkerId('Sam Phan Nam\nFloating Market'),
  position: LatLng(12.501219,99.9128484),
  infoWindow: InfoWindow(title: 'Sam Phan Nam\nFloating Market'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.7558694,100.503332 Nitasrattanakosin

Marker bookMarkerTheVeneziaHuaHin = Marker(
  markerId: MarkerId('The Venezia Hua Hin '),
  position: LatLng(12.650573,99.9489325),
  infoWindow: InfoWindow(title: 'The Venezia Hua Hin'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.7526286,100.4941149 Bangkok City Pillar Shrine

Marker bookMarkerTheBridgeoftheRiverKwai = Marker(
  markerId: MarkerId('The Bridge of\nthe River Kwai'),
  position: LatLng(14.2179107, 101.8993209),
  infoWindow: InfoWindow(title: 'The Bridge of\nthe River Kwai'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.746799,100.5328184 Sea Life Ocean World
Marker bookMarkerChaoLaoBeach = Marker(
  markerId: MarkerId('Chao Lao Beach '),
  position: LatLng(2.5338205, 101.9403762),
  infoWindow: InfoWindow(title: 'Chao Lao Beach'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.746799,100.5328184 Asiatique the Riverfront
Marker bookMarkerKaengKrachanNationalPark = Marker(
  markerId: MarkerId('Kaeng Krachan\nNational Park '),
  position: LatLng(2.5338205,
      101.9403762),
  infoWindow: InfoWindow(title: 'Kaeng Krachan\nNational Park'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.746799,100.5328184, "Sea Life Ocean World",

Marker bookMarkerBangTabunBay = Marker(
  markerId: MarkerId('Bang Tabun Bay'),
  position: LatLng(13.2647366,99.9359052),
  infoWindow: InfoWindow(title: 'Bang Tabun Bay'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
