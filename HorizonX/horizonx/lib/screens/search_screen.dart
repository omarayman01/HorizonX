import 'package:flutter/material.dart';
import 'package:horizonx/screens/City_view.dart';
import 'package:horizonx/screens/cities_view.dart';
import 'package:horizonx/settings_provider.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SearchByVoiceScreen extends StatefulWidget {
  const SearchByVoiceScreen({super.key});

  @override
  SearchByVoiceScreenState createState() => SearchByVoiceScreenState();
}

class SearchByVoiceScreenState extends State<SearchByVoiceScreen> {
  late stt.SpeechToText speech;
  bool isListening = false;
  String text = "Search";
  double confidence = 1.0;
  bool found = false;
  City? dataFound;
  TextEditingController controller = TextEditingController();
  final List<City> cities = [
    City("Cairo", "Salah Eldin Castle",
        "https://images.squarespace-cdn.com/content/v1/56c13cc00442627a08632989/1585432288121-15NNGMB5XEP5CJ1YSGL3/egyptianmuseum.jpg"),
    City("Giza", "Pyramids",
        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/7e/7d/2c/pyramids-of-giza.jpg?w=1200&h=-1&s=1"),
    City("Qalyubia", "Aqua park",
        "https://lh5.googleusercontent.com/p/AF1QipN3143f1ocfuvlquoWiZDvNAUYoxEo8MNn2HiTF"),
    City("Alexandria", "Qaitbay Castle",
        "https://www.egypttoursportal.com/images/2018/07/Qaitbay-Citadel-Egypt-Tours-Portal.jpg"),
    City("Beheira", "Monastery of Saint Bishoy",
        "https://media.istockphoto.com/id/621916480/photo/monastery-of-saint-bishoy.jpg?s=612x612&w=0&k=20&c=2eORcZuEhdqJb0LDEAFW7_gDoA7gO6BoTXdIZpuIZco="),
    City("Marsa Matrouh", "Marsa Matrouh beach",
        "https://ucarecdn.com/164c99f5-9994-438f-85ce-6c0699af2a77/-/crop/1000x525/0,87/-/resize/1200x630/-/resize/x400/"),
    City("Dakahliya", "The olympic village",
        "https://www.mans.edu.eg/images/speasyimagegallery/albums/3/images/20.jpg"),
    City("Kafr El-Sheikh", "Kafr El-Sheikh musuem",
        "https://egymonuments.gov.eg/media/6321/111.jpg?center=0.13157894736842105,0.46666666666666667&mode=crop&width=645&height=423&rnd=133566133030000000"),
    City("Gharbia", "Tanta musuem",
        "https://www.abou-alhool.com/ima/42403_4.jpg"),
    City("Menofia", "Menofia university",
        "https://media.licdn.com/dms/image/v2/C4E1BAQHx8WoW59lGIw/company-background_10000/company-background_10000/0/1623859664012/menofia_racing_team_cover?e=2147483647&v=beta&t=kecBSwoLXZf5kWDk_01fZ-ECQkHc9Eb3O8u1IfHfNaw"),
    City("Port Said", "Port Said military musuem",
        "https://www.mod.gov.eg/extras/photoMuseumPics/27/%D8%A7%D9%84%D8%AC%D9%86%D8%AF%D9%8A-%D8%A7%D9%84%D9%85%D8%B5%D8%B1%D9%8A.jpg"),
    City("Ismailia", "Ismailia Sports Staduim",
        "https://pbs.twimg.com/media/EUJbX1ZWAAIb4n7?format=jpg&name=large"),
    // Add more regions similarly
  ];

  @override
  void initState() {
    super.initState();
    speech = stt.SpeechToText();
  }

  void listen() async {
    if (!isListening) {
      bool available = await speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        print("IN BLOCK");

        setState(() => isListening = true);
        speech.listen(
          onResult: (val) => setState(() {
            text = val.recognizedWords;
            print("Recognized words: $text");
            if (val.hasConfidenceRating && val.confidence > 0) {
              confidence = val.confidence;
              print("Confidence: $confidence");
            }
          }),
        );
        print("Listening started");

        // print(text);
      }
    } else {
      setState(() => isListening = false);
      speech.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: found
                ? Center(
                    child: Column(
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 11),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.35,
                              child: TextField(
                                controller: controller,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color(0xff005A9E).withOpacity(0.15),
                                  hintText: text,
                                  prefixIcon: const Icon(Icons.search),
                                  suffixIcon: IconButton(
                                    icon: const Icon(
                                      Icons.search,
                                      color: Color(0xffFFA841),
                                    ),
                                    onPressed: () {
                                      if (text != "Search" ||
                                          controller.text.isNotEmpty) {
                                        setState(() {
                                          searchCity(controller.text);
                                          text = controller.text;
                                        });
                                      }
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.04),
                            GestureDetector(
                              onLongPress: listen,
                              onLongPressEnd: (details) {
                                setState(() {
                                  isListening = false;
                                });
                                speech.stop();
                                searchCity(text);
                              },
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.12,
                                decoration: BoxDecoration(
                                    color: const Color(0xff005A9E)
                                        .withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(
                                  Icons.mic,
                                  color: Color(0xffFFA841),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 6),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => city_view(
                                    cityName: dataFound!.name,
                                    cityLandmark: dataFound!.landmark,
                                    cityImagePath: dataFound!.imagePath,
                                  ),
                                ),
                              );
                            },
                            child: cityContainer(
                                dataFound!.name, dataFound!.imagePath)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height / 6),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 14,
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                found = false; // Go back to search view
                                text = "search";
                                controller.clear();
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFFA841),
                            ),
                            child: const Text(
                              "Search Again",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.height / 11),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.35,
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor:
                                    const Color(0xff005A9E).withOpacity(0.15),
                                hintText: text,
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: IconButton(
                                  icon: const Icon(
                                    Icons.search,
                                    color: Color(0xffFFA841),
                                  ),
                                  onPressed: () {
                                    if (text != "Search" ||
                                        controller.text.length > 2) {
                                      setState(() {
                                        searchCity(controller.text);
                                        text = controller.text;
                                      });
                                    }
                                  },
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04),
                          GestureDetector(
                            onLongPress: listen,
                            onLongPressEnd: (details) {
                              setState(() {
                                isListening = false;
                              });
                              speech.stop();
                              searchCity(text);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.12,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xff005A9E).withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Icon(
                                Icons.mic,
                                color: Color(0xffFFA841),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 6),
                      GestureDetector(
                        onLongPressEnd: (details) {
                          setState(() {
                            isListening = false;
                          });
                          speech.stop();
                          searchCity(text);
                        },
                        onLongPress: listen,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            Container(
                              width: 230,
                              height: 230,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.shade800,
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 150,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue.shade900,
                              ),
                              child: const Icon(
                                Icons.mic,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget cityContainer(String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 150,
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

  void searchCity(String cityName) {
    for (var city in cities) {
      if (city.name.toLowerCase().contains(cityName.toLowerCase())) {
        setState(() {
          dataFound = city;
          found = true;
        });
        return;
      }
    }
    setState(() {
      found = false;
    });
    print('City $cityName not found.');
  }
}
