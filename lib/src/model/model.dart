class RecipeModel {
  final String name;
  final String images;
  final double rating;
  final String totalTime;

  RecipeModel({
    required this.images,
    required this.name,
    required this.rating,
    required this.totalTime,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
        name: json["name"],
        images: json["images"][0]["hostedLargeUrl"],
        rating: json["rating"],
        totalTime: json["totalTime"]);
  }

  static List<RecipeModel> recipeFromSnap(List snapshot) {
    return snapshot.map((data) {
      return RecipeModel.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return "Recipe {name: $name, images: $images, rating: $rating, totalTime: $totalTime}";
  }
}
