class HotelListData {
  List<String> imagePaths;
  String imagePath;
  String titleTxt;
  String subTxt;
  double dist;
  double rating;
  // int reviews;
  int perNight;
  String description;
  List<String>? information;

  HotelListData(
      {this.imagePath = '',
      required this.imagePaths,
      this.titleTxt = '',
      this.subTxt = '',
      this.dist = 1.8,
      this.rating = 4.5,
      // this.reviews = 80,
      this.perNight = 180,
      this.description = '',
      this.information});

  static List<HotelListData> hotelList = <HotelListData>[
    HotelListData(
        imagePath: 'images/hotel1.jpg',
        imagePaths: [
          'images/berlin1.jpg',
          'images/berlin2.jpg',
          'images/berlin3.jpg',
          'images/berlin4.jpg',
        ],
        titleTxt: 'Berlin Art Hotel',
        subTxt: 'Haghtanaki Avenue 25',
        dist: 1.1,
        // reviews: 80,
        rating: 4.4,
        perNight: 50,
        information: [
          'Non-smoking rooms',
          'Airport shuttle',
          'Free WiFi',
          'Restaurant',
          'Room service',
          'Facilities for disabled guests',
          'Free parking',
          'Bar',
          'Good breakfast',
        ],
        description:
            'Located in the city centre of Gyumri, a 1-minute walk from Victory Park, Berlin ART Hotel features an on-site restaurant serving Armenian cuisine and vegetarian dishes, meeting facilities, free Wi-Fi throughout the property and free private parking. All rooms, halls and corridors of the hotel feature the original art works of local and international artists.'),
    HotelListData(
        imagePath: 'images/hotel3.jpg',
        imagePaths: [
          'images/21room1.jpg',
          'images/21room2.jpg',
          'images/21room3.jpg',
          'images/21room4.jpg',
        ],
        titleTxt: '21 Rooms Hotel',
        subTxt: '30 Gorki Street',
        dist: 0.6,
        // reviews: 62,
        rating: 4.0,
        perNight: 60,
        information: [
          'Airport shuttle (free)',
          'Non-smoking rooms',
          'Free WiFi',
          'Free parking',
          'Family rooms',
          'Breakfast',
        ],
        description:
            'Each room has a flat-screen TV, and certain rooms at the hotel have a city view. At 21 Rooms Hotel guests are welcome to take advantage of a hot tub. With staff speaking English, French, Armenian and Russian, guidance is available at the reception. Couples particularly like the location — they rated it 9.6 for a two-person trip.'),
    HotelListData(
        imagePath: 'images/hotel4.jpg',
        imagePaths: [
          'images/villa1.jpg',
          'images/villa2.jpg',
          'images/villa3.jpg',
          'images/villa4.jpg',
        ],
        titleTxt: 'Villa Kars',
        subTxt: 'Abovyan Street 182',
        dist: 0.5,
        // reviews: 90,
        rating: 4.4,
        perNight: 25,
        information: [
          'Airport shuttle',
          'Room Service',
          'Free WiFi',
          'Free parking',
          'Family rooms',
          'Breakfast',
        ],
        description:
            'Featuring 2 buildings, free Wi-Fi, and a terrace, this boutique hotel is located 10 minutes walk from the central Vardanants Square in Gyumri tow'),
    HotelListData(
        imagePath: 'images/hotel5.jpg',
        imagePaths: [
          'images/barbar1.jpg',
          'images/barbar2.jpg',
          'images/barbar3.jpg',
          'images/barbar4.jpg',
        ],
        titleTxt: 'Barbar Arart Hotel',
        subTxt: 'Aragats Street 6',
        dist: 0.9,
        // reviews: 240,
        rating: 4.5,
        perNight: 40,
        information: [
          'Childrens cots (upon request)',
          'Family rooms',
          'Free WiFi',
          'Free parking',
          'Breakfast',
        ],
        description:
            'The aparthotel will provide guests with air-conditioned units offering a desk, a kettle, a fridge, a minibar, a safety deposit box, a flat-screen TV and a private bathroom with a bath. Guests can have wine or champagne and chocolates or cookies delivered to their room. The units include a wardrobe.'),
    HotelListData(
        imagePath: 'images/hotel6.jpg',
        imagePaths: [
          'images/aratta1.jpg',
          'images/aratta2.jpg',
          'images/aratta3.jpg',
          'images/aratta4.jpg',
        ],
        titleTxt: 'Aratta Royal Hotel',
        subTxt: 'Abovyan St. 139',
        dist: 0.5,
        // reviews: 240,
        rating: 4.5,
        perNight: 20,
        information: [
          'Airport shuttle (free)',
          'Non-smoking rooms',
          'Free WiFi',
          'Free parking',
          'Family rooms',
          'Breakfast',
        ],
        description:
            'Aratta Royal Hotel is located in Gyumri. Among the facilities of this property are a restaurant, free shuttle service and room service, along with free WiFi throughout the property. Free private parking is available and the hotel also provides car hire for guests who want to explore the surrounding area.'),
    HotelListData(
        imagePath: 'images/hotel7.jpg',
        imagePaths: [
          'images/shiraz1.jpg',
          'images/shiraz2.jpg',
          'images/shiraz3.jpg',
          'images/shiraz14.jpg',
        ],
        titleTxt: 'Shiraz Plaza Hotel',
        subTxt: 'Abovyan St. 139',
        dist: 0.6,
        // reviews: 240,
        rating: 4.5,
        perNight: 100,
        information: [
          'Airport shuttle (free)',
          'Non-smoking rooms',
          'Free WiFi',
          'Free parking',
          'Family rooms',
          'Breakfast',
        ],
        description:
            'Shiraz Plaza Hotel in Gyumri features 4-star accommodation with a terrace, a restaurant and a bar. Among the facilities at this property are room service and a 24-hour front desk, along with free WiFi throughout the property. Guests can enjoy city views.'),
    HotelListData(
        imagePath: 'images/hotel2.jpg',
        imagePaths: [
          'images/araks1.jpg',
          'images/araks2.jpg',
          'images/araks3.jpg',
          'images/araks4.jpg',
        ],
        titleTxt: 'Araks Hotel Complex',
        subTxt: 'Gorki Street 25',
        dist: 1,
        // reviews: 74,
        rating: 4.5,
        perNight: 90,
        information: [
          ' Indoor swimming pool',
          'Non-smoking rooms'
              'Airport shuttle',
          'Free WiFi',
          'Restaurant',
          'Room service',
          'Free parking',
          'Family rooms',
          'Bar',
          'Good breakfast',
        ],
        description:
            'At the hotel, the rooms are equipped with a wardrobe. Each room comes with a TV, and certain rooms at Araks Hotel Complex have a city view. Guests at the accommodation can enjoy a buffet breakfast. Speaking English and Russian, staff will be happy to provide guests with practical guidance on the area at the 24-hour front desk.'),
  ];

  get price => null;
}
