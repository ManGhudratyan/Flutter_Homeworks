import 'package:flutter/material.dart';
import 'package:gyumri_guide/restaurants_component/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key, this.name, this.time});
  final String? name;
  final String? time;

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final favoriteRestaurants = favoriteProvider.favoriteRestaurants;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Page'),
      ),
      body: ListView.builder(
        itemCount: favoriteRestaurants.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteRestaurants[index]),
          );
        },
      ),
    );
  }
}
