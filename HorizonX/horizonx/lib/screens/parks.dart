import 'package:flutter/material.dart';

import '../data.dart';
import '../models/place.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/place_card.dart';
import '../widgets/place_view.dart';

class Parks extends StatelessWidget {
  Parks({super.key});
  List<Place> parksList = Data.parksList;

  @override
  Widget build(BuildContext context) {
    return placeView(context, "Parks", parksList);
  }
}
