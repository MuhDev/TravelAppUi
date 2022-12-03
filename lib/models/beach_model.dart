class BeachModel {
  final String image;

  BeachModel(this.image);
}

List<BeachModel> beaches =
    beachesData.map((item) => BeachModel(item['image']!)).toList();

var beachesData = [
  {
    "image":
        "assets/images/beach1.png"
  },
  {
    "image":
        "assets/images/beach2.png"
  },
  {
    "image":
        "assets/images/beach3.png"
  },
  {
    "image":
        "assets/images/beach4.png"
  },
  {
    "image":
        "assets/images/beach5.png"
  },
 
];
