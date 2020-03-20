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
                    "assets/immages/photo/mapcaentral/1KiriwongTemple.jpg",
                    15.71323,100.1265861,
                    "Kiriwong Temple", //1 พัทยา
                    'Nakhon Sawan',
                    '4.5',
                    '4.5',
                    '905',
                    'Open 24 hours',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapcaentral/2ThungBuaDaengFloatingMarket.jpg",
                    16.5018157,98.7523984,
                    "Thung Bua Daeng\nFloating Market",
                    'Nakhon Pathom',
                    '3.9',
                    '4',
                    '2,261',
                    '08:00-18.00',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapcaentral/3Sarikawaterfall.jpg",
                    14.3087955,101.253167,
                    "Sarika waterfall",
                    'Nakon Nayok',
                    '4.0',
                    '4',
                    '1,282',
                    '8:00–17:00',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapcaentral/4WatMahathat.jpg",
                    14.3569443,100.5653225,
                    "Wat Mahathat",
                    'Chai Nat',
                    '4.6',
                    '4.5',
                    '9,997',
                    '07:00–17:00',
                    '   -')), //13.7665171,100.5665007
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapcaentral/5KhunInthapramunTemple.jpg",
                    14.6420612,100.4267137,
                    "Khun Inthapramun Temple",
                    'Ang Thong',
                    '3.5',
                    '3.5',
                    '3,125',
                    '09:00–18:00',
                    '   -')), //13.7665171,100.5665007
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapcaentral/6HupWongReservoir.jpg",
                    14.7887901,99.5389374,
                    "Hup Wong Reservoir",
                    'Suphan Buri',
                    '4.3',
                    '4.5',
                    '749',
                    '06:00 - 18:00',
                    '   -')), //Khao San Road  13.7587268,100.4974355
            SizedBox(width: 10.0),
            //13.7558694,100.503332 Nitasrattanakosin 13.7526286,100.4941149
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapcaentral/7Redbridgedolphinviewpoint.jpg",
                    13.4875943,100.3621788,
                    "Red Boardwalk bridge ",
                    'Samut Sakhon',
                    '4.4',
                    '4.5',
                    '908',
                    'Open 24 hours',
                    '-')),
            SizedBox(width: 10.0),
            //13.746799,100.5328184 Asiatique the Riverfront
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapcaentral/9MaeklongRailwayMarket.jpg",
                    13.4075096,99.9987779,
                    "Maeklong Railway Market",
                    'Samut Songkhram',
                    '4.2',
                    '4',
                    '8,691',
                    '08:00 - 19:00',
                    '   -')),
            SizedBox(width: 10.0),
            //13.7526286,100.4941149 Bangkok City Pillar Shrine
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapcaentral/9BangPuRecreationCenter.jpg",
                    13.5172594,100.6527381,
                    "Bang Pu Recreation Center",
                    'Samut Prakan',
                    '4.3',
                    '4.5',
                    '7,794',
                    '10:00 - 19:00',
                    '   -')),
            SizedBox(width: 10.0),
            //13.746799,100.5328184 Sea Life Ocean World 4.5
            //12,058
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "assets/immages/photo/mapcaentral/10PhuThapBerk.jpg",
                  16.9046522,101.1003309,
                  "Phu Thap Berk",
                  'Phetchabun',
                  '4.5',
                  '4.5',
                  '4,058',
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
          bookMarkerKiriwongTemple,
          bookMarkerPhuThapBerk,
          bookMarkerThungBuaDaengFloatingMarket,
          bookMarkerSarikawaterfall,
          bookMarkerWatMahathat,
          bookMarkerKhunInthapramunTemple,
          bookMarkerHupWongReservoir,
          bookMarkerRedbridgedolphinviewpoint,
          bookMarkerBangPuRecreationCenter,
          bookMarkerMaeklongRailwayMarket
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

Marker bookMarkerKiriwongTemple = Marker(
  markerId: MarkerId('Kiriwong Temple'),
  position: LatLng(15.71323,100.1265861), //ปักหมุด
  infoWindow: InfoWindow(title: 'Kiriwong Temple'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bookMarkerThungBuaDaengFloatingMarket = Marker(
  markerId: MarkerId('Thung Bua Daeng\nFloating Market'),
  position: LatLng(16.5018157,98.7523984), //ปักหมุด
  infoWindow: InfoWindow(title: 'Thung Bua Daeng\nFloating Market'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerSarikawaterfall = Marker(
  markerId: MarkerId('Sarika waterfall"'),
  position: LatLng(
    14.3087955,101.253167,
  ), //ปักหมุด
  infoWindow: InfoWindow(title: 'Sarika waterfall"'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerWatMahathat = Marker(
  markerId: MarkerId('Wat Mahathat'),
  position: LatLng(14.3569443,100.5653225), //ปักหมุด
  infoWindow: InfoWindow(title: 'Wat Mahathat'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//Khao San Road  13.7587268,100.4974355
Marker bookMarkerKhunInthapramunTemple = Marker(
  markerId: MarkerId('Khun Inthapramun Temple'),
  position: LatLng(14.6420612,100.4267137),
  infoWindow: InfoWindow(title: 'Khun Inthapramun Temple'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.7558694,100.503332 Nitasrattanakosin

Marker bookMarkerHupWongReservoir = Marker(
  markerId: MarkerId('Hup Wong Reservoir '),
  position: LatLng(14.7887901,99.5389374),
  infoWindow: InfoWindow(title: 'Hup Wong Reservoir'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.7526286,100.4941149 Bangkok City Pillar Shrine

Marker bookMarkerRedbridgedolphinviewpoint = Marker(
  markerId: MarkerId('Red Boardwalk bridge'),
  position: LatLng(13.4875943,100.3621788),
  infoWindow: InfoWindow(title: 'Red Boardwalk bridge'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.746799,100.5328184 Sea Life Ocean World
Marker bookMarkerMaeklongRailwayMarket = Marker(
  markerId: MarkerId('Maeklong Railway Market '),
  position: LatLng(13.4075096,99.9987779),
  infoWindow: InfoWindow(title: 'Maeklong Railway Market'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.746799,100.5328184 Asiatique the Riverfront
Marker bookMarkerBangPuRecreationCenter = Marker(
  markerId: MarkerId('Bang Pu Recreation Center '),
  position: LatLng(13.5172594,100.6527381),
  infoWindow: InfoWindow(title: 'Bang Pu Recreation Center'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.746799,100.5328184, "Sea Life Ocean World",

Marker bookMarkerPhuThapBerk = Marker(
  markerId: MarkerId('Phu Thap Berk'),
  position: LatLng(16.9046522,101.1003309),
  infoWindow: InfoWindow(title: 'Phu Thap Berk'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
