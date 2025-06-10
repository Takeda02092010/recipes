import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:recipes/model/recipes_model.dart';

void showAddRecipeDialog(BuildContext context) {
  final fieldLabels = [
    'ID',
    'Title',
    'Course',
    'Cuisine',
    'Main Ingredient',
    'Description',
    'Source',
    'URL',
    'URL Host',
    'Prep Time',
    'Cook Time',
    'Total Time',
    'Servings',
    'Yield',
    'Ingredients',
    'Directions',
    'Tags',
    'Rating',
    'Public URL',
    'Photo URL',
    'Private (yes/no)',
    'Nutritional Score',
    'Calories',
    'Fat',
    'Cholesterol',
    'Sodium',
    'Sugar',
    'Carbohydrate',
    'Fiber',
    'Protein',
    'Cost'
  ];

  final controllers =
      List.generate(fieldLabels.length, (_) => TextEditingController());

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add New Recipe'),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(fieldLabels.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextField(
                    controller: controllers[index],
                    decoration: InputDecoration(
                      labelText: fieldLabels[index],
                      border: const OutlineInputBorder(),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              final model = RecipesModel(
                id: int.parse(controllers[0].text),
                title: controllers[1].text,
                course: controllers[2].text,
                cuisine: controllers[3].text,
                mainIngredient: controllers[4].text,
                description: controllers[5].text,
                source: controllers[6].text,
                url: controllers[7].text,
                urlHost: controllers[8].text,
                prepTime: int.parse(controllers[9].text),
                cookTime: int.parse(controllers[10].text),
                totalTime: int.parse(controllers[11].text),
                servings: int.parse(controllers[12].text),
                yieldi: controllers[13].text,
                ingredients: controllers[14].text,
                directions: controllers[15].text,
                tags: controllers[16].text,
                rating: controllers[17].text,
                publicUrl: controllers[18].text,
                photoUrl: controllers[19].text,
                private: controllers[20].text.trim().toLowerCase() == 'yes',
                nutritionalScoreGeneric: controllers[21].text,
                calories: controllers[22].text,
                fat: controllers[23].text,
                cholesterol: controllers[24].text,
                sodium: controllers[25].text,
                sugar: controllers[26].text,
                carbohydrate: controllers[27].text,
                fiber: controllers[28].text,
                protein: controllers[29].text,
                cost: controllers[30].text,
              );

              Hive.box('postBox').add(model);
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
        ],
      );
    },
  );
}
