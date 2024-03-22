// import 'package:flutter/material.dart';
// import 'package:gyumri_guide/hotels_component/hotel_detail_page.dart';

// class ContainerHotel extends StatelessWidget {
//   final String imagePath;
//   final String hotelName;
//   final String address;
//   final String hotelDescription;

//   const ContainerHotel({
//     super.key,
//     required this.imagePath,
//     required this.hotelName,
//     required this.address,
//     required this.hotelDescription,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 300,
//       child: Card(
//         elevation: 3,
//         child: Column(
//           children: [
//             Image.asset(
//               imagePath,
//               height: 150,
//               width: 300,
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 hotelName,
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8.0),
//               child: Text(
//                 'Address: $address',
//                 style: const TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HotelDetailPage(
//                       hotelName: hotelName,
//                       hotelDescription: hotelDescription,
//                       imagePath: imagePath,
//                     ),
//                   ),
//                 );
//               },
//               style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
//               ),
//               child: const Text(
//                 'View Details',
//                 style: TextStyle(fontSize: 14, color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 10),
//           ],
//         ),
//       ),
//     );
//   }
// }
