class DestinationModel {

  final String name;
  final String location;
  final String price;
  final String image;
  final String category;

  DestinationModel({
    required this.name,
    required this.location,
    required this.price,
    required this.image,
    required this.category,
  });

  factory DestinationModel.fromJson(
      Map<String, dynamic> json) {

    return DestinationModel(

      name: json['name'] ?? '',

      location:
          json['location'] ?? '',

      price: json['price'] ?? '',

      image: json['image'] ?? '',

      category:
          json['category'] ?? '',
    );
  }
}