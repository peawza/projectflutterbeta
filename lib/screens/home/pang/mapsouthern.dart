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
                    "https://sv1.picz.in.th/images/2020/03/19/QiKcUf.jpg",
                    7.758863,
                    98.3013303,
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
                    "https://sv1.picz.in.th/images/2020/03/19/QiKZNb.jpg",
                    8.1341515,
                    98.2939967,
                    "Mai Khao beach",
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
                    "https://sv1.picz.in.th/images/2020/03/19/QiKxcz.jpg",
                    8.2387217,
                    98.4432624,
                    "Samet Nang She Viewpoint",
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
                    "https://sv1.picz.in.th/images/2020/03/19/QiK5T0.jpg",
                    8.6487347,
                    97.6277508,
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
                    "https://sv1.picz.in.th/images/2020/03/19/QiKR0q.jpg",
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
                    "https://sv1.picz.in.th/images/2020/03/19/QiKEju.jpg",
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
                    "https://sv1.picz.in.th/images/2020/03/19/QiKQs8.jpg",
                    7.1985835,
                    100.5867381,
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
                    "https://sv1.picz.in.th/images/2020/03/19/QiKUyR.jpg",
                    19.4979376,
                    97.9078109,
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
                    "https://sv1.picz.in.th/images/2020/03/19/QiKgra.jpg",
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
                  "https://sv1.picz.in.th/images/2020/03/19/QiKOvZ.jpg",
                  7.4112606,
                  99.5136204,
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
          bookMarkerDoiInthanonNationalPark,
          bookMarkerDoiMaeUKho,
          bookMarkerDoiAngKhang,
          bookMarkerHuaiNamDangNationalPark,
          bookMarkerTrainNightMarketRatchada,
          bookMarkerWatRongKhun,
          bookMarkerDoiTungRoyalVilla,
          bookMarkerSiNanNationalPark,
          bookMarkerPangOung,
          bookMarkerKhunSathanNationalPark
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

Marker bookMarkerDoiInthanonNationalPark = Marker(
  markerId: MarkerId('Doi Inthanon\nNational Park'),
  position: LatLng(18.5358321, 98.520961), //ปักหมุด
  infoWindow: InfoWindow(title: 'Doi Inthanon National Park'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker bookMarkerDoiAngKhang = Marker(
  markerId: MarkerId('Doi Ang Khang'),
  position: LatLng(19.869721, 99.0374904), //ปักหมุด
  infoWindow: InfoWindow(title: 'Doi Ang Khang'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerHuaiNamDangNationalPark = Marker(
  markerId: MarkerId('Huai Nam Dang\nNational Park'),
  position: LatLng(
    19.303936,
    98.5966806,
  ), //ปักหมุด
  infoWindow: InfoWindow(title: 'Huai Nam Dang\nNational Park'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker bookMarkerTrainNightMarketRatchada = Marker(
  markerId: MarkerId('Phu Chi Fa'),
  position: LatLng(19.8506537, 100.4531632), //ปักหมุด
  infoWindow: InfoWindow(title: 'Phu Chi Fa'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//Khao San Road  13.7587268,100.4974355
Marker bookMarkerWatRongKhun = Marker(
  markerId: MarkerId('Wat Rong Khun'),
  position: LatLng(19.8242236, 99.7626755),
  infoWindow: InfoWindow(title: 'Wat Rong Khun'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.7558694,100.503332 Nitasrattanakosin

Marker bookMarkerDoiTungRoyalVilla = Marker(
  markerId: MarkerId('Doi Tung Royal Villa '),
  position: LatLng(20.2926014, 99.8078124),
  infoWindow: InfoWindow(title: 'Doi Tung Royal Villa'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.7526286,100.4941149 Bangkok City Pillar Shrine

Marker bookMarkerSiNanNationalPark = Marker(
  markerId: MarkerId('Si Nan National Park '),
  position: LatLng(18.3577358, 100.8312127),
  infoWindow: InfoWindow(title: 'Si Nan National Park'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.746799,100.5328184 Sea Life Ocean World
Marker bookMarkerKhunSathanNationalPark = Marker(
  markerId: MarkerId('Khun Sathan National Park '),
  position: LatLng(18.2770774, 100.520795),
  infoWindow: InfoWindow(title: 'Khun Sathan National Park'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//13.746799,100.5328184 Asiatique the Riverfront
Marker bookMarkerPangOung = Marker(
  markerId: MarkerId('Pang Oung '),
  position: LatLng(19.4979376, 97.9078109),
  infoWindow: InfoWindow(title: 'Pang Oung'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
//13.746799,100.5328184, "Sea Life Ocean World",

Marker bookMarkerDoiMaeUKho = Marker(
  markerId: MarkerId('Doi Mae U-Kho'),
  position: LatLng(18.8947033, 98.0889057),
  infoWindow: InfoWindow(title: 'Doi Mae U-Kho'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
