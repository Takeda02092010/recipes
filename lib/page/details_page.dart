import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes/model/recipes_model.dart';
import 'package:recipes/classes/items.dart';

class DetailsPage extends StatelessWidget {
  final RecipesModel product;
  const DetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF18181B),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: CachedNetworkImage(
                imageUrl: product.photoUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 200,
                  color: Colors.grey[800],
                  child: Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Title & Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    product.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "₹ 80",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Text(
                    //   "₹${product.}",
                    //   style: const TextStyle(
                    //     color: Colors.white38,
                    //     fontSize: 16,
                    //     decoration: TextDecoration.lineThrough,
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Rating
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  product.rating,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Text(
                  "(300)",
                  style: TextStyle(color: Colors.white54),
                ),
                const SizedBox(width: 8),
                Icon(Icons.circle, color: Colors.green, size: 10),
              ],
            ),
            const SizedBox(height: 14),
            // Description
            Text(
              product.description,
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
            const SizedBox(height: 18),
            // Nutrition
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Items(label: "Cal.", value: product.calories),
                Items(label: "Carb.", value: product.carbohydrate),
                Items(label: "Fat", value: product.fat),
                Items(label: "Protein", value: product.protein),
              ],
            ),
            const SizedBox(height: 18),
            // Add to cart button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[900],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {},
                child: const Text(
                  "ADD TO CART",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 18),
            // Ingredients
            Text(
              "• ${product.ingredients}",
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 18),
            // Terms & Conditions
            Text(
              "Terms & Conditions of storage",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 6),
            Text(
              ' Enjoy it warm or store it in the refrigerator, Keep them wrapped up, let them cool fully, and then place them in an airtight container.',
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            const SizedBox(height: 18),
            // Reviews
            Text(
              "Reviews",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[700],
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                "Asif Muhammed",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doc biusmed tempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, color: Colors.amber, size: 16),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[700],
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                "Asif Muhammed",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do biusmed tempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, color: Colors.amber, size: 16),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[700],
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text(
                "Asif Muhammed",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do biusmed tempor incididunt ut labore et dolore magna aliqua.",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          Icon(Icons.star, color: Colors.amber, size: 16),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// class Items extends StatelessWidget {
//   final String label;
//   final String value;
//   const Items({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(value,
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 16)),
//         const SizedBox(height: 2),
//         Text(label, style: TextStyle(color: Colors.white54, fontSize: 13)),
//       ],
//     );
//   }
// }
