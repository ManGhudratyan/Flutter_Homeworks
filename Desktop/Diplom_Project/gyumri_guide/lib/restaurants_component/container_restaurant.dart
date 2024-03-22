import 'package:flutter/material.dart';
import 'package:gyumri_guide/restaurants_component/restaurant_detail.dart';

class ContainerRestaurant extends StatelessWidget {
  final String restaurantName;
  final String time;
  final int index;
  final String image;
  final String menu;
  final VoidCallback? onViewDetailsPressed;

  const ContainerRestaurant({
    super.key,
    required this.restaurantName,
    required this.time,
    required this.index,
    required this.image,
    required this.menu,
    this.onViewDetailsPressed,
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
              hero: 'hero_tag_$index',
              restaurantName: restaurantName,
              time: time,
              image: AssetImage(image),
              menu: menu,
            ),
          ),
        );
      },
      child: SizedBox(
        width: 220,
        child: Card(
          elevation: 6,
          child: Column(
            children: [
              Image.asset(
                image,
                height: 150,
                width: 300,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  restaurantName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  time,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: onViewDetailsPressed,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                child: const Text(
                  'View Details',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
