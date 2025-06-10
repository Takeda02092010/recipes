import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recipes/model/recipes_model.dart';
import 'package:recipes/page/home_page.dart';
import 'package:recipes/providers/recipes_provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RecipesModelAdapter());

  await Hive.openBox('recipesBox');
  await Hive.openBox('recipeBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecipesProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
