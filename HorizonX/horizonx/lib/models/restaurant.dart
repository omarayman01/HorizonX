import 'dart:convert';
import 'dart:io';

import 'place.dart';

class Restaurant extends Place {
  // Additional properties specific to restaurants can go here

  Restaurant({
    required String cityId,
    required String name,
    required String description,
    required String location,
    required String address,
    required String longitude,
    required String latitude,
    required String picture,
    required double rate,
    required int numberOfRatings,
    bool activeNow = false,
  }) : super(
    cityId: cityId,
    name: name,
    description: description,
    location: location,
    address: address,
    longitude: longitude,
    latitude: latitude,
    picture: picture,
    rate: rate,
    numberOfRatings: numberOfRatings,
    activeNow: activeNow,
  );

  // A method to convert JSON to a Restaurant object
  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      cityId: json['cityId'],
      name: json['name'],
      description: json['description'],
      location: json['location'],
      address: json['address'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      picture: json['picture'],
      rate: (json['rate'] as num).toDouble(),
      numberOfRatings: json['numberOfRatings'],
      activeNow: json['activeNow'] ?? false,
    );
  }

  // A method to convert a Restaurant object to JSON
  @override
  Map<String, dynamic> toJson() {
    return super.toJson();
  }

  // Method to import JSON files and put them into a list
  static Future<List<Restaurant>> importFromJson(String filePath) async {
    final File file = File(filePath);
    final String jsonString = await file.readAsString();
    final List<dynamic> jsonData = jsonDecode(jsonString);

    return jsonData.map((json) => Restaurant.fromJson(json)).toList();
  }

}
