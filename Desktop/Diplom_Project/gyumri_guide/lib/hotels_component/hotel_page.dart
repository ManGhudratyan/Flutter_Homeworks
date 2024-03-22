// import 'package:flutter/material.dart';
// import 'package:gyumri_guide/hotels_component/container_hotel.dart';

// class HotelPage extends StatefulWidget {
//   const HotelPage({super.key});

//   @override
//   State<HotelPage> createState() => _HotelPageState();
// }

// class _HotelPageState extends State<HotelPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Gyumri Tourist Guide'),
//           backgroundColor: const Color.fromARGB(255, 195, 220, 240),
//         ),
//         body: const SingleChildScrollView(
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(height: 40),
//                 Text(
//                   'Popular Hotels in Gyumri',
//                   style: TextStyle(
//                       fontSize: 23,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black),
//                 ),
//                 SizedBox(height: 10),
//                 ContainerHotel(
//                   imagePath: 'images/hotel1.jpg',
//                   hotelName: 'Berlin Art Hotel',
//                   address: 'Haghtanaki Avenue 25, 3104 \n1.1 km from centre',
//                   hotelDescription: 'adad',
//                 ),
//                 SizedBox(height: 20),
//                 ContainerHotel(
//                   imagePath: 'images/hotel2.jpg',
//                   hotelName: 'Araks Hotel Complex',
//                   address: ' Gorki Street 25, 3104 \n450 m from centre',
//                   hotelDescription: 'adad',
//                 ),
//                 SizedBox(height: 20),
//                 ContainerHotel(
//                   imagePath: 'images/hotel3.jpg',
//                   hotelName: '21 Rooms Hotel',
//                   address: ' 30 Gorki Street, 3104\n 0.6 km from centre',
//                   hotelDescription: 'asa',
//                 ),
//                 SizedBox(height: 20),
//                 ContainerHotel(
//                   imagePath: 'images/hotel4.jpg',
//                   hotelName: 'Villa Kars',
//                   address: 'Abovyan Street 182 \n150m from centre',
//                   hotelDescription: 'asas',
//                 ),
//                 SizedBox(height: 20),
//                 ContainerHotel(
//                   imagePath: 'images/hotel5.jpg',
//                   hotelName: 'Barbar Arart Hotel',
//                   address: 'Aragats Street 6, 3104 \n0.9 km from centre',
//                   hotelDescription: 'ada',
//                 ),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ));
//   }
// }
