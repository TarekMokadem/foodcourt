class PopularModel {

  final String title;
  final String image;
  final double deliveryTime;
  final double price;
  String desc;
  double rating; 

  PopularModel({
    required this.title,
    required this.deliveryTime,
    required this.price,
    required this.image,
    this.desc = "",
    this.rating = 0,
  });

  

}
