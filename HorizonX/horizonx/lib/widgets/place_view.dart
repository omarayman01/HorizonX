import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horizonx/settings_provider.dart';
import 'package:horizonx/widgets/place_card.dart';
import 'package:provider/provider.dart';

import '../models/place.dart';
import 'custom_app_bar.dart';

Scaffold placeView(BuildContext context, String titleName, List<Place> list) {
  SettingsProvider settings = Provider.of<SettingsProvider>(context);

  return Scaffold(
    backgroundColor: settings.themeColor,
    appBar: custom_app_bar(context, titleName, settings),
    body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, _) => (cafesOrRestaurants(context, list[_]))),
  );
}
