import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizonx/app_theme.dart';
import 'package:horizonx/constants.dart';
import 'package:horizonx/models/place.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:horizonx/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/custom_app_bar.dart';

abstract class Feature {
  String title;
  Feature(this.title);

  Widget buildContent();
}

class HowToGoFeature extends Feature {
  final Place place; // Add a reference to the Place object

  HowToGoFeature(this.place) : super('How to Go');

  @override
  Widget buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Here is the information on how to go to the place:',
          style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: AppTheme.primaryGoldColor),
        ),
        const SizedBox(height: 10),
        Text(
          place.address, // Use the address from the Place object
          style: const TextStyle(
            fontSize: 16,
            color: ConstColors.primaryBlueColor,
          ),
        ),
        const SizedBox(height: 10),

        // Button to open Google Maps
        ElevatedButton(
          onPressed: () {
            final uri = Uri.parse(place.location);
            launchUrl(uri, mode: LaunchMode.externalApplication);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ConstColors.primaryBlueColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text(
            'Open in Google Maps',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class ReviewsFeature extends Feature {
  ReviewsFeature() : super('Reviews');

  @override
  Widget buildContent() {
    return const Column(
      children: [
        Text(
          'Reviews feature will be available soon.',
          style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: AppTheme.primaryGoldColor),
        ),
      ],
    );
  }
}

class BookingFeature extends Feature {
  BookingFeature() : super('Booking');

  @override
  Widget buildContent() {
    return const Column(
      children: [
        Text(
          'Booking feature will be available soon.',
          style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: AppTheme.primaryGoldColor),
        ),
      ],
    );
  }
}

class FeatureButton extends StatelessWidget {
  final Feature feature;
  final bool isSelected;
  final VoidCallback onPressed;

  const FeatureButton({
    super.key,
    required this.feature,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = Provider.of<SettingsProvider>(context);

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? ConstColors.primaryBlueColor
              : settings.themeColor.withAlpha(100),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        ),
        child: Text(
          feature.title,
          style: TextStyle(
              color: isSelected ? Colors.white : ConstColors.primaryBlueColor),
        ));
  }
}

class PlaceDetailsScreen extends StatefulWidget {
  final Place place;
  const PlaceDetailsScreen({super.key, required this.place});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  late Feature selectedFeature;

  @override
  void initState() {
    super.initState();
    selectedFeature =
        HowToGoFeature(widget.place); // Pass the place to the feature
  }

  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = Provider.of<SettingsProvider>(context);

    return Scaffold(
      appBar: custom_app_bar(context, "Restaurants", settings),
      body: Scaffold(
        backgroundColor: settings.themeColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 15,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Stack(
                  children: [
                    // Image at the top
                    Image.network(
                      widget.place.picture ?? "assets/place/default",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 200,
                    ),
                    const Positioned(
                      top: 16,
                      right: 16,
                      child: Icon(
                        Icons.favorite_border,
                        color: ConstColors.primaryGoldColor,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 70,
                      child: Text(
                        widget.place.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              blurRadius: 8.0,
                              color: Colors.black,
                              offset: Offset(1.0, 1.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: Row(
                        children: [
                          Flexible(
                            child: Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: ConstColors.primaryGoldColor),
                                const SizedBox(width: 5),
                                Flexible(
                                  child: Text(
                                    widget.place.address,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      shadows: [
                                        Shadow(
                                          blurRadius: 6.0,
                                          color: Colors.black,
                                          offset: Offset(1.0, 1.0),
                                        ),
                                      ],
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          RatingBar.builder(
                              initialRating: widget.place.rate,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              unratedColor: Colors.grey,
                              itemCount: 5,
                              itemSize: 25.0,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                  ),
                              onRatingUpdate: print)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Description",
                      style: TextStyle(
                          color: ConstColors.primaryBlueColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.place.description,
                      style: const TextStyle(
                        color: ConstColors.primaryBlueColor,
                        fontSize: 16,
                      ),
                    ),
                    const Divider(
                      color: ConstColors.primaryBlueColor,
                      height: 25,
                      thickness: 0.7,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeatureButton(
                          feature: HowToGoFeature(
                              widget.place), // Pass the place to the feature
                          isSelected: selectedFeature is HowToGoFeature,
                          onPressed: () {
                            setState(() {
                              selectedFeature = HowToGoFeature(
                                  widget.place); // Update the selected feature
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        FeatureButton(
                          feature: ReviewsFeature(),
                          isSelected: selectedFeature is ReviewsFeature,
                          onPressed: () {
                            setState(() {
                              selectedFeature = ReviewsFeature();
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        FeatureButton(
                          feature: BookingFeature(),
                          isSelected: selectedFeature is BookingFeature,
                          onPressed: () {
                            setState(() {
                              selectedFeature = BookingFeature();
                            });
                          },
                        ),
                      ],
                    ),
                    const Divider(
                      color: ConstColors.primaryBlueColor,
                      height: 25,
                      thickness: 0.7,
                    ),
                    selectedFeature
                        .buildContent(), // This will now show the relevant feature content
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
