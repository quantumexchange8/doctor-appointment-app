import 'package:doctor_appointment_app/controllers/favourite_provider.dart';
import 'package:doctor_appointment_app/const/constant.dart';
import 'package:doctor_appointment_app/const/text_style.dart';
import 'package:doctor_appointment_app/data/LocationInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class LocationContainer extends StatelessWidget {
  final Place place;

  LocationContainer({super.key,
  required this.place});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
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
                            color: primaryGrey.shade500.withOpacity(0.4),
                          ),
                          child: Consumer<FavouriteProvider>(
                            builder: (context, provider, child) {
                              final isFavourite = provider.isFavourite(place);
                              return IconButton(
                                icon: Icon(
                                  isFavourite ? Iconsax.heart : Iconsax.heart5,
                                  color: Colors.white,
                                  size: 15.0,
                                ),
                                onPressed: () {
                                  _showRemoveLocationFavouriteModal(context, place); //remove provider
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            place.name,
                            style: h4,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            children: [
                              Icon(Iconsax.location, size: 15.0, color: primaryGrey.shade500),
                              const SizedBox(width: 3),
                              Expanded(
                                child: Text(
                                  place.address,
                                  style: bodyXSregular,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(place.starRate.toString(), style: bodyXSregularGrey),
                              RatingBar.builder(
                                initialRating: place.starRate,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 15,
                                itemBuilder: (context, _) => Icon(
                                  Iconsax.star1,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                              const SizedBox(width: 3),
                              Text('(${place.clinicReview} Reviews)', style: bodyXSregularGrey),
                            ],
                          ),
                          Divider(thickness: 1, color: primaryGrey.shade200, height: 25.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Iconsax.routing, size: 15.0, color: primaryGrey.shade500),
                                  const SizedBox(width: 3),
                                  Text(place.distance, style: bodyXSregularGrey),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Iconsax.hospital5, size: 15.0, color: primaryGrey.shade500),
                                  const SizedBox(width: 3),
                                  Text(place.type, style: bodyXSregularGrey),
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
  }

  void _showRemoveLocationFavouriteModal(BuildContext context, Place place) { //remove FavouriteProvider provider
    showModalBottomSheet(
      context: context,
      builder: ((context) {
        return Consumer<FavouriteProvider>(  //add Consumer here and builder here
          builder: (context, provider, child) {
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text('Remove from Favorites?', style: h3),
                  ),
                  Divider(thickness: 1, color: primaryGrey.shade300, height: 20.0),
                  // Show the container of the hospital/place
                  LocationContainer(place: place),
                  const SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 35.0,
                          width: 145.0,
                          child: FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade300),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            child: Text('Cancel', style: bodySbold),
                          ),
                        ),
                        SizedBox(
                          height: 35.0,
                          width: 145.0,
                          child: FilledButton(
                            onPressed: () {
                              provider.toggleLocationFavourite(place);
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith((states) => primaryGrey.shade900),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                              ),
                            ),
                            child: Text('Yes, Remove', style: bodySboldWhite),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
