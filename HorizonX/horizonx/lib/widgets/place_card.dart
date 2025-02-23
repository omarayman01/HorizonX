import 'package:flutter/material.dart';
import 'package:horizonx/screens/PlaceDetails_screen.dart';
import 'package:horizonx/settings_provider.dart';
import 'package:provider/provider.dart';
import '../models/place.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Widget cafesOrRestaurants(BuildContext context, Place place) {
  SettingsProvider settings = Provider.of<SettingsProvider>(context);

  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PlaceDetailsScreen(
            place: place,
          ),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: SizedBox(
        height: 240,
        width: double.infinity,
        child: Card(
          color: settings.themeColor,
          margin: const EdgeInsets.all(0),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                // Image
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  child: Image.network(
                    place.picture, // Replace with your image URL
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(1),
                      ],
                    ),
                  ),
                ),
                // Title
                Positioned(
                  top: 50,
                  bottom: 0,
                  left: 15,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        place.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.52,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 180,
                    left: 10,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.orange,
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            place.address,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        RatingBar.builder(
                            initialRating: place.rate,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            unratedColor: Colors.grey,
                            itemCount: 5,
                            itemSize: 20.0,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                ),
                            onRatingUpdate: print)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
