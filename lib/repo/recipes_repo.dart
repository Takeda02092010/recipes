import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:recipes/model/recipes_model.dart';
import 'package:http/http.dart' as http;

class RecipesRepo {
  Future<List<RecipesModel>> getAllRecipes() async {
    final recipeBox = Hive.box('recipeBox');
    try {
      final incomingData = await http.get(
        Uri.parse("https://api.sampleapis.com/recipes/recipes"),
      );
      List data = jsonDecode(incomingData.body);
      final List<RecipesModel> recipes =
          data.map((e) => RecipesModel.fromJson(e)).toList();
      await recipeBox.put('recipes', recipes);
      return recipes;
    } catch (e) {
      if (recipeBox.containsKey('recipes')) {
        try {
          return recipeBox.get('recipes')!.cast<RecipesModel>();
        } catch (e) {
          throw Exception("Xato");
        }
      }
      throw Exception(e);
    }
  }

  Future<void> createRecipe(RecipesModel recipesModel) async {
    try {
      final response = await http.post(
        Uri.parse("https://api.sampleapis.com/recipes/recipes"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(recipesModel.toJson()),
      );
      print(response.body);
    } catch (e, s) {
      print(s);
      throw Exception(e);
    }
  }

  Future<void> updateRecipe(RecipesModel recipesModel) async {
    try {
      await http.put(
        Uri.parse(
            'https://api.sampleapis.com/recipes/recipes/${recipesModel.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(recipesModel.toJson()),
      );
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> deleteRecipe(int id) async {
    try {
      final response = await http.delete(
        Uri.parse('https://api.sampleapis.com/recipes/recipes/$id'),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.statusCode);
    } catch (e) {
      throw Exception(e);
    }
  }
}
