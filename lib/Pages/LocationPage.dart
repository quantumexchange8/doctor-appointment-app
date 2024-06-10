import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/data/LocationInfo.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:doctor_appointment_app/const/constant.dart';
import 'package:provider/provider.dart';
import 'package:doctor_appointment_app/controllers/favourite_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  TextEditingController searchController = TextEditingController(); //for search doctor and hospital
  // ignore: unused_field
  GoogleMapController? _controller;

  final List<LatLng> mapLocations = const [
    LatLng(37.38796133580664, -122.085749655962),
    LatLng(37.41796133580664, -122.085749655962),
    LatLng(37.40796133580664, -122.087749655962),
    LatLng(37.38796133580664, -122.106749655962),
    LatLng(37.42796133580664, -122.075749655962),
    LatLng(37.39796133580664, -122.065749755962),
    LatLng(37.41796133580664, -122.106749655962),
  ];

  late List<MarkerData> _customMarkers;

  static const CameraPosition _cPosition = CameraPosition(
    target: LatLng(37.40796133580664, -122.087749655962),
    bearing: 192.1556244,
    //tilt: 37.154895624,
    zoom: 13.158565,
  );

  @override
  void initState() {
    super.initState();
    _customMarkers = [
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-1'), position: mapLocations[0]),
          child: _customMarker('assets/image/search_doctor5.png', Colors.black)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-2'), position: mapLocations[1]),
          child: _customMarker('assets/image/doctor2.png', Colors.black)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-3'), position: mapLocations[2]),
          child: _customMarker('assets/image/search_doctor9.png', Colors.black)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-4'), position: mapLocations[3]),
          child: _customMarker('assets/image/search_doctor10.png', Colors.black)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-5'), position: mapLocations[4]),
          child: _customMarker('assets/image/search_doctor11.png', Colors.black)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-6'), position: mapLocations[5]),
          child: _customMarker('assets/image/search_doctor13.png', Colors.black)),
      MarkerData(
          marker:
              Marker(markerId: const MarkerId('id-6'), position: mapLocations[6]),
          child: _customMarker('assets/image/search_doctor2.png', Colors.black)),
    ];
  }

  _customMarker(String imageDoctor, Color color) {
    return Stack(
      children: [
        Icon(
          Icons.add_location,
          color: color,
          size: 50,
        ),
        Positioned(
          left: 15,
          top: 8,
          child: CircleAvatar(
            radius: 10, // Adjust the radius as needed
            backgroundColor: Colors.white,
            child: ClipOval(
              child: Image.asset(
                imageDoctor,
                width: 20,
                height: 20,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          CustomGoogleMapMarkerBuilder(
            //screenshotDelay: const Duration(seconds: 4),
            customMarkers: _customMarkers,
            builder: (BuildContext context, Set<Marker>? markers) {
              if (markers == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _cPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                },
                markers: markers,
              );
            },
          ),

          Positioned(
            top: 55.0,
            left: 15.0,
            right: 15.0,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: primaryGrey.shade100,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: primaryGrey.shade100),
                  boxShadow: [
                    BoxShadow(
                      color: primaryGrey.shade400,
                      offset: Offset(0, 3),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Iconsax.search_normal,
                        color: primaryGrey.shade400),
                    const SizedBox(width: 10.0),
                    Text('Search Doctor, Hospital',
                        style: TextStyle(color: primaryGrey.shade400)),
                  ],
                ),
              ),
            ),
          ),

          // Details of the hospital or doctor (containers below)

          Positioned(
            bottom: 28.0,
            left: 15.0,
            right: 15.0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: PlaceList.map((place) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Container(
                      width: 230,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: primaryGrey.shade200,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Column(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(place.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: primaryGrey.shade500
                                              .withOpacity(0.4),
                                        ),
                                        child: Consumer<FavouriteProvider>(
                                          builder: (context, value, child) {
                                            final isFavourite =
                                                provider.isFavourite(place);
                                            return IconButton(
                                              icon: Icon(
                                                  isFavourite
                                                      ? Iconsax.heart5
                                                      : Iconsax.heart,
                                                  color: Colors.white,
                                                  size: 15.0),
                                              onPressed: () {
                                                provider.toggleLocationFavourite(place);          
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Container(
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(place.name,
                                            style: h4,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1),
                                        const SizedBox(height: 8.0),
                                        Row(
                                          children: [
                                            Icon(Iconsax.location,
                                                size: 15.0,
                                                color: primaryGrey.shade500),
                                            const SizedBox(width: 3),
                                            Expanded(
                                              child: Text(place.address,
                                                  style: bodyXSregular,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text(place.starRate.toString(),
                                                style: bodyXSregularGrey),
                                            RatingBar.builder(
                                              initialRating: place.starRate,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: 15,
                                              itemBuilder: (context, _) =>
                                                  Icon(
                                                Iconsax.star1,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            const SizedBox(width: 3),
                                            Text(
                                                '(${place.clinicReview} Reviews)',
                                                style: bodyXSregularGrey),
                                          ],
                                        ),
                                        Divider(
                                          thickness: 1,
                                          color: primaryGrey.shade200,
                                          height: 25.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Iconsax.routing,
                                                    size: 15.0,
                                                    color:
                                                        primaryGrey.shade500),
                                                const SizedBox(width: 3),
                                                Text(place.distance,
                                                    style: bodyXSregularGrey),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(Iconsax.hospital5,
                                                    size: 15.0,
                                                    color:
                                                        primaryGrey.shade500),
                                                const SizedBox(width: 3),
                                                Text(place.type,
                                                    style: bodyXSregularGrey),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
