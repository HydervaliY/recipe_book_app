import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'recipe.dart';

class DetailsScreen extends StatefulWidget {
  final Recipe recipe;

  DetailsScreen({required this.recipe});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = (prefs.getStringList('favorites') ?? []).contains(widget.recipe.name);
    });
  }

  Future<void> _toggleFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = prefs.getStringList('favorites') ?? [];

    if (isFavorite) {
      favorites.remove(widget.recipe.name);
    } else {
      favorites.add(widget.recipe.name);
    }

    await prefs.setStringList('favorites', favorites);
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe.name)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Ingredients:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 8),
                ...widget.recipe.ingredients.map((ingredient) => Text("• $ingredient", style: TextStyle(fontSize: 16))).toList(),
                SizedBox(height: 20),
                Text("Instructions:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                SizedBox(height: 8),
                Text(widget.recipe.instructions, style: TextStyle(fontSize: 16)),
                Spacer(),
                ElevatedButton(
                  onPressed: _toggleFavorite,
                  child: Text(isFavorite ? 'Remove from Favorites' : 'Add to Favorites'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
