// import 'package:flutter/material.dart';
// import 'package:recipes/model/recipes_model.dart';
// import 'package:recipes/repo/recipes_repo.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final recipe = RecipesModel(
//             id: 60,
//             title: 'Spaghetti Bolognese',
//             course: 'Main Course',
//             cuisine: 'Italian',
//             mainIngredient: 'Beef',
//             description:
//                 'A classic Italian pasta dish with a rich, meaty sauce.',
//             source: 'Grandma’s Cookbook',
//             url: 'https://example.com/spaghetti-bolognese',
//             urlHost: 'example.com',
//             prepTime: 15,
//             cookTime: 60,
//             totalTime: 75,
//             servings: 4,
//             yieldi: '4 servings',
//             ingredients: '''
// - 400g spaghetti
// - 2 tbsp olive oil
// - 1 onion, chopped
// - 2 garlic cloves, minced
// - 500g ground beef
// - 400g canned tomatoes
// - 2 tbsp tomato paste
// - 1 tsp dried oregano
// - Salt and pepper to taste
// - Fresh basil (optional)
// ''',
//             directions: '''
// 1. Cook spaghetti according to package instructions. Drain and set aside.
// 2. Heat olive oil in a large pan over medium heat. Add chopped onions and cook until translucent.
// 3. Add garlic and cook for another minute.
// 4. Add ground beef and cook until browned.
// 5. Stir in canned tomatoes, tomato paste, oregano, salt, and pepper.
// 6. Simmer for 30–40 minutes, stirring occasionally.
// 7. Serve sauce over spaghetti. Garnish with fresh basil if desired.
// ''',
//             tags: 'pasta, beef, Italian, comfort food',
//             rating: '4.8',
//             publicUrl: 'https://example.com/spaghetti-bolognese',
//             photoUrl: 'https://example.com/images/spaghetti.jpg',
//             private: false,
//             nutritionalScoreGeneric: 'B',
//             calories: '650',
//             fat: '20g',
//             cholesterol: '60mg',
//             sodium: '480mg',
//             sugar: '8g',
//             carbohydrate: '75g',
//             fiber: '5g',
//             protein: '35g',
//             cost: '\$10.00',
//           );

//           // await RecipesRepo().createRecipe(recipe);
//           // await RecipesRepo().updateRecipe(recipe);
//           // await RecipesRepo().deleteRecipe(recipe.id);
//           // Image network errorBuilder
//         },
//       ),
//     );
// }

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:recipes/providers/updateDelete.dart';
import 'package:recipes/model/recipes_model.dart';
import 'package:recipes/page/details_page.dart';
import 'package:recipes/repo/recipes_repo.dart';
import 'package:recipes/showAddRecipeDialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<RecipesModel> filteredRecipes = [];

  // Add this: List of controllers for editing recipe fields
  final List<TextEditingController> controllers =
      List.generate(29, (index) => TextEditingController());

  // Add this: variable for private field
  bool privateValue = false;

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  void _filterProducts(String query) {
    filteredRecipes = filteredRecipes.where((element) {
      bool contains = element.title.toLowerCase().contains(query);

      if (contains) {
        print(element.title);
        print(query);
      }
      return contains;
    }).toList();
    setState(() {});
  }

  //   List<RecipesModel> recipe = [];
  bool isPressed = false;

  // final titleController = TextEditingController();
  // final bodyController = TextEditingController();

  // void _editUserDialog(RecipesModel PostJSon) {
  //   titleController.text = PostJSon.title;
  //   bodyController.text = PostJSon.body;

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: const Text("Edit reicpe"),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             TextField(
  //               controller: titleController,
  //               decoration: const InputDecoration(labelText: "title"),
  //             ),
  //             TextField(
  //               controller: bodyController,
  //               decoration: const InputDecoration(labelText: "body "),
  //             ),
  //           ],
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () async {
  //               final updatedJsonPost = PostJson(
  //                 id: PostJSon.id,
  //                 title: titleController.text,
  //                 body: bodyController.text,
  //                 userId: PostJSon.userId,
  //               );
  //               await repo.updateJsonPost(updatedJsonPost);
  //               Navigator.of(context).pop();
  //               setState(() {});
  //             },
  //             child: const Text("Save"),
  //           ),
  //           TextButton(
  //             onPressed: () => Navigator.of(context).pop(),
  //             child: const Text("Cancel"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  void editFullRecipeDialog(RecipesModel recipe) {
    controllers[0].text = recipe.title;
    controllers[1].text = recipe.course;
    controllers[2].text = recipe.cuisine;
    controllers[3].text = recipe.mainIngredient;
    controllers[4].text = recipe.description;
    controllers[5].text = recipe.source;
    controllers[6].text = recipe.url;
    controllers[7].text = recipe.urlHost;
    controllers[8].text = recipe.prepTime.toString();
    controllers[9].text = recipe.cookTime.toString();
    controllers[10].text = recipe.totalTime.toString();
    controllers[11].text = recipe.servings.toString();
    controllers[12].text = recipe.yieldi;
    controllers[13].text = recipe.ingredients;
    controllers[14].text = recipe.directions;
    controllers[15].text = recipe.tags;
    controllers[16].text = recipe.rating;
    controllers[17].text = recipe.publicUrl;
    controllers[18].text = recipe.photoUrl;
    privateValue = recipe.private;
    controllers[19].text = recipe.nutritionalScoreGeneric;
    controllers[20].text = recipe.calories;
    controllers[21].text = recipe.fat;
    controllers[22].text = recipe.cholesterol;
    controllers[23].text = recipe.sodium;
    controllers[24].text = recipe.sugar;
    controllers[25].text = recipe.carbohydrate;
    controllers[26].text = recipe.fiber;
    controllers[27].text = recipe.protein;
    controllers[28].text = recipe.cost;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          scrollable: true,
          title: const Text("Edit Recipe"),
          content: Column(
            children: [
              for (int i = 0; i < controllers.length; i++)
                TextField(
                  controller: controllers[i],
                  decoration: InputDecoration(labelText: "Field $i"),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                final updatedRecipe = RecipesModel(
                  id: recipe.id,
                  title: controllers[0].text,
                  course: controllers[1].text,
                  cuisine: controllers[2].text,
                  mainIngredient: controllers[3].text,
                  description: controllers[4].text,
                  source: controllers[5].text,
                  url: controllers[6].text,
                  urlHost: controllers[7].text,
                  prepTime: int.parse(controllers[8].text),
                  cookTime: int.parse(controllers[9].text),
                  totalTime: int.parse(controllers[10].text),
                  servings: int.parse(controllers[11].text),
                  yieldi: controllers[12].text,
                  ingredients: controllers[13].text,
                  directions: controllers[14].text,
                  tags: controllers[15].text,
                  rating: controllers[16].text,
                  publicUrl: controllers[17].text,
                  photoUrl: controllers[18].text,
                  private: privateValue,
                  nutritionalScoreGeneric: controllers[19].text,
                  calories: controllers[20].text,
                  fat: controllers[21].text,
                  cholesterol: controllers[22].text,
                  sodium: controllers[23].text,
                  sugar: controllers[24].text,
                  carbohydrate: controllers[25].text,
                  fiber: controllers[26].text,
                  protein: controllers[27].text,
                  cost: controllers[28].text,
                );

                final box = Hive.box<RecipesModel>('recipesBox');
                box.put(recipe.id, updatedRecipe);
                Navigator.of(context).pop();
                setState(() {});
              },
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Save"),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

  void _deleteUser(int id) async {
    setState(() {
      isPressed = true;
    });
    try {
      await RecipesRepo().deleteRecipe(id);
      setState(() {
        filteredRecipes.removeWhere((w) => w.id == id);
      });
    } catch (e) {
      throw Exception(e);
    } finally {
      setState(() {
        isPressed = false;
      });
    }
  }

  List<String> categories = ['Frequent order', 'Veg', 'Fish', 'Egg', 'Chicken'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 4, 93, 7),
                        ),
                        Column(
                          children: [
                            Text(
                              "Deliver to",
                              style: TextStyle(
                                color: Colors.grey,
                                //fontSize: 20.0,
                              ),
                            ),
                            Text(
                              "Palazhi , Calicut",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.notifications)
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  controller: _searchController,
                  onChanged: (value) => _filterProducts(value),
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MENU",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "SORT BY",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.0,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 25.0);
                    },
                    itemBuilder: (context, index) {
                      return Text(
                        categories[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                        ),
                      );
                    },
                  ),
                ),
                FutureBuilder(
                  future: RecipesRepo().getAllRecipes(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: \\${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No recipes found'));
                    }
                    final recipes = snapshot.data!;
                    filteredRecipes.addAll(recipes);
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filteredRecipes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 300,
                      ),
                      itemBuilder: (context, index) {
                        final product = filteredRecipes[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => DetailsPage(product: product),
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.all(12),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12.0),
                                  ),
                                  child: Image.network(
                                    product.photoUrl,
                                    fit: BoxFit.cover,
                                    height: 200,
                                    width: double.infinity,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            const Icon(Icons.broken_image),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        product.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${product.cost} ",
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                // Updatedelete(product: product, recipesRepo: RecipesRepo()),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        editFullRecipeDialog(product);
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        _deleteUser(product.id);
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showAddRecipeDialog(context),
        icon: const Icon(Icons.add),
        label: const Text("Add Recipe"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shoppping',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}
