import 'package:flutter/material.dart';
import 'package:horizonx/constants.dart';
import 'package:horizonx/settings_provider.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_app_bar.dart';
import 'City_view.dart';

void main() {
  runApp(const cities_view());
}

class cities_view extends StatelessWidget {
  const cities_view({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = Provider.of<SettingsProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: settings.themeColor,
        appBar: AppBar(
          backgroundColor: settings.themeColor,
          elevation: 0,
          title: const Text(
            "Cities",
            style: TextStyle(
                color: ConstColors.primaryBlueColor,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: CityList(),
      ),
    );
  }
}

class CityList extends StatelessWidget {
  final List<Region> regions = [
    Region("The great Cairo", [
      City("Cairo", "Salah Eldin Castle",
          "https://images.squarespace-cdn.com/content/v1/56c13cc00442627a08632989/1585432288121-15NNGMB5XEP5CJ1YSGL3/egyptianmuseum.jpg"),
      City("Giza", "Pyramids",
          "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/7e/7d/2c/pyramids-of-giza.jpg?w=1200&h=-1&s=1"),
      City("Qalyubia", "Aqua park",
          "https://lh5.googleusercontent.com/p/AF1QipN3143f1ocfuvlquoWiZDvNAUYoxEo8MNn2HiTF"),
    ]),
    Region("Alexandria", [
      City("Alexandria", "Qaitbay Castle",
          "https://www.egypttoursportal.com/images/2018/07/Qaitbay-Citadel-Egypt-Tours-Portal.jpg"),
      City("Beheira", "Monastery of Saint Bishoy",
          "https://media.istockphoto.com/id/621916480/photo/monastery-of-saint-bishoy.jpg?s=612x612&w=0&k=20&c=2eORcZuEhdqJb0LDEAFW7_gDoA7gO6BoTXdIZpuIZco="),
      City("Marsa Matrouh", "Marsa Matrouh beach",
          "https://ucarecdn.com/164c99f5-9994-438f-85ce-6c0699af2a77/-/crop/1000x525/0,87/-/resize/1200x630/-/resize/x400/"),
    ]),
    Region("Delta", [
      City("Dakahliya", "The olympic village",
          "https://www.mans.edu.eg/images/speasyimagegallery/albums/3/images/20.jpg"),
      City("Kafr El-Sheikh", "Kafr El-Sheikh musuem",
          "https://egymonuments.gov.eg/media/6321/111.jpg?center=0.13157894736842105,0.46666666666666667&mode=crop&width=645&height=423&rnd=133566133030000000"),
      City("Gharbia", "Tanta musuem",
          "https://www.abou-alhool.com/ima/42403_4.jpg"),
      City("Menofia", "Menofia university",
          "https://media.licdn.com/dms/image/v2/C4E1BAQHx8WoW59lGIw/company-background_10000/company-background_10000/0/1623859664012/menofia_racing_team_cover?e=2147483647&v=beta&t=kecBSwoLXZf5kWDk_01fZ-ECQkHc9Eb3O8u1IfHfNaw"),
    ]),

    Region("Suez Canal", [
      City("Port Said", "Port Said military musuem",
          "https://www.mod.gov.eg/extras/photoMuseumPics/27/%D8%A7%D9%84%D8%AC%D9%86%D8%AF%D9%8A-%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A.jpg"),
      City("Ismailia", "Ismailia Sports Staduim",
          "https://pbs.twimg.com/media/EUJbX1ZWAAIb4n7?format=jpg&name=large"),
    ]),
    // Add more regions similarly
  ];

  CityList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: regions.length,
      itemBuilder: (context, index) {
        return RegionCard(region: regions[index]);
      },
    );
  }
}

class Region {
  final String name;
  final List<City> cities;

  Region(this.name, this.cities);
}

class City {
  final String name;
  final String landmark;
  final String imagePath;

  City(this.name, this.landmark, this.imagePath);
}

class RegionCard extends StatelessWidget {
  final Region region;

  const RegionCard({super.key, required this.region});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            region.name,
            style: const TextStyle(
              color: ConstColors.primaryBlueColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          // Horizontal list for scrolling through cities
          SizedBox(
            height: 220, // Ensure a fixed height for the city cards to appear
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Scroll horizontally
              itemCount: region.cities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0), // Add some spacing between cards
                  child: SizedBox(
                    width: 160, // Fixed width for each CityCard
                    child: CityCard(city: region.cities[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
//
// class CityCard extends StatelessWidget {
//   final City city;
//
//   CityCard({required this.city});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       elevation: 5,
//       child: Stack(
//         children: [
//           // Background image covering the whole card
//           ClipRRect(
//             borderRadius: BorderRadius.circular(15),
//             child: Image.network(
//               city.imagePath,
//               fit: BoxFit.cover,
//               height: double.infinity,
//               width: double.infinity,
//             ),
//           ),
//           // Align the semi-transparent background to the bottom with full width
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: double.infinity, // Make it span the full width
//               padding: const EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.vertical(
//                   bottom: Radius.circular(15),
//                 ),
//                 color: Colors.black.withOpacity(0.5), // Bottom overlay background
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min, // Shrink to fit the content
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     city.name,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     city.landmark,
//                     style: TextStyle(color: Colors.white),
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CityCard extends StatelessWidget {
  final City city;

  const CityCard({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => city_view(
              cityName: city.name,
              cityLandmark: city.landmark,
              cityImagePath: city.imagePath,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        child: Stack(
          children: [
            // Background image covering the whole card
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                city.imagePath,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            // Align the semi-transparent background to the bottom with full width
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity, // Make it span the full width
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                  color: Colors.black
                      .withOpacity(0.5), // Bottom overlay background
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Shrink to fit the content
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      city.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      city.landmark,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
