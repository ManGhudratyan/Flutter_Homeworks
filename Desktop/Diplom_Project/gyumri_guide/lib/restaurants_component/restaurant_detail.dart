import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gyumri_guide/navpages/map_page.dart';
import 'favorite_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:latlong2/latlong.dart';


class RestaurantDetail extends StatefulWidget {
  final int index;
  final String hero;
  final String restaurantName;
  final String time;
  final AssetImage image;
  final String menu;

  const RestaurantDetail(
      {super.key,
      required this.index,
      required this.hero,
      required this.restaurantName,
      required this.time,
      required this.image,
      required this.menu});

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  bool isFavorite = false;
  final List<Map<String, dynamic>> data = [
    {
      "name": "Kumkuma",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "Garegin Njdeh 26/10, Gyumri 3101 Armenia",
      "open": "Open",
      "phone": "+374 60 68 55 55",
      "cuisines": ["Armenian", "Eastern European"],
      "meals": [
        "Breakfast",
        "Lunch",
        "Dinner",
        "Brunch",
        "Late Night",
        "Drinks"
      ],
      "special": ["Reservations", "Seating", "Table Service"],
      "menu": "https://glovoapp.com/am/hy/gyumri/kuma-gym/",
      "latitude": 40.794226923633516,
      "longitude": 43.84585873445667,
    },
    {
      "name": "Florence Gyumri",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "Shirazi 5/7, Gyumri 3101 Armenia",
      "open": "Open",
      "phone": "+374 98 33 99 88",
      "cuisines": ["Italian, Cafe, Barbecue, Grill, Georgian, European"],
      "meals": ["Dinner, Breakfast, Lunch, Late Night, Drinks"],
      "special": ["Vegetarian Friendly, Vegan Options"],
      "menu":
          "https://yandex.ru/maps/org/florents_gyumri/73649352718/menu/?ll=43.838352%2C40.787799&tab=menu&z=17.05",
      "latitude": 40.7879671766144,
      "longitude": 43.83819702360465
    },
    {
      "name": "Hacatun",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "Hakhtanaki St. 1/1 Peace Square, Gyumri 3104 Armenia",
      "open": "Open",
      "phone": "+374 93 13 99 89",
      "cuisines": ["Barbecue, Healthy, Soups, Eastern European, Armenian"],
      "meals": ["Breakfast, Lunch, Dinner, Brunch"],
      "special": ["Vegetarian Friendly, Vegan Options, Gluten Free Options"],
      "menu":
          "https://yandex.ru/maps/org/taverna_gyumri/104760542724/?ll=43.846185%2C40.787041&z=17.05",
      "latitude": 40.78726787578949,
      "longitude": 43.84613019517705
    },
    {
      "name": "Cherkezi Dzor",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "Karmir Berd, Gyumri Armenia",
      "open": "Open",
      "phone": "+374 99 01 15 20",
      "cuisines": ["Seafood, Barbecue, Armenian"],
      "meals": ["Lunch, Dinner, Brunch"],
      "special": ["Vegetarian Friendly"],
      "menu":
          "https://yandex.ru/maps/org/ushchelye_cherkeza/63471962053/?ll=43.828215%2C40.797604&mode=search&sctx=ZAAAAAgBEAAaKAoSCQsL7gc86kVAEYmXp3NFZURAEhIJQgby7PKtnz8RVYhH4uXpjD8iBgABAgMEBSgKOABAk1BIAWoCYW2dAc3MTD2gAQCoAQC9AW7202rCAQbFj%2BW57AGCAg3VsdWv1asg1bHVuNaAigIAkgIAmgIMZGVza3RvcC1tYXBz&sll=43.828215%2C40.797604&sspn=0.015469%2C0.007058&text=%D5%B1%D5%AF%D5%AB%20%D5%B1%D5%B8%D6%80&z=16.92",
      "latitude": 40.79773805457966,
      "longitude": 43.8280076393551
    },
    {
      "name": "Herbs & Honey",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "Rijkov St. 5, Gyumri 3104 Armenia",
      "open": "Open",
      "phone": "+374 93 64 46 45",
      "cuisines": ["Seafood, Barbecue, Armenian"],
      "meals": ["Lunch, Dinner, Brunch"],
      "special": ["Vegetarian Friendly"],
      "menu": "https://herbsandhoney.am/restaurant",
      "latitude": 40.78634182455996,
      "longitude": 43.84352762360422
    },
    {
      "name": "Ponchik Monchik",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "Bagratunyac, 10/2, Gyumri Armenia",
      "open": "Open",
      "phone": "+374 98 66 55 77",
      "cuisines": ["Cafe"],
      "meals": ["Breakfast, Lunch"],
      "special": ["Vegetarian Friendly, Vegan Options"],
      "menu": "https://glovoapp.com/am/hy/gyumri/ponchik-monchik/",
      "latitude": 40.784852065711846,
      "longitude": 43.840774910519066
    },
    {
      "name": "Basturma Shop",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "Rustaveli Street 29/1, Gyumri 3118 Armenia",
      "open": "Open",
      "phone": "+374 44 11 76 55",
      "cuisines": ["Cafe, Fast Food, American, Contemporary"],
      "meals": ["Breakfast, Lunch, Dinner, Brunch, Drinks"],
      "special": ["Vegan Options"],
      "menu": "https://glovoapp.com/am/hy/gyumri/basturma-shop-and-grill-bar/",
      "latitude": 40.78922472352781,
      "longitude": 43.8407917816838
    },
    {
      "name": "Alexandrovski",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "218/1 Abovyan St, Gyumri 3101 Armenia",
      "open": "Open",
      "phone": "+374 44 11 51 55",
      "cuisines": ["European, Armenian"],
      "meals": ["Breakfast, Lunch, Dinner, Brunch, Drinks"],
      "special": ["Vegan Options"],
      "menu": "https://glovoapp.com/am/hy/gyumri/alexandrovski-gym/",
    },
    {
      "name": "Food Time",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "Gorki St., 58/2, Gyumri Armenia",
      "open": "Open",
      "phone": "+374 43 43 99 99",
      "cuisines": [
        "Armenian, Japanese, Cafe, Fast Food, Asian, Middle Eastern, Eastern European"
      ],
      "meals": ["Lunch, Dinner, Brunch, Breakfast"],
      "special": ["Vegetarian Friendly, Vegan Options"],
      "menu": "https://foodtime.am/menu",
      "latitude": 40.78720182946699,
      "longitude": 43.847292354696805
    },
    {
      "name": "Aregak Bakery",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "Rustaveli Street 29/1, Gyumri 3118 Armenia",
      "open": "Open",
      "phone": "+374 44 98 12 34",
      "cuisines": ["European, Cafe, International"],
      "meals": ["Breakfast, Brunch"],
      "special": ["Vegetarian Friendly, Vegan Options"],
      "menu": "https://aregakbakeryandcafe.weebly.com/menu.html",
      "latitude": 40.78646104482652,
      "longitude": 43.84095437003856
    },
    {
      "name": "Pizza Jazz",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "3 Rijkov St., Gyumri Armenia",
      "open": "Open",
      "phone": "031 25 70 77",
      "cuisines": ["European, Cafe, International"],
      "meals": ["Breakfast, Brunch"],
      "special": ["Vegetarian Friendly, Vegan Options"],
      "menu": "https://glovoapp.com/am/en/gyumri/pizza-jazz-gym/",
      "latitude": 40.78700243031741,
      "longitude": 43.844454052439644
    },
    {
      "name": "KFC",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "7 Sayat Nova Ave, Gyumri Armenia",
      "open": "Open",
      "phone": "+374 94 63 50 23",
      "cuisines": ["American, Eastern European"],
      "meals": ["Breakfast, Lunch, Dinner, Drinks"],
      "special": ["Reservations"],
      "menu": "https://glovoapp.com/am/hy/gyumri/kfc-gym/",
      "latitude": 40.79002270039963,
      "longitude": 43.84624761051936
    },
    {
      "name": "Nor Aleppo",
      "city": "Gyumri",
      "country": "Armenia",
      "address": "Alek Manukyan 1, Gyumri 3101 Armenia",
      "open": "Open",
      "phone": "+374 91 10 98 76",
      "cuisines": ["Mediterranean, Middle Eastern, Arabic"],
      "meals": ["Breakfast, Brunch"],
      "special": ["Vegetarian Friendly, Vegan Options"],
      "menu": "https://noraleppo.am/menu",
      "latitude": 40.79341453493912,
      "longitude": 43.84518284079653
    },
  ];

  final ScrollController _controller = ScrollController();
  ScrollPhysics _physics = const ClampingScrollPhysics();
  bool appBarVAR = false;
  bool bottomBarImagesVAR = false;

  @override
  void initState() {
    super.initState();
    try {
      run();
    } catch (e) {
      debugPrint("$e");
    }
    _controller.addListener(() {
      if (_controller.position.pixels <= 100) {
        setState(() => _physics = const ClampingScrollPhysics());
      } else {
        setState(() => _physics = const BouncingScrollPhysics());
      }
    });
  }

  Future run() async {
    await Future.delayed(const Duration(milliseconds: 350));
    setState(() {
      appBarVAR = true;
      bottomBarImagesVAR = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayHeight = MediaQuery.of(context).size.height;
    Map<String, dynamic> restaurantData = data[widget.index];

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: _controller,
                physics: _physics,
                child: Column(
                  children: [
                    Material(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40)),
                      elevation: 4,
                      child: Hero(
                        tag: widget.hero,
                        child: Container(
                          height: displayHeight / 2,
                          width: displayWidth,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(40)),
                              image: DecorationImage(
                                  image: AssetImage(widget.image.assetName),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              AnimatedCrossFade(
                                firstChild: Container(),
                                secondChild: appBar(
                                  restaurantData: restaurantData,
                                ),
                                crossFadeState: appBarVAR
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 400),
                              ),
                              AnimatedCrossFade(
                                firstChild: Container(),
                                secondChild: bottomBarImages(),
                                crossFadeState: appBarVAR
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
                                duration: const Duration(milliseconds: 600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: displayWidth,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.restaurantName,
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                restaurantData["country"],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.black38.withOpacity(0.2),
                      endIndent: 20,
                      indent: 20,
                      height: 4,
                    ),
                    const SizedBox(height: 15),
                    ListTile(
                      isThreeLine: false,
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xffeaeaea),
                        radius: 26,
                        child: Icon(Icons.restaurant_sharp),
                      ),
                      title: Row(
                        children: [
                          Text(
                            restaurantData["open"],
                            style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.done,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        widget.time,
                        style: const TextStyle(
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      trailing: const Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "showDetails ",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.phone),
                      title: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Phone: ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                            TextSpan(
                              text: "${restaurantData["phone"]}",
                              style: const TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  _launchPhone(restaurantData["phone"]);
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.food_bank),
                      title: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Cuisines: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 46, 170, 48)),
                            ),
                            TextSpan(
                              text:
                                  "${restaurantData["cuisines"] != null ? restaurantData["cuisines"].join(", ") : "N/A"}",
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.local_dining),
                      title: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Meals: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 46, 170, 48)),
                            ),
                            TextSpan(
                              text:
                                  "${restaurantData["meals"] != null ? restaurantData["meals"].join(", ") : "N/A"}",
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.star),
                      title: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Special: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 46, 170, 48)),
                            ),
                            TextSpan(
                              text:
                                  "${restaurantData["special"] != null ? restaurantData["special"].join(", ") : "N/A"}",
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Color(0xffeaeaea),
                        radius: 26,
                        child: Icon(Icons.map),
                      ),
                      title: Text(
                        restaurantData["address"],
                        style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: displayWidth,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child:  MapPage(locationCoords: LatLng(restaurantData["latitude"], restaurantData["longitude"]),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(displayWidth * .05),
            height: displayWidth * .155,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Color(0xff140c47),
                borderRadius: BorderRadius.all(Radius.circular(35))),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Book Now ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget appBar({required Map<String, dynamic> restaurantData}) {
    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: false);
    var isFavorite =
        favoriteProvider.favoriteRestaurants.contains(widget.restaurantName);
    return Row(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Container(
                  width: 48,
                  height: 48,
                  color: Colors.white,
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WebView(
                      initialUrl: widget.menu,
                    ),
                  ));
                },
                child: Container(
                  width: 48,
                  height: 48,
                  color: Colors.white,
                  child: const Icon(
                    Icons.restaurant_menu_outlined,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    favoriteProvider.toggleFavorite(
                        widget.restaurantName, widget.time);
                  });
                },
                child: Container(
                  width: 48,
                  height: 48,
                  color: Colors.white,
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget bottomBarImages() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          ),
        ),
      ),
    );
  }

  void _launchPhone(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    // ignore: deprecated_member_use
    if (await canLaunchUrl(phoneLaunchUri)) {
      // ignore: deprecated_member_use
      await launchUrl(phoneLaunchUri);
    } else {
      throw 'Could not launch $phoneLaunchUri';
    }
  }
}
