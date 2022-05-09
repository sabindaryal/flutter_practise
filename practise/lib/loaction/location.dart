import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class loacationApp extends StatefulWidget {
  const loacationApp({Key? key}) : super(key: key);

  @override
  State<loacationApp> createState() => _loacationAppState();
}

class _loacationAppState extends State<loacationApp> {
  // late Position _currentPosition;
  // _getCurrentLocation() {
  //   Geolocator.getCurrentPosition(
  //           desiredAccuracy: LocationAccuracy.best,
  //           forceAndroidLocationManager: true)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //     });
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }
  var locaionMessage = '';
  void getCurrentLocation() async {
    var positon = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPostion = await Geolocator.getLastKnownPosition();

    var lat = positon.latitude;
    var long = positon.longitude;
    setState(() {
      locaionMessage = "latidude:$lat  , longitude:$long  ";
    });
  }
//   getloc() async {
//     try {
//       List<Placemark> placemarks = await placemarkFromCoordinates(
//         locaionMessage.latitude,
//         locaionMessage.longitude
//       );

//       Placemark place = placemarks[0];

//       setState(() {
//         _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
// }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('get location')),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Center(
              child: ElevatedButton(
                  onPressed: () {
                    getCurrentLocation();
                  },

                  // _getCurrentLocation(),
                  child: const Text('Get Location'))),
          Text(locaionMessage),
          // Text(
          //     "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"
          //         .toString()),
        ],
      )),
    );
  }
}
