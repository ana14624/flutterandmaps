// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatefulWidget {
  String name;
  String lat;
  String long_;
  // const GoogleMaps({Key? key}) : super(key: key, this.lat, this.long_);
  GoogleMaps(this.lat, this.long_, this.name);

  @override
  State<GoogleMaps> createState() => _MyAppState();
}

class _MyAppState extends State<GoogleMaps> {
  late GoogleMapController mapController;
  final Set<Marker> _markers = {};

  void _addMarkers() {
    LatLng _center =
        LatLng(double.parse(widget.lat), double.parse(widget.long_));
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_center.toString()),
        position: _center,
        infoWindow: InfoWindow(
          title: 'Really cool place',
          snippet: '5 Star Rating',
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _close() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Mapa de: " + widget.name)),
          body: Stack(
            children: <Widget>[
              GoogleMap(
                onMapCreated: _onMapCreated,
                markers: _markers,
                initialCameraPosition: CameraPosition(
                    target: LatLng(
                        double.parse(widget.lat), double.parse(widget.long_)),
                    zoom: 16,
                    tilt: 1.1),
              ),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Column(
                      children: <Widget>[
                        FloatingActionButton(
                          onPressed: _close,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          backgroundColor: Colors.red[800],
                          child: const Icon(Icons.reply_sharp, size: 24.0),
                        ),
                        FloatingActionButton(
                          onPressed: _addMarkers,
                          materialTapTargetSize: MaterialTapTargetSize.padded,
                          backgroundColor: Colors.blue[800],
                          child: const Icon(Icons.add_location, size: 24.0),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
