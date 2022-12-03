class RecommendedModel {
  String name;
  String image;
  List<String> images;
  String title;
  String description;
  int price;
  RecommendedModel(
    this.name,
    this.image,
    this.images,
    this.title,
    this.description,
    this.price,
  );
}

List<RecommendedModel> recommendations = recommendationsData
    .map((item) => RecommendedModel(
          item['name'] as String,
          item['image'] as String,
          item['images'] as List<String>,
          item['title'] as String,
          item['description'] as String,
          item['price'] as int,
        ))
    .toList();

var recommendationsData = [
  {
    "name": "Sana'a, Yemen",
    "image": "assets/images/sanaa.png",
    "description":
        "Sana'a, city, southwestern Yemen, situated in a mountain valley at an altitude of 2,200 m, Sana'a has been inhabited for more than 2,500 years. In the 7th and 8th centuries the city became a major centre for the propagation of Islam",
    "title": "Old Sana'a",
    "price": 120,
    "images": [
      "assets/images/sanaa.png",
      "assets/images/sanaa1.png",
      "assets/images/sanna2.png"
    ]
  },
  {
    "name": "Dhamar, Yemen",
    "image": "assets/images/Dhamar.png",
    "description":
        "Dhamar is the only town in the former North Yemen that is not surrounded by a wall or natural defensive formations; it is just a settlement on the plains. Centrally situated with connections to the nearby governorates, the town has prospered as a Wednesday market and meeting place for tribes living nearby",
    "title": "Dhamar The Hidden Place",
    "price": 200,
    "images": [
      "assets/images/Dhamar.png",
      "assets/images/dhamar1.png",
      "assets/images/dhamar2.png"
    ]
  },
  {
    "name": "Raja Ampt, Indonesia",
    "image": "assets/images/Indonesia.png",
    "description":
        "The Republic of Indonesia is located between the continents of Asia and Australia. It comprises 16,056 islands, with 34 provinces spreading over five main islands and four archipelagos. The five main islands include Sumatra, Java, Kalimantan, Sulawesi and Papua",
    "title": "Raja Ampt the Hidden Place",
    "price": 300,
    "images": [
      "assets/images/Indonesia.png",
      "assets/images/Indonesia1.png",
      "assets/images/Indonesia2.png"
    ]
  },
  {
    "name": "Ibb, Yemen",
    "image": "assets/images/ibb.png",
    "description":
        "Ibb, city, southwestern Yemen, lying in the Yemen Highlands on a spur of the rugged Mount Shamāḥī, at 6,725 feet (2,050 metres) above sea level. The city’s origins, according to Arab myth, date to biblical times. The area became important in the Middle Ages.",
    "title": "Ibb The Greenland",
    "price": 250,
    "images": [
      "assets/images/ibb.png",
      "assets/images/ibb1.png",
      "assets/images/ibb2.png"
    ]
  },
  {
    "name": "Garden The Bay, Singapore",
    "image": "assets/images/Singapora.png",
    "description":
        "Singapore is a sunny, tropical island in South-east Asia, off the southern tip of the Malay Peninsula. The city-state is 710 square kilometres and inhabited by five million people from four major communities; Chinese (majority), Malay, Indian and Eurasian",
    "title": "Garden The Bay The Awesome Place",
    "price": 500,
    "images": [
      "assets/images/Singapora.png",
      "assets/images/singapora1.png",
      "assets/images/singapora2.png"
    ]
  },
];
