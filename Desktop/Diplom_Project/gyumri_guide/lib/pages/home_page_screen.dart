import 'package:flutter/material.dart';
import 'package:gyumri_guide/db/preference_service.dart';
import 'package:gyumri_guide/events_component/event.dart';
import 'package:gyumri_guide/hotel/hotel_home_screen.dart';
import 'package:gyumri_guide/misc/colors.dart';
import 'package:gyumri_guide/museum/museum.dart';
import 'package:gyumri_guide/navpages/chat_page.dart';
import 'package:gyumri_guide/navpages/favorites_page.dart';
import 'package:gyumri_guide/navpages/map_page.dart';
import 'package:gyumri_guide/profile_page/profile.dart';
import 'package:gyumri_guide/restaurants_component/restaurants.dart';
import 'package:gyumri_guide/widgets/app_large_text.dart';
import 'package:gyumri_guide/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage(
      {super.key,
      this.preferenceService,
      this.username,
      this.fullName,
      this.email});

  final PreferenceService? preferenceService;
  final String? username;
  final String? fullName;
  final String? email;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;

  var image = {
    "images/hotel.jpg": "Hotel",
    "images/restaurant.jpg": "Restaurant",
    "images/event.jpeg": "Event",
    "images/museum.png": "Museum",
  };

  var mainImages = [
    "images/main1.jpg",
    "images/main6.jpg",
    "images/main3.jpg",
    "images/main2.jpg",
    "images/main7.jpg",
    "images/main8.jpg",
  ];

  int mainImageIndex = 0;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        // Handle home page
        break;
      case 1:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const MapPage()));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const ChatPage()));
        break;
      case 3:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const FavoritePage()));
        break;
      case 4:
        if (widget.username != null &&
            widget.fullName != null &&
            widget.email != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(
                widget.username!,
                widget.fullName!,
                widget.email!,
              ),
            ),
          );
        }
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Row(
                children: [
                  const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Gyumri Guide',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 252, 110, 100)),
                      )),
                  Expanded(child: Container()),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),

            // Discover Text
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: const AppLargeText(
                text: "Discover",
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Tab Bar
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: const CircleTabIndicator(
                    color: AppColors.mainColor, radius: 4),
                tabs: const [
                  Tab(text: "Images"),
                  SizedBox(width: 10),
                  Tab(text: "Historical Landmarks"),
                  // Tab(text: "Emotional"),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.only(left: 20),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(controller: tabController, children: [
                ListView.builder(
                  itemCount: mainImages.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    String imagePath = mainImages[mainImageIndex];
                    mainImageIndex = (mainImageIndex + 1) % mainImages.length;
                    return GestureDetector(
                      onTap: () {
                        _navigateToDetailPage(context, index);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 15, top: 10),
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const Text("Inspire Me"),
                const Text("Emotional"),
              ]),
            ),

            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 30),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppLargeText(
                      text: "Explore more",
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            Container(
                height: 120,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 30),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (image.values.elementAt(index) == "Hotel") {
                                  _navigateToHotelPage();
                                } else if (image.values.elementAt(index) ==
                                    "Restaurant") {
                                  _navigateToRestaurantPage();
                                } else if (image.values.elementAt(index) ==
                                    "Event") {
                                  _navigateToEventPage();
                                } else if (image.values.elementAt(index) ==
                                    "Museum") {
                                  _navigateToMuseumPage();
                                }
                              },
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage(image.keys.elementAt(index)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppText(
                              text: image.values.elementAt(index),
                              colour: AppColors.textColor1,
                            )
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  void _navigateToDetailPage(BuildContext context, int index) {}

  void _navigateToHotelPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const HotelHomeScreen()));
  }

  void _navigateToRestaurantPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const RestaurantPage()));
  }

  void _navigateToEventPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const EventPage()));
  }

  void _navigateToMuseumPage() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const MuseumPage()));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;

    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius / 2 - 5);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
