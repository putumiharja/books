import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String myPosition = '';
  Future<Position>? position;

  // @override
  // void initState() {
  //   super.initState();
  //   getPosition().then((Position myPos) {
  //     myPosition =
  //         'Latitude: ${myPos.latitude.toString()} - Longtitude: ${myPos.longitude.toString()}';
  //     setState(() {
  //       myPosition = myPosition;
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    position = getPosition();
  }

  @override
  Widget build(BuildContext context) {
    // final myWidget = myPosition == ''
    //     ? const CircularProgressIndicator()
    //     : Text(myPosition); // Soal 12

    // return Scaffold(
    //   appBar: AppBar(title: const Text("Eka")),
    //   body: Center(child: myWidget),
    // );

    // return Scaffold(
    //   appBar: AppBar(title: const Text("Eka")),
    //   body: Center(
    //     child: FutureBuilder<Position>(
    //       future: position,
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return const CircularProgressIndicator(); // ← Loading animasi tampil
    //         } else if (snapshot.hasError) {
    //           return Text('Error: ${snapshot.error}');
    //         } else if (snapshot.hasData) {
    //           final position = snapshot.data!;
    //           return Text(
    //             'Latitude: ${position.latitude} - Longitude: ${position.longitude}',
    //           );
    //         } else {
    //           return const Text("Eka");
    //         }
    //       },
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(title: const Text("Current Location")),
      body: Center(
        child: FutureBuilder(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // ← Loading animasi tampil
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Text(snapshot.data.toString());
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }

  Future<Position> getPosition() async {
    // await Geolocator.requestPermission();
    // await Geolocator.isLocationServiceEnabled();
    // await Future.delayed(const Duration(
    //     seconds:
    //         3)); // Animasi loading ditambahkan karena saat proses run sebelumnya, animasi tidak muncul
    // Position position = await Geolocator.getCurrentPosition();
    // return position;

    await Geolocator.isLocationServiceEnabled();
    await Future.delayed(const Duration(seconds: 3));
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
