import 'package:flutter/material.dart';
import 'package:recipe_book_app/favorites_screen.dart';
import 'details_screen.dart';
import 'recipe.dart';

class HomeScreen extends StatelessWidget {
  final List<Recipe> recipes = [
    Recipe(
      name: "Spaghetti Carbonara",
      ingredients: ["Spaghetti", "Eggs", "Pancetta", "Parmesan", "Black Pepper"],
      instructions: "1. Boil spaghetti until al dente.\n"
                    "2. In a separate pan, cook pancetta until crispy.\n"
                    "3. In a bowl, whisk eggs and mix with cheese.\n"
                    "4. Drain pasta and combine with pancetta, then remove from heat.\n"
                    "5. Quickly mix in the egg mixture and serve with pepper.",
    ),
    Recipe(
      name: "Chicken Curry",
      ingredients: ["Chicken", "Curry Powder", "Coconut Milk", "Onions", "Garlic"],
      instructions: "1. Sauté onions and garlic in oil until fragrant.\n"
                    "2. Add chicken pieces and cook until browned.\n"
                    "3. Stir in curry powder and cook for a minute.\n"
                    "4. Add coconut milk and simmer until chicken is cooked through.\n"
                    "5. Serve with rice or bread.",
    ),
    Recipe(
      name: "Paneer Butter Masala",
      ingredients: ["Paneer", "Butter", "Tomatoes", "Cream", "Garam Masala", "Onions", "Garlic", "Ginger"],
      instructions: "1. Sauté chopped onions, garlic, and ginger in butter until golden.\n"
                    "2. Add pureed tomatoes and cook until oil separates.\n"
                    "3. Stir in garam masala and cream, cooking for a few minutes.\n"
                    "4. Add paneer cubes and simmer until heated through.\n"
                    "5. Serve with naan or rice.",
    ),
    Recipe(
      name: "Chana Masala",
      ingredients: ["Chickpeas", "Onions", "Tomatoes", "Ginger", "Garlic", "Cumin", "Coriander", "Garam Masala"],
      instructions: "1. Sauté chopped onions, garlic, and ginger until soft.\n"
                    "2. Add diced tomatoes and cook until mushy.\n"
                    "3. Stir in spices and chickpeas, adding water as needed.\n"
                    "4. Simmer for 15-20 minutes, adjusting seasoning.\n"
                    "5. Serve with rice or bhature.",
    ),
    Recipe(
      name: "Aloo Gobi",
      ingredients: ["Potatoes", "Cauliflower", "Turmeric", "Cumin", "Garam Masala", "Onions", "Green Chilies"],
      instructions: "1. Heat oil and sauté chopped onions and green chilies until golden.\n"
                    "2. Add turmeric and cumin, cooking for a minute.\n"
                    "3. Add cubed potatoes and cauliflower florets, mixing well.\n"
                    "4. Cover and cook until vegetables are tender, stirring occasionally.\n"
                    "5. Sprinkle garam masala and serve with roti or rice.",
    ),
    Recipe(
      name: "Dal Tadka",
      ingredients: ["Lentils", "Onions", "Tomatoes", "Garlic", "Ginger", "Cumin Seeds", "Cilantro"],
      instructions: "1. Boil lentils until soft and set aside.\n"
                    "2. In a pan, heat oil and sauté cumin seeds, followed by onions, garlic, and ginger.\n"
                    "3. Add chopped tomatoes and cook until soft.\n"
                    "4. Mix in cooked lentils and simmer for 10 minutes.\n"
                    "5. Garnish with cilantro and serve with rice or naan.",
    ),
    Recipe(
      name: "Butter Chicken",
      ingredients: ["Chicken", "Butter", "Tomatoes", "Cream", "Garam Masala", "Onions", "Garlic", "Ginger"],
      instructions: "1. Marinate chicken with spices and yogurt.\n"
                    "2. Cook marinated chicken in butter until browned.\n"
                    "3. Add pureed tomatoes, cream, and spices.\n"
                    "4. Simmer until chicken is cooked through.\n"
                    "5. Serve with naan or rice.",
    ),
    Recipe(
      name: "Vegetable Biryani",
      ingredients: ["Basmati Rice", "Mixed Vegetables", "Onions", "Garam Masala", "Bay Leaf", "Cilantro", "Mint"],
      instructions: "1. Sauté onions and spices in oil.\n"
                    "2. Add mixed vegetables and cook for a few minutes.\n"
                    "3. Stir in rinsed basmati rice and water, then simmer.\n"
                    "4. Once cooked, fluff with a fork and garnish with cilantro and mint.\n"
                    "5. Serve with raita.",
    ),
    Recipe(
      name: "Pav Bhaji",
      ingredients: ["Mixed Vegetables", "Onions", "Tomatoes", "Pav Bhaji Masala", "Butter", "Bread Rolls"],
      instructions: "1. Boil and mash the mixed vegetables.\n"
                    "2. Sauté onions and tomatoes in butter until soft.\n"
                    "3. Add pav bhaji masala and the mashed vegetables.\n"
                    "4. Cook for a few minutes, adjusting seasoning.\n"
                    "5. Serve hot with buttered bread rolls.",
    ),
    Recipe(
      name: "Tandoori Chicken",
      ingredients: ["Chicken", "Yogurt", "Tandoori Masala", "Lemon Juice", "Garlic", "Ginger"],
      instructions: "1. Marinate chicken with yogurt and spices overnight.\n"
                    "2. Preheat the grill or oven.\n"
                    "3. Grill the chicken until cooked through and charred.\n"
                    "4. Serve with mint chutney and lemon wedges.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recipe Book')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(
                  recipes[index].name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(recipe: recipes[index]),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FavoritesScreen()),
          );
        },
        child: Icon(Icons.favorite),
      ),
    );
  }
}
