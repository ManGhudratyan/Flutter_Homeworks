import 'package:flutter/material.dart';
import 'hotel_list_model.dart';
import 'hotel_list_view.dart';
import 'hotel_theme.dart';

class HotelHomeScreen extends StatefulWidget {
  const HotelHomeScreen({super.key});

  @override
  State<HotelHomeScreen> createState() => _HotelHomeScreenState();
}

class _HotelHomeScreenState extends State<HotelHomeScreen>
    with TickerProviderStateMixin {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));
  bool isFavorite = false;
  String selectedPriceRange = 'Any';
  List<String> priceRanges = [
    '',
    '\$0 - \$50',
    '\$50 - \$100',
    '\$100 - \$200',
    '\$200+',
  ];
  List<HotelListData> hotelList = HotelListData.hotelList;
  AnimationController? animationController;
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppBar(
              title: const Text(
                'Hotels in Gyumri',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              centerTitle: true),
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Column(
                          children: <Widget>[
                            getSearchBarUI(),
                          ],
                        );
                      },
                      childCount: 1,
                    ),
                  ),
                ];
              },
              body: Container(
                color: HotelTheme.buildLightTheme().colorScheme.background,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    final int count =
                        hotelList.length > 10 ? 10 : hotelList.length;
                    final Animation<double> animation =
                        Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animationController!,
                        curve: Interval((1 / count) * index, 1.0,
                            curve: Curves.fastOutSlowIn),
                      ),
                    );
                    animationController!.forward();
                    return HotelListView(
                      callback: () {},
                      hotelData: hotelList[index],
                      animation: animation,
                      animationController: animationController,
                    );
                  },
                  itemCount: hotelList.length,
                  padding: const EdgeInsets.only(top: 0),
                  scrollDirection: Axis.vertical,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getSearchBarUI() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(bottom: 10, left: 16, top: 10, right: 92),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 25, top: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          HotelTheme.buildLightTheme().colorScheme.background,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(38.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(0, 2),
                          blurRadius: 8.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                'Price Range: $selectedPriceRange',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 124, 122, 122)),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  color: HotelTheme.buildLightTheme().primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(38.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      offset: const Offset(0, 2),
                      blurRadius: 8.0,
                    )
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(32.0)),
                    onTap: () {
                      _showPriceRangeDialog(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.price_change_sharp,
                        size: 20,
                        color:
                            HotelTheme.buildLightTheme().colorScheme.background,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getFilterBarUI() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              _showPriceRangeDialog(context);
            },
            child: const Text('Select Range'),
          ),
        ],
      ),
    );
  }

  void _showPriceRangeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Price Range'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: minPriceController,
                decoration:
                    const InputDecoration(labelText: 'Enter minimum price'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: maxPriceController,
                decoration:
                    const InputDecoration(labelText: 'Enter maximum price'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () {
                  int minPrice = int.parse(minPriceController.text);
                  int maxPrice = int.parse(maxPriceController.text);
                  String selectedRange = '\$$minPrice - \$$maxPrice';
                  filterByPrice(selectedRange);
                  Navigator.of(context).pop();
                },
                child: const Text('Apply'),
              ),
            ],
          ),
        );
      },
    );
  }

  void filterByPrice(String selectedRange) {
    List<HotelListData> filteredList;
    if (selectedRange == 'Any') {
      filteredList = HotelListData.hotelList;
    } else {
      filteredList = HotelListData.hotelList.where((hotel) {
        int minPrice = int.parse(selectedRange.split(' - ')[0].substring(1));
        int maxPrice = int.parse(selectedRange.split(' - ')[1].substring(1));
        return hotel.perNight >= minPrice && hotel.perNight <= maxPrice;
      }).toList();
    }

    setState(() {
      hotelList = filteredList;
      selectedPriceRange = selectedRange;
    });
  }
}

class ContestTabHeader extends StatelessWidget {
  final Widget child;

  const ContestTabHeader({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: true,
      delegate: _ContestTabHeaderDelegate(child: child),
    );
  }
}

class _ContestTabHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _ContestTabHeaderDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50.0;

  @override
  double get minExtent => 50.0;

  @override
  bool shouldRebuild(_ContestTabHeaderDelegate oldDelegate) {
    return false;
  }
}
