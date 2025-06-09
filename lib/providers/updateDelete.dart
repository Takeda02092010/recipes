
import 'package:flutter/material.dart';
import 'package:recipes/repo/recipes_repo.dart';

class Updatedelete extends ChangeNotifier {
  final dynamic product;
  final RecipesRepo recipesRepo;

  Updatedelete({
    required this.product,
    required this.recipesRepo,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            recipesRepo.updateRecipe(product);
            notifyListeners();
          },
          icon: Icon(
            Icons.edit,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {
            recipesRepo.deleteRecipe(product.id);
            notifyListeners();
          },
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
