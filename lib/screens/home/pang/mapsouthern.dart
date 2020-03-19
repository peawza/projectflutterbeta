import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:condition/condition.dart';

class MapsouthernPage extends StatefulWidget {
  @override
  MapsouthernPageState createState() => MapsouthernPageState();
}

class MapsouthernPageState extends State<MapsouthernPage> {
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
        title: Text("Bangkok"),
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
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(18.790468, 98.9812626), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(18.790468, 98.9812626), zoom: zoomVal)));
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
                    "https://sv1.picz.in.th/images/2020/03/19/Qi5Jx0.jpg",
                    7.758709,
                    98.303357,
                    "Promthep Cape", //1
                    'Phuket',
                    '4.6',
                    '4.5',
                    '5,276',
                    'Open 24 hours',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://sv1.picz.in.th/images/2020/03/19/Qi5GzR.jpg",
                    8.1341515,
                    98.2939967,
                    "Mai Khao beach", //2
                    'Phuket',
                    '4.5',
                    '4.5',
                    '372',
                    'Open 24 hours',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://sv1.picz.in.th/images/2020/03/19/Qi5L6u.jpg",
                    8.2387217,
                    98.4432624,
                    "Samet Nang She Viewpoint", //3
                    'Phangnga',
                    '4.5',
                    '4.5',
                    '348',
                    '4:00-22:00',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://sv1.picz.in.th/images/2020/03/19/Qi5mWZ.jpg",
                    8.1344685,
                    98.2988249,
                    "Similan Islands",
                    'Phuket',
                    '4.7',
                    '4.5',
                    '1,357',
                    'Open 24 hours',
                    '   -')), //13.7665171,100.5665007
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://sv1.picz.in.th/images/2020/03/19/Qi5y1I.jpg",
                    8.3060091,
                    98.4546746,
                    "Ao Phang Nga National Park",
                    'Phangnga',
                    '4.7',
                    '4.5',
                    '9,525',
                    '08:30-16:30',
                    '   -')), //13.7665171,100.5665007
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://sv1.picz.in.th/images/2020/03/19/Qi5FAP.jpg",
                    8.8386443,
                    98.9617991,
                    "Pa Ton Nam Ban Nam Rad",
                    'Surat Thani',
                    '4.5',
                    '4.5',
                    '419',
                    '09:00 - 17:00',
                    '   -')), //Khao San Road  13.7587268,100.4974355
            SizedBox(width: 10.0),
            //13.7558694,100.503332 Nitasrattanakosin 13.7526286,100.4941149
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://sv1.picz.in.th/images/2020/03/19/Qi5Iet.jpg",
                    7.1958965,
                    100.5897418,
                    "Street Art Songkhla",
                    'Songkhla',
                    '4.5',
                    '4.5',
                    '821',
                    '09:00 - 19:00',
                    '-')),
            SizedBox(width: 10.0),
            //13.746799,100.5328184 Asiatique the Riverfront
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://sv1.picz.in.th/images/2020/03/19/QiEWke.jpg",
                    5.8851862,
                    101.0221022,
                    "Flower Garden Betong",
                    'Yala',
                    '4.5',
                    '4.5',
                    '1,848',
                    '07:00 - 22:00',
                    '   -')),
            SizedBox(width: 10.0),
            //13.7526286,100.4941149 Bangkok City Pillar Shrine
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "https://sv1.picz.in.th/images/2020/03/19/QiEdOl.jpg",
                    7.046175,
                    100.4739172,
                    "Khlonghae Floating Market",
                    'Songkhla',
                    '4.5',
                    '4.5',
                    '794',
                    'Open 24 hours',
                    '   -')),
            SizedBox(width: 10.0),
            //13.746799,100.5328184 Sea Life Ocean World 4.5
            //12,058
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sv1.picz.in.th/images/2020/03/19/QiE0ak.jpg",
                  7.4107189,
                  99.5146822,
                  "Kantang Railway Station",
                  'Trang',
                  '4.5',
                  '4.5',
                  '12,058',
                  '08:00-17:00',
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
                        image: NetworkImage(_image),
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
            target: LatLng(18.790468, 98.9812626), zoom: 7), //เลือกตำแหน่ง
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          bookMarkerPaTonNamBanNamRad,
          bookMarkerAoPhangNgaNationalPark,
          bookMarkerSimilanIslands,
          bookMarkerStreetArtSongkhla,
          bookMarkerFlowerGardenBetong,
          bookMarkerKhlonghaeFloatingMarket,
          bookMarkerKantangRailwayStation,
          bookMarkerPromthepCape, //1
          bookMarkerSametNangSheViewpoint,
          bookMarkerMaiKhaobeach //2
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

Marker bookMarkerPaTonNamBanNamRad = Marker(
  markerId: MarkerId('Pa Ton Nam Ban Nam Rad'),
  position: LatLng(8.8386443, 98.9617991), //ปักหมุด
  infoWindow: InfoWindow(title: 'Pa Ton Nam Ban Nam Rad'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bookMarkerMaiKhaobeach = Marker(
  markerId: MarkerId('Mai Khao beach'),
  position: LatLng(
    8.1344685,
    98.2988249,
  ), //ปักหมุด
  infoWindow: InfoWindow(title: 'Mai Khao beach'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerStreetArtSongkhla = Marker(
  markerId: MarkerId('Street Art Songkhla'),
  position: LatLng(
    7.1958965,
    100.5897418,
  ), //ปักหมุด
  infoWindow: InfoWindow(title: 'Street Art Songkhla'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerFlowerGardenBetong = Marker(
  markerId: MarkerId('Flower Garden Betong'),
  position: LatLng(
    5.8851862,
    101.0221022,
  ), //ปักหมุด
  infoWindow: InfoWindow(title: 'Flower Garden Betong'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//Khao San Road  13.7587268,100.4974355
Marker bookMarkerKhlonghaeFloatingMarket = Marker(
  markerId: MarkerId('Khlonghae Floating Market'),
  position: LatLng(7.046175, 100.4739172),
  infoWindow: InfoWindow(title: 'Khlonghae Floating Market'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.7558694,100.503332 Nitasrattanakosin

Marker bookMarkerKantangRailwayStation = Marker(
  markerId: MarkerId('Kantang Railway Station '),
  position: LatLng(
    7.4107189,
    99.5146822,
  ),
  infoWindow: InfoWindow(title: 'Kantang Railway Station'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.7526286,100.4941149 Bangkok City Pillar Shrine

Marker bookMarkerPromthepCape = Marker(
  markerId: MarkerId('Promthep Cape '),
  position: LatLng(7.758709, 98.303357),
  infoWindow: InfoWindow(title: 'Promthep Cape'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.746799,100.5328184 Sea Life Ocean World
Marker bookMarkerSimilanIslands = Marker(
  markerId: MarkerId('Similan Islands'),
  position: LatLng(
    8.6487562,
    97.6365056,
  ),
  infoWindow: InfoWindow(title: 'Mai Khao beach'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.746799,100.5328184 Asiatique the Riverfront
Marker bookMarkerSametNangSheViewpoint = Marker(
  markerId: MarkerId('Samet Nang She Viewpoint '),
  position: LatLng(8.2387217, 98.4432624),
  infoWindow: InfoWindow(title: 'Samet Nang She Viewpoint'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.746799,100.5328184, "Sea Life Ocean World",

Marker bookMarkerAoPhangNgaNationalPark = Marker(
  markerId: MarkerId('Ao Phang Nga National Park'),
  position: LatLng(8.3060091, 98.4546746),
  infoWindow: InfoWindow(title: 'Doi Mae U-Kho'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
