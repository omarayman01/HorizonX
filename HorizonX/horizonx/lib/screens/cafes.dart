import 'package:flutter/material.dart';
import '../data.dart';
import '../models/cafe.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/place_card.dart';
import '../widgets/place_view.dart';

class Cafes extends StatelessWidget {
  List<Cafe> cafeList = Data.cafeList;

  Cafes({super.key});

  @override
  Widget build(BuildContext context) {
    return placeView(context, "Cafes", cafeList);
  }
}
