import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<String> _favoriteRestaurants = [];

  List<String> get favoriteRestaurants => _favoriteRestaurants;

  void toggleFavorite(String restaurantName, String time) {
    if (_favoriteRestaurants.contains(restaurantName)) {
      _favoriteRestaurants.remove(restaurantName);
    } else {
      _favoriteRestaurants.add(restaurantName);
    }
    notifyListeners();
  }
}
