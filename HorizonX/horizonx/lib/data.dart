import 'package:horizonx/models/restaurant.dart';

import 'models/cafe.dart';
import 'models/place.dart';

class Data{
  static List<Cafe> cafeList =  [
    Cafe(
        cityId: "Cairo",
        name: "Cafe Corniche",
        description: "Cafe",
        location: "https://maps.app.goo.gl/ERDFf8mbpULPQAqL7",
        address:
        "Corniche El Nil, Semiramis InterContinental Cairo Cairo القاهرة، 11511",
        longitude: "31.231813",
        latitude: "30.042687",
        picture:
        "https://lh5.googleusercontent.com/p/AF1QipMcvhNcuA7UGar4E-x_VI7HvH7e15nar9SgjQfQ",
        rate: 4.3,
        numberOfRatings: 264),
    Cafe(
        cityId: "Giza",
        name: "The Place",
        description: "Coffee shop",
        location: "https://maps.app.goo.gl/N8pWnTjajqLQYDRdA",
        address: "62 El-Hussein, Ad Doqi, Dokki, Giza Governorate 3751062",
        longitude: "31.199063",
        latitude: "30.043937",
        picture:
        "https://lh5.googleusercontent.com/p/AF1QipNAL81HWPOdDKwASvyt8WTrXMRd7KSXv1Qk_FHC",
        rate: 4.7,
        numberOfRatings: 43),
     Cafe(
        cityId: "Ismailia",
        name: "FRÍO Café",
        description: "Cafe",
        location: "https://maps.app.goo.gl/qBHV6HhVv1NG7UNa7",
        address: "Shbeen st El Sheikh Zayed Ismalia Third, 41511",
        longitude: "32.273812",
        latitude: "30.604687",
        picture:
        "https://lh5.googleusercontent.com/p/AF1QipPZe02KAWzzu4FeA_XdNKOYwzOLn_wt_D4mWZaE",
        rate: 4.4,
        numberOfRatings: 437),
     Cafe(
        cityId: "Alexandria",
        name: "Cafe de la Paix",
        description: "Coffee shop",
        location: "https://maps.app.goo.gl/sp2xSiNQfsttFwY77",
        address:
        "6W32+5VV, El-Gaish Rd, Al Mesallah Sharq, Al Attarin, Alexandria Governorate 5373002",
        longitude: "31.482563",
        latitude: "30.221187",
        picture:
        "https://lh5.googleusercontent.com/p/AF1QipMMakVYq0WiPAeP1u8RITTpT8BfBTG29wouDwF0",
        rate: 4.1,
        numberOfRatings: 1474)
  ];
  static List<Restaurant> restaurantList =  [
    Restaurant(
        cityId: "Alexandria",
        name: "Adrenaline Restaurant",
        description: "American restaurant",
        location: "https://maps.app.goo.gl/Uvgnr4Y6E8iBgx6F6",
        address:
        "Beside Olympic Club Gate and Hambaka cafe، 11 Ahmed Zewail Square, Bab Sharqi WA Wabour Al Meyah, Bab Sharqi, Alexandria Governorate 21500",
        longitude: "29.918188",
        latitude: "31.200063",
        picture:
        "https://lh5.googleusercontent.com/p/AF1QipOaJXKbd7IQ6uiC5VUQvf9PUHcm5V6_4o8sNjcq",
        rate: 5.0,
        numberOfRatings: 3),
    Restaurant(
        cityId: "Alexandria",
        name: "Ruby's cafe and Restaurant",
        description: "American restaurant",
        location: "https://maps.app.goo.gl/egZevZzbaoZZC7xL7",
        address:
        "3 Kafr Abdou, Abu an Nawatir, Sidi Gaber, Alexandria Governorate 21523",
        longitude: "29.957437",
        latitude: "31.223312",
        picture:
        "https://lh5.googleusercontent.com/p/AF1QipP0DmKWcu9iGZ40yiU7iTMePyI4N0gyBjz04s8h",
        rate: 4.6,
        numberOfRatings: 152),
    Restaurant(
        cityId: "Cairo",
        name: "Egyptian Nights",
        description: "Egyptian restaurant",
        location: "https://maps.app.goo.gl/vWmWAEMsL6w6Sg5Y8",
        address:
        "Cairo Marriott Hotel - 16 Saray El, Gezira St, Zamalek, Cairo Governorate 11211",
        longitude: "31.224312",
        latitude: "30.056812",
        picture:
        "https://lh5.googleusercontent.com/p/AF1QipNr-YuDf_RbXdpOtC1QkqpTu375PHtceX-82sGC",
        rate: 4.4,
        numberOfRatings: 322)
  ];
  static List<Place> beachesList = [
    Place(
        cityId: "Sharm El Sheikh",
        name: "Naama Bay",
        description: "Famous beach with crystal-clear waters and vibrant marine life.",
        location: "https://maps.google.com/?q=27.9147,34.3071",
        address: "Naama Bay, Sharm El Sheikh",
        longitude: "34.3071",
        latitude: "27.9147",
        picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQmRdyJc55vkPCidJ3nMk8gwgdJgbZxfxdNTw&s",
        rate: 4.7,
        numberOfRatings: 17000
    ),
    Place(
        cityId: "Hurghada",
        name: "Sahl Hasheesh Beach",
        description: "Exclusive beach area with beautiful white sand and blue waters.",
        location: "https://maps.google.com/?q=27.0531,33.8912",
        address: "Sahl Hasheesh, Hurghada",
        longitude: "33.8912",
        latitude: "27.0531",
        picture: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/3f/f9/a7/the-oberoi-sahl-hasheesh.jpg?w=600&h=400&s=1",
        rate: 4.8,
        numberOfRatings: 22000
    ),
    Place(
        cityId: "Alexandria",
        name: "Mamoura Beach",
        description: "A popular public beach in Alexandria.",
        location: "https://maps.google.com/?q=31.2743,29.8598",
        address: "Mamoura, Alexandria",
        longitude: "29.8598",
        latitude: "31.2743",
        picture: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/318984912.jpg?k=c551caec38958f0924088be42e167f84373957e8f249fb9da870356348e45552&o=&hp=1",
        rate: 4.5,
        numberOfRatings: 18000
    ),
  ];

  static List<Place> tourismList = [
    Place(
        cityId: "Cairo",
        name: "The Egyptian Museum",
        description: "Famous museum housing a vast collection of ancient Egyptian artifacts.",
        location: "https://maps.google.com/?q=30.0444,31.2357",
        address: "Tahrir Square, Cairo",
        longitude: "31.2357",
        latitude: "30.0444",
        picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKvQ2HxeYLgFsJ0v_T1JnV6N-qLGY23EjowA&s",
        rate: 4.6,
        numberOfRatings: 50000
    ),
    Place(
        cityId: "Alexandria",
        name: "Bibliotheca Alexandrina",
        description: "Modern library and cultural center.",
        location: "https://maps.google.com/?q=31.2156,29.9091",
        address: "El Shatby, Alexandria",
        longitude: "29.9091",
        latitude: "31.2156",
        picture: "https://www.arabcont.com/Images/ProjectImage/AlexLib02.jpg",
        rate: 4.7,
        numberOfRatings: 35000
    ),
    Place(
        cityId: "Luxor",
        name: "Valley of the Kings",
        description: "A series of tombs for the Pharaohs of ancient Egypt.",
        location: "https://maps.google.com/?q=25.7402,32.6044",
        address: "West Bank, Luxor",
        longitude: "32.6044",
        latitude: "25.7402",
        picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSZuWci5P6fO7s6j_uk4Jv7xmarkunE2CNN3w&s",
        rate: 4.8,
        numberOfRatings: 15000
    ),
    Place(
        cityId: "Aswan",
        name: "Philae Temple",
        description: "Ancient temple complex dedicated to the goddess Isis.",
        location: "https://maps.google.com/?q=24.0223,32.8998",
        address: "Philae Island, Aswan",
        longitude: "32.8998",
        latitude: "24.0223",
        picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_m2_T3zZzBUkbVddmGxSA8HXxbZpjhnEyIg&s",
        rate: 4.7,
        numberOfRatings: 25000
    ),
    Place(
        cityId: "Giza",
        name: "Giza Pyramids",
        description: "Iconic ancient pyramids and the Sphinx.",
        location: "https://maps.google.com/?q=29.9765,31.1342",
        address: "Al Haram, Giza",
        longitude: "31.1342",
        latitude: "29.9765",
        picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQT996ZwTDIgvcs4Nq2TskHotABIwIkcjq-9Q&s",
        rate: 4.9,
        numberOfRatings: 100000
    ),
  ];

  static List<Place> shoppingList = [
    Place(
        cityId: "Cairo",
        name: "Mall of Egypt",
        description: "A massive shopping mall with international brands and entertainment options.",
        location: "https://maps.google.com/?q=29.9647,31.0184",
        address: "Al Wahat Road, 6th of October, Giza",
        longitude: "31.0184",
        latitude: "29.9647",
        picture: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/6b/8e/fa/caption.jpg?w=1200&h=-1&s=1",
        rate: 4.5,
        numberOfRatings: 42000
    ),
    Place(
        cityId: "Alexandria",
        name: "City Centre Alexandria",
        description: "Large shopping mall with a variety of international and local brands.",
        location: "https://maps.google.com/?q=31.2076,29.9466",
        address: "Alex Desert Rd, Alexandria",
        longitude: "29.9466",
        latitude: "31.2076",
        picture: "https://cosmos-eng.com/wp-content/uploads/2018/11/IMG_0976-1.jpg",
        rate: 4.4,
        numberOfRatings: 30000
    ),
    Place(
        cityId: "Hurghada",
        name: "Senzo Mall",
        description: "Popular shopping mall in Hurghada.",
        location: "https://maps.google.com/?q=27.1444,33.8117",
        address: "Village Road, Hurghada",
        longitude: "33.8117",
        latitude: "27.1444",
        picture: "https://c8.alamy.com/comp/E526YK/senzo-mall-is-a-huge-new-shopping-center-this-shopping-center-was-E526YK.jpg",
        rate: 4.3,
        numberOfRatings: 15000
    ),
    Place(
        cityId: "Sharm El Sheikh",
        name: "Soho Square",
        description: "Vibrant shopping and entertainment complex.",
        location: "https://maps.google.com/?q=27.9621,34.3838",
        address: "White Knight Beach, Sharm El Sheikh",
        longitude: "34.3838",
        latitude: "27.9621",
        picture: "https://sharmzone.com/uploads/images/2022/03/image_750x_621e6ce6e158d.jpg",
        rate: 4.6,
        numberOfRatings: 12000
    ),
    Place(
        cityId: "Cairo",
        name: "Cairo Festival City Mall",
        description: "Huge shopping complex with a variety of dining, shopping, and entertainment options.",
        location: "https://maps.google.com/?q=30.0154,31.4341",
        address: "New Cairo, Cairo",
        longitude: "31.4341",
        latitude: "30.0154",
        picture: "https://constraderealestate.com/wp-content/uploads/2023/02/%D9%85%D9%88%D9%84-%D9%83%D8%A7%D9%8A%D8%B1%D9%88-%D9%81%D9%8A%D8%B3%D8%AA%D9%8A%D9%81%D8%A7%D9%84-compress.jpg",
        rate: 4.7,
        numberOfRatings: 50000
    ),
  ];

  static List<Place> parksList = [
    Place(
        cityId: "Cairo",
        name: "Al-Azhar Park",
        description: "A large public park offering stunning views of Cairo's skyline and Islamic architecture.",
        location: "https://goo.gl/maps/Nh48AYhXn7Y6tr9P6",
        address: "Salah Salem St, El-Darb El-Ahmar, Cairo",
        longitude: "31.2636",
        latitude: "30.0385",
        picture: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Al_Azhar_Park_3.jpg/640px-Al_Azhar_Park_3.jpg",
        rate: 4.7,
        numberOfRatings: 41000
    ),
    Place(
        cityId: "Alexandria",
        name: "Montaza Palace Gardens",
        description: "Beautiful gardens surrounding the historic Montaza Palace, overlooking the Mediterranean Sea.",
        location: "https://goo.gl/maps/7B19hzH5QWSWJTyN9",
        address: "El-Montaza, Alexandria",
        longitude: "29.9532",
        latitude: "31.2775",
        picture: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFTO2Vv4RwflIhwkOsL4kRIIPjv-ywfnkbUQ&s",
        rate: 4.6,
        numberOfRatings: 37000
    ),
    Place(
        cityId: "Giza",
        name: "Orman Garden",
        description: "A botanical garden offering a peaceful escape with a variety of plant species.",
        location: "https://goo.gl/maps/8fN6sS4QhF6vU4sHA",
        address: "University St, Giza",
        longitude: "31.2154",
        latitude: "30.0289",
        picture: "https://scenenow.com/Content/Admin/Uploads/Articles/ArticlesMainPhoto/44166/f5241f6d-bd92-4d09-8810-fbd995dc08bc.jpg",
        rate: 4.3,
        numberOfRatings: 12000
    ),
    Place(
        cityId: "Aswan",
        name: "Feryal Garden",
        description: "A tranquil garden located by the Nile River with picturesque views.",
        location: "https://goo.gl/maps/cF5zSZZ7kXTUXyD67",
        address: "Corniche El Nile, Aswan",
        longitude: "32.8984",
        latitude: "24.0864",
        picture: "https://scenenow.com/Content/editor_api/images/PortSaidFeryalGarden_Website03-8d0a7523-15d9-4db0-ae4d-662c48dc238d.jpg",
        rate: 4.5,
        numberOfRatings: 7000
    ),
    Place(
        cityId: "Hurghada",
        name: "Hurghada Botanical Garden",
        description: "A peaceful green space with a variety of native and exotic plants.",
        location: "https://goo.gl/maps/CYc5A9HSaUnN9Lnt7",
        address: "Hurghada Marina Blvd, Hurghada",
        longitude: "33.8372",
        latitude: "27.1922",
        picture: "https://www.cairotoptours.com/storage/1770/conversions/Aswan%20Botanical%20Gardens-webp.webp",
        rate: 4.4,
        numberOfRatings: 5000
    ),
  ];

}