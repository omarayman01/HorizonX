//
// import 'package:flutter/material.dart';
// import 'cities_view.dart';
//
// void main() {
//   runApp(city_view());
// }
//
// class city_view extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: CairoTourScreen(),
//     );
//   }
// }
//
// class CairoTourScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.orange),
//           onPressed: () {runApp(cities_view());},
//         ),
//         title: Text(
//           "Cairo",
//           style: TextStyle(color: Colors.blue, fontSize: 22, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           // Top Image with Title and Temperature
//           Container(
//             height: 200,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage('https://images.squarespace-cdn.com/content/v1/56c13cc00442627a08632989/1585432288121-15NNGMB5XEP5CJ1YSGL3/egyptianmuseum.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Stack(
//               children: [
//                 Positioned(
//                   left: 16,
//                   bottom: 16,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Cairo',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Text(
//                         "Salah al-Din's castle",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                   right: 16,
//                   bottom: 16,
//                   child: Text(
//                     '30°C',
//                     style: TextStyle(
//                       color: Colors.orange,
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Discover Cairo Section
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Discover Cairo',
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//
//           // ListView for Categories (Each in a row)
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               children: [
//                 _buildCategoryRow('Restaurants', 'https://6amcity.brightspotcdn.com/dims4/default/26f5f53/2147483647/strip/true/crop/1332x750+0+69/resize/1000x563!/quality/90/?url=https%3A%2F%2Fk1-prod-sixam-city.s3.us-east-2.amazonaws.com%2Fbrightspot%2F0d%2F84%2F7c175b5e443092d969b6c19af3f5%2F393170483-18307701454185066-3288527068679201488-n.jpg'),
//                 _buildCategoryRow('Cafes', 'https://assets.cairo360.com/app/uploads/2023/12/03/252054117_864639724197215_3585822908968159397_n-1024x497.jpeg'),
//                 _buildCategoryRow('Tourism', 'https://miro.medium.com/v2/resize:fit:1400/0*HTIjmy_g7zt6I3bD'),
//                 _buildCategoryRow('Beaches', 'https://www.gohawaii.com/sites/default/files/hero-unit-images/11500_mauibeaches.jpg'),
//                 _buildCategoryRow('Shopping', 'https://cmmodels.com/wp-content/uploads/2021/01/new-york-shopping-mall-strassen-luxus-designer-laden.jpg'),
//                 _buildCategoryRow('Parks', 'https://www.taber.ca/home/showpublishedimage/3263/637067364321670000'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCategoryRow(String title, String imageUrl) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               height: 100,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 image: DecorationImage(
//                   image: NetworkImage(imageUrl),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(12),
//                       gradient: LinearGradient(
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                         colors: [Colors.black.withOpacity(0.6), Colors.transparent],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     left: 10,
//                     child: Text(
//                       title,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:horizonx/screens/beaches.dart';
import 'package:horizonx/screens/parks.dart';
import 'package:horizonx/screens/shopping.dart';
import 'package:horizonx/screens/tourism.dart';
import 'package:horizonx/settings_provider.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../widgets/custom_app_bar.dart';
import 'cafes.dart';
import 'cities_view.dart';
import 'restaurants.dart';

class city_view extends StatelessWidget {
  final String cityName;
  final String cityLandmark;
  final String cityImagePath;

  const city_view({
    super.key,
    required this.cityName,
    required this.cityLandmark,
    required this.cityImagePath,
  });

  @override
  Widget build(BuildContext context) {
    SettingsProvider settings = Provider.of<SettingsProvider>(context);

    return Scaffold(
      backgroundColor: settings.themeColor,
      appBar: custom_app_bar(context, cityName, settings),
      body: Column(
        children: [
          // Top Image with Title and Landmark
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(cityImagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 16,
                  bottom: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cityName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        cityLandmark,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Discover section (you can customize as needed)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Discover $cityName',
                style: const TextStyle(
                  color: ConstColors.primaryBlueColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // Content (additional info, images, etc.)
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                // Placeholder rows, replace with actual content
                GestureDetector(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Restaurants())),
                    child: _buildCategoryRow('Restaurants',
                        'https://6amcity.brightspotcdn.com/dims4/default/26f5f53/2147483647/strip/true/crop/1332x750+0+69/resize/1000x563!/quality/90/?url=https%3A%2F%2Fk1-prod-sixam-city.s3.us-east-2.amazonaws.com%2Fbrightspot%2F0d%2F84%2F7c175b5e443092d969b6c19af3f5%2F393170483-18307701454185066-3288527068679201488-n.jpg')),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Cafes())),
                  child: _buildCategoryRow('Cafes',
                      'https://assets.cairo360.com/app/uploads/2023/12/03/252054117_864639724197215_3585822908968159397_n-1024x497.jpeg'),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Tourism())),
                  child: _buildCategoryRow('Tourism',
                      'https://miro.medium.com/v2/resize:fit:1400/0*HTIjmy_g7zt6I3bD'),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Beaches())),
                  child: _buildCategoryRow('Beaches',
                      'https://www.gohawaii.com/sites/default/files/hero-unit-images/11500_mauibeaches.jpg'),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Shopping())),
                  child: _buildCategoryRow('Shopping',
                      'https://cmmodels.com/wp-content/uploads/2021/01/new-york-shopping-mall-strassen-luxus-designer-laden.jpg'),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Parks())),
                  child: _buildCategoryRow('Parks',
                      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/ab/b0/1c/caption.jpg?w=900&h=500&s=1'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryRow(String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
