import 'package:hive/hive.dart';

//part 'recipes_model.g.dart';

@HiveType(typeId: 0)
class RecipesModel {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String course;
  @HiveField(3)
  final String cuisine;
  @HiveField(4)
  final String mainIngredient;
  @HiveField(5)
  final String description;
  @HiveField(6)
  final String source;
  @HiveField(7)
  final String url;
  @HiveField(8)
  final String urlHost;
  @HiveField(9)
  final int prepTime;
  @HiveField(10)
  final int cookTime;
  @HiveField(11)
  final int totalTime;
  @HiveField(12)
  final int servings;
  @HiveField(13)
  final String yieldi;
  @HiveField(14)
  final String ingredients;
  @HiveField(15)
  final String directions;
  @HiveField(16)
  final String tags;
  @HiveField(17)
  final String rating;
  @HiveField(18)
  final String publicUrl;
  @HiveField(19)
  final String photoUrl;
  @HiveField(20)
  final bool private;
  @HiveField(21)
  final String nutritionalScoreGeneric;
  @HiveField(22)
  final String calories;
  @HiveField(23)
  final String fat;
  @HiveField(24)
  final String cholesterol;
  @HiveField(25)
  final String sodium;
  @HiveField(26)
  final String sugar;
  @HiveField(27)
  final String carbohydrate;
  @HiveField(28)
  final String fiber;
  @HiveField(29)
  final String protein;
  @HiveField(30)
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
      yieldi: json['yield'] != null ? json['yield'].toString() : '',
      ingredients: json['ingredients'] ?? '',
      directions: json['directions'] ?? '',
      tags: json['tags'] ?? '',
      rating: json['rating'] ?? '',
      publicUrl: json['publicUrl'] ?? '',
      photoUrl: json['photoUrl'] ?? '',
      private: json['private'] == 'yes' ? true : false,
      nutritionalScoreGeneric: json['nutritionalScoreGeneric'] ?? '',
      calories: json['calories'] != null ? json['calories'].toString() : '',
      fat: json['fat'] ?? '',
      cholesterol: json['cholesterol'] ?? '',
      sodium: json['sodium'] != null ? json['sodium'].toString() : '',
      sugar: json['sugar'] ?? '',
      carbohydrate: json['carbohydrate'] ?? '',
      fiber: json['fiber'] ?? '',
      protein: json['protein'] ?? '',
      cost: json['cost'] ?? '',
    );
  }


  Map<String, dynamic> toJson() {
  return {
    'title': title,
    'course': course,
    'cuisine': cuisine,
    'mainIngredient': mainIngredient,
    'description': description,
    'source': source,
    'url': url,
    'urlHost': urlHost,
    'prepTime': prepTime,
    'cookTime': cookTime,
    'totalTime': totalTime,
    'servings': servings,
    'yield': yieldi,
    'ingredients': ingredients,
    'directions': directions,
    'tags': tags,
    'rating': rating,
    'publicUrl': publicUrl,
    'photoUrl': photoUrl,
    'private': private ? 'yes' : 'no',
    'nutritionalScoreGeneric': nutritionalScoreGeneric,
    'calories': calories,
    'fat': fat,
    'cholesterol': cholesterol,
    'sodium': sodium,
    'sugar': sugar,
    'carbohydrate': carbohydrate,
    'fiber': fiber,
    'protein': protein,
    'cost': cost,
  };
}

}
