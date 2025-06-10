import 'package:flutter/material.dart';
import 'package:recipes/model/recipes_model.dart';
import 'package:recipes/repo/recipes_repo.dart';

class RecipesProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isDeleting = false;
  String? error;
  String? deleteError;
  List<RecipesModel> recipes = [];

  Future<void> getRecipes() async {
    isLoading = true;
    recipes.clear();
    notifyListeners();
    try {
      final result = await RecipesRepo().getAllRecipes();
      recipes.addAll(result);
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteRecipe(int id) async {
    isDeleting = true;
    notifyListeners();
    try {
      await RecipesRepo().deleteRecipe(id);
      // setState(() {
      //   filteredRecipes.removeWhere((w) => w.id == id);
      // });
    } catch (e) {
      deleteError = e.toString();
    } finally {
      isDeleting = false;
      notifyListeners();
    }
  }
}
