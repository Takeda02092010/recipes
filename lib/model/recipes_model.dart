class RecipesModel {
  final int id;
  final String title;
  final String course;
  final String cuisine;
  final String mainIngredient;
  final String description;
  final String source;
  final String url;
  final String urlHost;
  final int prepTime;
  final int cookTime;
  final int totalTime;
  final int servings;
  final int yieldi;
  final String ingredients;
  final String directions;
  final String tags;
  final String rating;
  final String publicUrl;
  final String photoUrl;
  final bool private;
  final String nutritionalScoreGeneric;
  final int calories;
  final String fat;
  final String cholesterol;
  final String sodium;
  final String sugar;
  final String carbohydrate;
  final String fiber;
  final String protein;
  final String cost;

  RecipesModel(
      {required this.id,
      required this.title,
      required this.course,
      required this.cuisine,
      required this.mainIngredient,
      required this.description,
      required this.source,
      required this.url,
      required this.urlHost,
      required this.prepTime,
      required this.cookTime,
      required this.totalTime,
      required this.servings,
      required this.yieldi,
      required this.ingredients,
      required this.directions,
      required this.tags,
      required this.rating,
      required this.publicUrl,
      required this.photoUrl,
      required this.private,
      required this.nutritionalScoreGeneric,
      required this.calories,
      required this.fat,
      required this.cholesterol,
      required this.sodium,
      required this.sugar,
      required this.carbohydrate,
      required this.fiber,
      required this.protein,
      required this.cost});

  factory RecipesModel.fromJson(Map<String, dynamic> json) {
    return RecipesModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      course: json['course'] ?? '',
      cuisine: json['cuisine'] ?? '',
      mainIngredient: json['mainIngredient'] ?? '',
      description: json['description'] ?? '',
      source: json['source'] ?? '',
      url: json['url'] ?? '',
      urlHost: json['urlHost'] ?? '',
      prepTime: json['prepTime'] ?? 0,
      cookTime: json['cookTime'] ?? 0,
      totalTime: json['totalTime'] ?? 0,
      servings: json['servings'] ?? 0,
      yieldi: json['yield'] ?? 0,
      ingredients: json['ingredients'] ?? '',
      directions: json['directions'] ?? '',
      tags: json['tags'] ?? '',
      rating: json['rating'] ?? '',
      publicUrl: json['publicUrl'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      private: json['private'] == 'yes' ? true : false,
      nutritionalScoreGeneric: json['nutritionalScoreGeneric'] ?? '',
      calories: json['calories'] ?? 0,
      fat: json['fat'] ?? '',
      cholesterol: json['cholesterol'] ?? '',
      sodium: json['sodium'] ?? '',
      sugar: json['sugar'] ?? '',
      carbohydrate: json['carbohydrate'] ?? '',
      fiber: json['fiber'] ?? '',
      protein: json['protein'] ?? '',
      cost: json['cost'] ?? '',
    );
  }
}
