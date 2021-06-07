import 'dart:async';

import 'package:automotiveapp/models/place.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:automotiveapp/blocs/appdata.dart';

class GarageMap extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Map(),
      ),
    );
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  Completer<GoogleMapController> _mapController = Completer();
  StreamSubscription locationSubscription;
  StreamSubscription boundsSubscription;

  @override
  void initState() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);

    locationSubscription =
        applicationBloc.selectedLocation.stream.listen((place) {
      if (place != null) {
        _goToPlace(place);
      }
    });

    applicationBloc.bounds.stream.listen((bounds) async {
      final GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    });
    super.initState();
  }

  @override
  void dispose() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);
    applicationBloc.dispose();
    // _locationController.dispose();
    locationSubscription.cancel();
    boundsSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: (applicationBloc.currentLocation == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Location',
                      suffixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) => applicationBloc.searchPlaces(value),
                  ),
                ),
                Stack(children: [
                  Container(
                    height: 300.0,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                          target: LatLng(
                              applicationBloc.currentLocation.latitude,
                              applicationBloc.currentLocation.longitude),
                          zoom: 14.0),
                      onMapCreated: (GoogleMapController controller) {
                        _mapController.complete(controller);
                      },
                      markers: Set<Marker>.of(applicationBloc.markers),
                    ),
                  ),
                  if (applicationBloc.searchResults != null &&
                      applicationBloc.searchResults.length != 0)
                    Container(
                        height: 300.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(.6),
                            backgroundBlendMode: BlendMode.darken)),
                  if (applicationBloc.searchResults != null &&
                      applicationBloc.searchResults.length != 0)
                    Container(
                        height: 300.0,
                        child: ListView.builder(
                            itemCount: applicationBloc.searchResults.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                  title: Text(
                                    applicationBloc
                                        .searchResults[index].main_text,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    applicationBloc
                                        .searchResults[index].secondary_text,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    applicationBloc.setSelectedLocation(
                                        applicationBloc
                                            .searchResults[index].place_id);
                                  });
                            }))
                ]),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Find Nearest',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: [
                      FilterChip(
                        label: Text('Car Garages'),
                        onSelected: (val) =>
                            applicationBloc.togglePlaceType('car_repair', val),
                        selected: applicationBloc.placeType == 'car_repair',
                        selectedColor: Colors.blue,
                      ),
                      FilterChip(
                        label: Text('Car Dealers'),
                        onSelected: (val) =>
                            applicationBloc.togglePlaceType('car_dealer', val),
                        selected: applicationBloc.placeType == 'car_dealer',
                        selectedColor: Colors.blue,
                      ),
                      FilterChip(
                        label: Text('Car Rental'),
                        onSelected: (val) =>
                            applicationBloc.togglePlaceType('car_rental', val),
                        selected: applicationBloc.placeType == 'car_rental',
                        selectedColor: Colors.blue,
                      ),
                      FilterChip(
                        label: Text('Car Wash'),
                        onSelected: (val) =>
                            applicationBloc.togglePlaceType('car_wash', val),
                        selected: applicationBloc.placeType == 'car_wash',
                        selectedColor: Colors.blue,
                      ),
                    ],
                  ),
                )
              ]));
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry.location.lat, place.geometry.location.lng),
            zoom: 14.0),
      ),
    );
  }
}
