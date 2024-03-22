import 'package:flutter/material.dart';
import 'container_restaurant.dart';
import 'restaurant_detail.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
        backgroundColor: const Color.fromARGB(255, 195, 220, 240),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Restaurants in Gyumri',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                _buildSection(
                  title: 'Local Eats',
                  restaurants: localEats,
                ),
                const SizedBox(height: 20),
                _buildSection(
                  title: 'Budget-friendly bites',
                  restaurants: budgetFriendly,
                ),
                const SizedBox(height: 20),
                _buildSection(
                  title: 'Cheap Eats',
                  restaurants: cheapEats,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
      {required String title,
      required List<Map<String, dynamic>> restaurants}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 171, 145, 145),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < restaurants.length; i++)
                _RestaurantContainer(
                  restaurant: restaurants[i],
                  index: i,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RestaurantContainer extends StatelessWidget {
  final Map<String, dynamic> restaurant;
  final int index;

  const _RestaurantContainer({
    required this.restaurant,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetail(
                index: index,
                hero: 'restaurant$index',
                restaurantName: restaurant['name'],
                time: restaurant['time'],
                image: restaurant['image'],
                menu: restaurant['menu']),
          ),
        );
      },
      child: ContainerRestaurant(
          restaurantName: restaurant["name"],
          time: restaurant["time"],
          index: index,
          image: restaurant['image'],
          menu: restaurant['menu']),
    );
  }
}

final List<Map<String, dynamic>> localEats = [
  {
    "name": "Kumkuma",
    "image": "images/restaurant3.jpeg",
    "time": "11:00 AM - 11:00 PM",
    "cuisines": ["Armenian", "Eastern European"],
    "meals": ["Breakfast", "Lunch", "Dinner", "Brunch", "Late Night", "Drinks"],
    "features": ["Reservations", "Seating", "Table Service"],
    "menu": "https://glovoapp.com/am/hy/gyumri/kuma-gym/"
  },
  {
    "name": "Florence Gyumri",
    "image": "images/restaurant4.jpg",
    "time": "10:30 AM - 11:45 PM",
    "cuisines": ["Italian, Cafe, Barbecue, Grill, Georgian, European"],
    "meals": ["Dinner, Breakfast, Lunch, Late Night, Drinks"],
    "special": ["Vegetarian Friendly, Vegan Options"],
    "menu": "https://www.facebook.com/GyumriFlorence/menu"
  },
  {
    "name": "Hacatun",
    "image": "images/hacatun.jpg",
    "time": "08:30 AM - 12:45 PM",
    "cuisines": ["Barbecue, Healthy, Soups, Eastern European, Armenian"],
    "meals": ["Breakfast, Lunch, Dinner, Brunch"],
    "special": ["Vegetarian Friendly, Vegan Options, Gluten Free Options"],
    "menu": "https://www.gyumrihatsatun.am/menu"
  },
  {
    "name": "Cherkezi Dzor",
    "image": "images/cherkez.jpg",
    "time": "09:00 AM-11:00 PM",
    "cuisines": ["Seafood, Barbecue, Armenian"],
    "meals": ["Lunch, Dinner, Brunch"],
    "special": ["Vegetarian Friendly"],
    "menu": "https://www.facebook.com/FishFarm.Restaurante/"
  },
  {
    "name": "Herbs & Honey",
    "image": "images/herbs.jpg",
    "time": "09:00 AM-11:00 PM",
    "cuisines": ["Seafood, Barbecue, Armenian"],
    "meals": ["Lunch, Dinner, Brunch"],
    "special": ["Vegetarian Friendly"],
    "menu": "https://herbsandhoney.am/restaurant"
  },
];

final List<Map<String, dynamic>> budgetFriendly = [
  {
    "name": "Ponchik Monchik",
    "image": "images/restaurant7.jpg",
    "time": "09:00 AM-10:30 PM",
    "cuisines": ["Cafe"],
    "meals": ["Breakfast, Lunch"],
    "special": ["Vegetarian Friendly, Vegan Options"],
    "menu": "https://glovoapp.com/am/hy/gyumri/ponchik-monchik/"
  },
  {
    "name": "Basturma Shop",
    "image": "images/restaurant5.png",
    "time": "09:00 AM-11:00 PM",
    "cuisines": ["Cafe, Fast Food, American, Contemporary"],
    "meals": ["Breakfast, Lunch, Dinner, Brunch, Drinks"],
    "special": ["Vegan Options"],
    "menu": "https://glovoapp.com/am/hy/gyumri/basturma-shop-and-grill-bar/"
  },
  {
    "name": "Alexandrovski",
    "image": "images/alex.jpg",
    "time": "09:00 AM-11:00 PM",
    "cuisines": ["European, Armenian"],
    "meals": ["Breakfast, Lunch, Dinner, Brunch, Drinks"],
    "special": ["Vegan Options"],
    "menu": "https://glovoapp.com/am/hy/gyumri/alexandrovski-gym/"
  },
  {
    "name": "Food Time",
    "image": "images/food.jpg",
    "time": "+374 43 43 99 99",
    "cuisines": [
      "Armenian, Japanese, Cafe, Fast Food, Asian, Middle Eastern, Eastern European"
    ],
    "meals": ["Lunch, Dinner, Brunch, Breakfast"],
    "special": ["Vegetarian Friendly, Vegan Options"],
    "menu": "https://foodtime.am/menu"
  },
];

final List<Map<String, dynamic>> cheapEats = [
  {
    "name": "Aregak Bakery",
    "image": "images/restaurant8.jpg",
    "time": "09:00 AM-10:00 PM",
    "cuisines": ["European, Cafe, International"],
    "meals": ["Breakfast, Brunch"],
    "special": ["Vegetarian Friendly, Vegan Options"],
    "menu": "https://aregakbakeryandcafe.weebly.com/menu.html"
  },
  {
    "name": "Pizza Jazz",
    "image": "images/pizza.jpg",
    "time": "10:00 AM-10:00 PM",
    "cuisines": ["European, Cafe, International"],
    "meals": ["Breakfast, Brunch"],
    "special": ["Vegetarian Friendly, Vegan Options"],
    "menu": "https://glovoapp.com/am/en/gyumri/pizza-jazz-gym/"
  },
  {
    "name": "KFC",
    "image": "images/kfc.png",
    "time": "10:00 AM-11:00 PM",
    "cuisines": ["American, Eastern European"],
    "meals": ["Breakfast, Lunch, Dinner, Drinks"],
    "special": ["Reservations"],
    "menu": "https://glovoapp.com/am/hy/gyumri/kfc-gym/"
  },
  {
    "name": "Nor Aleppo",
    "image": "images/restaurant10.jpg",
    "time": "10:00 AM - 9:00 PM",
    "cuisines": ["Mediterranean, Middle Eastern, Arabic"],
    "meals": ["Breakfast, Brunch"],
    "special": ["Vegetarian Friendly, Vegan Options"],
    "menu": "https://noraleppo.am/menu"
  },
];
