class Place {
  String cityId;
  String name;
  String description;
  String location;
  String address;
  String longitude;
  String latitude;
  String picture;
  double rate;
  int numberOfRatings;
  bool activeNow;

  Place({
    required this.cityId,
    required this.name,
    required this.description,
    required this.location,
    required this.address,
    required this.longitude,
    required this.latitude,
    required this.picture,
    required this.rate,
    required this.numberOfRatings,
    this.activeNow = false,
  });

  // A method to convert a JSON object to a Place object
  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
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

  // A method to convert a Place object to JSON
  Map<String, dynamic> toJson() {
    return {
      'cityId': cityId,
      'name': name,
      'description': description,
      'location': location,
      'address': address,
      'longitude': longitude,
      'latitude': latitude,
      'picture': picture,
      'rate': rate,
      'numberOfRatings': numberOfRatings,
      'activeNow': activeNow,
    };
  }
}
