import 'package:flutter/material.dart';
import 'package:horizonx/constants.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:horizonx/screens/cities_view.dart';
import 'package:horizonx/screens/search_screen.dart';
import 'package:horizonx/screens/settings_screen.dart';
import 'package:horizonx/settings_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;
  final _pages = [
    const cities_view(),
    const SearchByVoiceScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = Provider.of<SettingsProvider>(context);

    List<Widget> icons = [
      Icon(Icons.home_filled,
          size: 30,
          color:
              selectedPage == 0 ? ConstColors.primaryGoldColor : Colors.white),
      Icon(Icons.search,
          size: 30,
          color:
              selectedPage == 1 ? ConstColors.primaryGoldColor : Colors.white),
      Icon(Icons.person,
          size: 30,
          color:
              selectedPage == 2 ? ConstColors.primaryGoldColor : Colors.white),
    ];

    return Scaffold(
      body: _pages[selectedPage],
      bottomNavigationBar: CurvedNavigationBar(
          color: ConstColors.primaryBlueColor,
          backgroundColor: settings.themeColor,
          items: icons,
          onTap: updateSelectedPage),
    );
  }

  void updateSelectedPage(int index) {
    setState(() {
      selectedPage = index;
    });
  }
}
