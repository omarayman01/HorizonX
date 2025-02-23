import 'package:flutter/material.dart';
import 'package:horizonx/widgets/custom_app_bar.dart';

import '../data.dart';
import '../models/place.dart';
import '../widgets/place_card.dart';
import '../widgets/place_view.dart';

class Tourism extends StatelessWidget {
   Tourism({super.key});
  List<Place> tourismList = Data.tourismList;
  @override
  Widget build(BuildContext context) {
    return placeView(context, "Tourism", tourismList);
  }
}
