import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key, this.locationCoords});

  final LatLng? locationCoords;

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Geolocator.requestPermission().then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Map Page',
            style: TextStyle(
              color: Color.fromARGB(255, 77, 75, 75),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: FutureBuilder(
            future: Geolocator.getCurrentPosition(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const CircularProgressIndicator();
              }
              return FlutterMap(
                options: MapOptions(
                  initialCenter:
                      LatLng(snapshot.data!.latitude, snapshot.data!.longitude),
                  initialZoom: 9.2,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  if (widget.locationCoords != null)
                    MarkerLayer(markers: [
                      Marker(
                          width: 30,
                          height: 30.0,
                          point: widget.locationCoords!,
                          child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            padding: const EdgeInsets.all(6.0),
                            child: const Icon(
                              Icons.restaurant,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ))
                    ])
                ],
              );
            }));
  }
}
