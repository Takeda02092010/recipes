import 'dart:convert';
import 'package:recipes/model/recipes_model.dart';
import 'package:http/http.dart' as http;

class RecipesRepo {
  Future<List<RecipesModel>> getrecipesModels() async {
    try {
      final incomingData = await http.get(
        Uri.parse("https://api.sampleapis.com/recipes/recipes"),
      );

      List data = jsonDecode(incomingData.body);
      final List<RecipesModel> recipesModels =
          data.map((e) => RecipesModel.fromJson(e)).toList();
      return recipesModels;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> createPost(RecipesModel recipesModel) async {
    try {
      final response = await http.post(
        Uri.parse("https://api.sampleapis.com/recipes/recipes"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "id": recipesModel.id,
          "title": recipesModel.title,
          "course": recipesModel.course,
          "cuisine": recipesModel.cuisine,
          "mainIngredient": recipesModel.mainIngredient,
          "description": recipesModel.description,
          "source": recipesModel.source,
          "url": recipesModel.url,
          "urlHost": recipesModel.urlHost,
          "prepTime": recipesModel.prepTime,
          "cookTime": recipesModel.cookTime,
          "totalTime": recipesModel.totalTime,
          "servings": recipesModel.servings,
          "yield": recipesModel.yieldi,
          "ingredients": recipesModel.ingredients,
          "directions": recipesModel.directions,
          "tags": recipesModel.tags,
          "rating": recipesModel.rating,
          "publicUrl": recipesModel.publicUrl,
          "photoUrl": recipesModel.photoUrl,
          "private": recipesModel.private ? "yes" : "no",
          "nutritionalScoreGeneric": recipesModel.nutritionalScoreGeneric,
          "calories": recipesModel.calories,
          "fat": recipesModel.fat,
          "cholesterol": recipesModel.cholesterol,
          "sodium": recipesModel.sodium,
          "sugar": recipesModel.sugar,
          "carbohydrate": recipesModel.carbohydrate,
          "fiber": recipesModel.fiber,
          "protein": recipesModel.protein,
          "cost": recipesModel.cost,
        }),
      );
      print(response.body);
    } catch (e, s) {
      print(s);
      throw Exception(e);
    }
  }

  Future<void> updateUser(RecipesModel recipesModel) async {
    try {
      await http.put(
          Uri.parse(
              'https://api.sampleapis.com/recipes/recipes/${recipesModel.id}'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "id": recipesModel.id,
            "title": recipesModel.title,
            "course": recipesModel.course,
            "cuisine": recipesModel.cuisine,
            "mainIngredient": recipesModel.mainIngredient,
            "description": recipesModel.description,
            "source": recipesModel.source,
            "url": recipesModel.url,
            "urlHost": recipesModel.urlHost,
            "prepTime": recipesModel.prepTime,
            "cookTime": recipesModel.cookTime,
            "totalTime": recipesModel.totalTime,
            "servings": recipesModel.servings,
            "yield": recipesModel.yieldi,
            "ingredients": recipesModel.ingredients,
            "directions": recipesModel.directions,
            "tags": recipesModel.tags,
            "rating": recipesModel.rating,
            "publicUrl": recipesModel.publicUrl,
            "photoUrl": recipesModel.photoUrl,
            "private": recipesModel.private ? "yes" : "no",
            "nutritionalScoreGeneric": recipesModel.nutritionalScoreGeneric,
            "calories": recipesModel.calories,
            "fat": recipesModel.fat,
            "cholesterol": recipesModel.cholesterol,
            "sodium": recipesModel.sodium,
            "sugar": recipesModel.sugar,
            "carbohydrate": recipesModel.carbohydrate,
            "fiber": recipesModel.fiber,
            "protein": recipesModel.protein,
            "cost": recipesModel.cost,
          }));
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteUser(String id) async {
    try {
      await http.delete(
        Uri.parse('https://api.sampleapis.com/recipes/recipes/$id'),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
