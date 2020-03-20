import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:condition/condition.dart';

class mapeastPage extends StatefulWidget {
  @override
  mapeastPageState createState() => mapeastPageState();
}

class mapeastPageState extends State<mapeastPage> {
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
        title: Text("East"),
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
                    "assets/immages/photo/mapeast/1Pattaya.jpg",
                    12.9297192,
                    100.8780822,
                    "Pattaya", //1 พัทยา
                    'Chon Buri',
                    '4.2',
                    '4',
                    '1,176',
                    'Open 24 hours',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapeast/2SamaeSanIsland.jpg",
                    12.5691274,
                    100.9354439,
                    "Samae San Island",
                    'Chon Buri',
                    '4.5',
                    '4.5',
                    '2,372',
                    'Open 24 hours',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapeast/3SuanPalmFarmNok.jpg",
                    13.7454762,
                    101.153889,
                    "Suan Palm Farm Nok",
                    'Chachoengsao',
                    '4',
                    '4',
                    '347',
                    '9:30–17:00',
                    '   -')),
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapeast/4KohKoodIsland.jpg",
                    11.6618769,
                    102.4964761,
                    "Koh Kood Island",
                    'Trat',
                    '4.6',
                    '4.5',
                    '1,357',
                    'Open 24 hours',
                    '   -')), //13.7665171,100.5665007
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapeast/5KohSamet.jpg",
                    12.5574165,
                    101.4500125,
                    "Koh Samet",
                    'Rayong',
                    '4.2',
                    '4',
                    '3,525',
                    'Open 24 hours',
                    '   -')), //13.7665171,100.5665007
            SizedBox(width: 10.0),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapeast/6TungProngthong.jpg",
                    12.7027315,
                    101.7110017,
                    "Tung Prongthong",
                    'Rayong',
                    '4.5',
                    '4.5',
                    '1,419',
                    '06:00 - 18:00',
                    '   -')), //Khao San Road  13.7587268,100.4974355
            SizedBox(width: 10.0),
            //13.7558694,100.503332 Nitasrattanakosin 13.7526286,100.4941149
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapeast/7ThapLanNationalPark.jpg",
                    14.2179107,
                    101.8993209,
                    "Thap Lan National Park",
                    'Prachinburi ',
                    '4.3',
                    '4',
                    '821',
                    'Open 24 hours',
                    '-')),
            SizedBox(width: 10.0),
            //13.746799,100.5328184 Asiatique the Riverfront
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapeast/8ChaoLaoBeach.jpg",
                    2.5338205,
                    101.9403762,
                    "Chao Lao Beach ",
                    'Chanthaburi',
                    '4.1',
                    '4',
                    '848',
                    'Open 24 hours',
                    '   -')),
            SizedBox(width: 10.0),
            //13.7526286,100.4941149 Bangkok City Pillar Shrine
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: _boxes(
                    "assets/immages/photo/mapeast/9PangSidaNationalPark.jpg",
                    13.9928689,
                    102.2044907,
                    "Pang Sida National Park",
                    'Sa Kaeo',
                    '4.3',
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
                  "assets/immages/photo/mapeast/10KungKrabaenBayDevelopmentStudyCenter.jpg",
                  12.5710842,
                  101.8964168,
                  "Kung Krabaen Bay\nDevelopment Study Center",
                  'Chanthaburi',
                  '4.5',
                  '4.5',
                  '1,058',
                  '08:00-18:00',
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
          bookMarkerPattaya,
          bookMarkerPangSidaNationalPark,
          bookMarkerSamaeSanIsland,
          bookMarkerSuanPalmFarmNok,
          bookMarkerKohKoodIsland,
          bookMarkerKohSamet,
          bookMarkerTungProngthong,
          bookMarkerThapLanNationalPark,
          bookMarkerKungKrabaenBayDevelopmentStudyCenter,
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

Marker bookMarkerPattaya = Marker(
  markerId: MarkerId('Pattaya'),
  position: LatLng(12.9297192, 100.8780822), //ปักหมุด
  infoWindow: InfoWindow(title: 'Pattaya'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bookMarkerSamaeSanIsland = Marker(
  markerId: MarkerId('Samae San Island'),
  position: LatLng(12.5691274, 100.9354439), //ปักหมุด
  infoWindow: InfoWindow(title: 'Samae San Island'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerSuanPalmFarmNok = Marker(
  markerId: MarkerId('Suan Palm Farm Nok'),
  position: LatLng(
    13.7454762,
    101.153889,
  ), //ปักหมุด
  infoWindow: InfoWindow(title: 'Suan Palm Farm Nok'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerKohKoodIsland = Marker(
  markerId: MarkerId('Koh Kood Island'),
  position: LatLng(11.6618769, 102.4964761), //ปักหมุด
  infoWindow: InfoWindow(title: 'Koh Kood Island'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//Khao San Road  13.7587268,100.4974355
Marker bookMarkerKohSamet = Marker(
  markerId: MarkerId('Koh Samet'),
  position: LatLng(12.5574165, 101.4500125),
  infoWindow: InfoWindow(title: 'Koh Samet'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.7558694,100.503332 Nitasrattanakosin

Marker bookMarkerTungProngthong = Marker(
  markerId: MarkerId('Tung Prongthong '),
  position: LatLng(12.7027315, 101.7110017),
  infoWindow: InfoWindow(title: 'Tung Prongthong'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.7526286,100.4941149 Bangkok City Pillar Shrine

Marker bookMarkerThapLanNationalPark = Marker(
  markerId: MarkerId('Thap Lan National Park '),
  position: LatLng(14.2179107, 101.8993209),
  infoWindow: InfoWindow(title: 'Thap Lan National Park'),
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
Marker bookMarkerKungKrabaenBayDevelopmentStudyCenter = Marker(
  markerId: MarkerId('Kung Krabaen Bay \nDevelopment Study Center '),
  position: LatLng(12.5710842, 101.8964168),
  infoWindow: InfoWindow(title: 'Kung Krabaen Bay \nDevelopment Study Center'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.746799,100.5328184, "Sea Life Ocean World",

Marker bookMarkerPangSidaNationalPark = Marker(
  markerId: MarkerId('Pang Sida National Park'),
  position: LatLng(13.9928689, 102.2044907),
  infoWindow: InfoWindow(title: 'Pang Sida National Park'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
