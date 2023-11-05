class Food {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  Food(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});

  factory Food.fromJson(dynamic json) {
    return Food(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
    );
  }

  static List<Food> foodFromSnapShot(List snapshot) {
    return snapshot.map((data) {
      return Food.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime}';
  }
}
