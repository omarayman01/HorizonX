import 'package:flutter/material.dart';
import '../constants.dart';
import '../data.dart';
import '../models/restaurant.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/place_card.dart';
import '../widgets/place_view.dart';

class Restaurants extends StatelessWidget {
  List<Restaurant> restaurantList = Data.restaurantList;

  Restaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return placeView(context, "Restaurants", restaurantList);
  }
}
