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
import 'package:recipes/model/recipes_model.dart';
import 'package:recipes/page/details_page.dart';
import 'package:recipes/repo/recipes_repo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List<RecipesModel> filteredRecipes = [];

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
                                        "${product.calories} ccal",
                                        maxLines: 1,
                                        overflow: TextOverflow.clip,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ],
                                  ),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
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
