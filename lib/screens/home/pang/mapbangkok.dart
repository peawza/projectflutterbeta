import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class mapbankokPage extends StatefulWidget {
  @override
  mapbankokPageState createState() => mapbankokPageState();
}

class mapbankokPageState extends State<mapbankokPage> {
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
        CameraPosition(target: LatLng(13.754863, 100.493348), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(13.754863, 100.493348), zoom: zoomVal)));
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
                  "https://sv1.picz.in.th/images/2020/03/19/QgYaaD.jpg",
                  13.7516348,
                  100.4915796,
                  "Wat Phra Kaew"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sv1.picz.in.th/images/2020/03/19/QgY6Wn.jpg",
                  13.7233212,
                  100.5283196,
                  "King Power\nMahanakhon"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sv1.picz.in.th/images/2020/03/19/QgY2xQ.jpg",
                  13.7412118,
                  100.5081789,
                  "Chinatown"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sv1.picz.in.th/images/2020/03/19/QgYV31.jpg",
                  13.7762674,
                  100.4544092,
                  "Taling Chan\nFloating Market"),
            ), //13.7665171,100.5665007
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sv1.picz.in.th/images/2020/03/19/QgYXOy.jpg",
                  13.7665171,
                  100.5665007,
                  "Train Night\nMarket Ratchada"),
            ), //13.7665171,100.5665007
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sv1.picz.in.th/images/2020/03/19/QgYCnS.jpg",
                  13.7587268,
                  100.4974355,
                  "Khao San Road"),
            ), //Khao San Road  13.7587268,100.4974355
            SizedBox(width: 10.0),
            //13.7558694,100.503332 Nitasrattanakosin 13.7526286,100.4941149
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sv1.picz.in.th/images/2020/03/19/QgYnKg.jpg",
                  13.7558694,
                  100.503332,
                  "Nitasrattanakosin"),
            ),
            SizedBox(width: 10.0),
            //13.746799,100.5328184 Asiatique the Riverfront
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sv1.picz.in.th/images/2020/03/19/QgYszV.jpg",
                  13.704758, 100.501850,
                  "Asiatique the Riverfront"),
            ),
            SizedBox(width: 10.0),
            //13.7526286,100.4941149 Bangkok City Pillar Shrine
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sv1.picz.in.th/images/2020/03/19/QgYaaD.jpg",
                  13.7526286,
                  100.4941149,
                  "Bangkok City\nPillar Shrine"),
            ),
            SizedBox(width: 10.0),
            //13.746799,100.5328184 Sea Life Ocean World
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://sv1.picz.in.th/images/2020/03/19/QgY8e2.jpg",
                  13.746799,
                  100.5328184,
                  "Sea Life Ocean World"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String restaurantName) {
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
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName) {
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
        Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "4.1",
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
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Closed \u00B7 Opens 17:00 Thu",
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
            target: LatLng(13.7516348, 100.4915796), zoom: 13), //เลือกตำแหน่ง
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          gramercyMarker,
          bernardinMarker,
          bookMarkerChinatown,
          bookMarkerTalingChanFloatingMarket,
          bookMarkerTrainNightMarketRatchada,
          bookMarkerKhaoSanRoad,
          bookMarkerNitasrattanakosin,
          bookMarkerBangkokCityPillarShrine,
          bookMarkerAsiatiquetheRiverfront
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

Marker gramercyMarker = Marker(
  markerId: MarkerId('Wat Phra Kaew'),
  position: LatLng(13.7516348, 100.4915796), //ปักหมุด
  infoWindow: InfoWindow(title: 'Wat Phra Kaew'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bookMarkerChinatown = Marker(
  markerId: MarkerId('Chinatown'),
  position: LatLng(13.7412118, 100.5081789), //ปักหมุด
  infoWindow: InfoWindow(title: 'Chinatown'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerTalingChanFloatingMarket = Marker(
  markerId: MarkerId('Taling Chan Floating Market'),
  position: LatLng(13.7762674, 100.4544092), //ปักหมุด
  infoWindow: InfoWindow(title: 'Taling Chan Floating Market'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerTrainNightMarketRatchada = Marker(
  markerId: MarkerId('Train Night Market Ratchada'),
  position: LatLng(13.7665171, 100.5665007), //ปักหมุด
  infoWindow: InfoWindow(title: 'Train Night Market Ratchada'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//Khao San Road  13.7587268,100.4974355
Marker bookMarkerKhaoSanRoad = Marker(
  markerId: MarkerId('Khao San Road '),
  position: LatLng(13.7587268, 100.4974355),
  infoWindow: InfoWindow(title: 'Khao San Road'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.7558694,100.503332 Nitasrattanakosin

Marker bookMarkerNitasrattanakosin = Marker(
  markerId: MarkerId('Nitasrattanakosin '),
  position: LatLng(13.7558694, 100.503332),
  infoWindow: InfoWindow(title: 'Nitasrattanakosin'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.7526286,100.4941149 Bangkok City Pillar Shrine

Marker bookMarkerBangkokCityPillarShrine = Marker(
  markerId: MarkerId('Bangkok City Pillar Shrine '),
  position: LatLng(13.7526286, 100.4941149),
  infoWindow: InfoWindow(title: 'Bangkok City Pillar Shrine'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.746799,100.5328184 Sea Life Ocean World
Marker bookMarkerSeaLifeOceanWorld = Marker(
  markerId: MarkerId('Sea Life Ocean World '),
  position: LatLng(13.746799, 100.5328184),
  infoWindow: InfoWindow(title: 'Sea Life Ocean World'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.746799,100.5328184 Asiatique the Riverfront
Marker bookMarkerAsiatiquetheRiverfront = Marker(
  markerId: MarkerId('Asiatique the Riverfront '),
  position: LatLng(13.7044191, 100.5010784),
  infoWindow: InfoWindow(title: 'Asiatique the Riverfront'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bernardinMarker = Marker(
  markerId: MarkerId('KING POWER \n MAHANAKHON'),
  position: LatLng(13.7233652, 100.5282494),
  infoWindow: InfoWindow(title: 'KING POWER MAHANAKHON'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
/*
//Train Night Market Ratchada
Marker blueMarker = Marker(
  markerId: MarkerId('bluehill'),
  position: LatLng(40.732128, -73.999619),
  infoWindow: InfoWindow(title: 'Blue Hill'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//New York Marker

Marker newyork1Marker = Marker(
  markerId: MarkerId('newyork1'),
  position: LatLng(40.742451, -74.005959),
  infoWindow: InfoWindow(title: 'Los Tacos'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker newyork2Marker = Marker(
  markerId: MarkerId('newyork2'),
  position: LatLng(40.729640, -73.983510),
  infoWindow: InfoWindow(title: 'Tree Bistro'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker newyork3Marker = Marker(
  markerId: MarkerId('newyork3'),
  position: LatLng(40.719109, -74.000183),
  infoWindow: InfoWindow(title: 'Le Coucou'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);


 */