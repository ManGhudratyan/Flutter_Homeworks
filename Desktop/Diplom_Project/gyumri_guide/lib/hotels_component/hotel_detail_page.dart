// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:travel_application/cubit/app_cubits.dart';
// import 'package:travel_application/misc/colors.dart';
// import 'package:travel_application/widgets/app_buttons.dart';
// import 'package:travel_application/widgets/app_large_text.dart';
// import 'package:travel_application/widgets/app_text.dart';
// import 'package:travel_application/widgets/responsive_button.dart';

// class HotelDetailPage extends StatefulWidget {
//   const HotelDetailPage({Key? key}) : super(key: key);

//   @override
//   State<HotelDetailPage> createState() => _HotelDetailPageState();
// }

// class _HotelDetailPageState extends State<HotelDetailPage> {
//   int receivedStars = 4;

//   int selectedPersonCountIndex = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SizedBox(
//         width: double.maxFinite,
//         height: double.maxFinite,
//         child: Stack(
//           children: [
//             const Positioned(
//                 left: 0,
//                 right: 0,
//                 child: SizedBox(
//                   width: double.maxFinite,
//                   height: 350,
//                 )),
//             Positioned(
//                 left: 20,
//                 top: 50,
//                 child: Row(
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         BlocProvider.of<AppCubits>(context).goHome();
//                       },
//                       icon: const Icon(Icons.menu),
//                       color: Colors.white,
//                     ) // Clickable
//                   ],
//                 )),
//             Positioned(
//                 top: 320,
//                 child: Container(
//                   padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
//                   width: MediaQuery.of(context).size.width,
//                   height: 500,
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(30),
//                           topRight: Radius.circular(30))),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [],
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.location_on_sharp,
//                             color: AppColors.mainColor,
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Row(
//                         children: [
//                           SizedBox(
//                             width: 5,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       AppLargeText(
//                         text: "How many people?",
//                         colour: Colors.black.withOpacity(0.8),
//                         size: 22,
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       AppText(
//                           text: "Number of people in the group (Including you)",
//                           colour: AppColors.mainTextColor),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Wrap(
//                         children: List.generate(5, (index) {
//                           return InkWell(
//                             onTap: () {
//                               setState(() {
//                                 selectedPersonCountIndex = index;
//                               });
//                             },
//                             child: Container(
//                               margin: const EdgeInsets.only(right: 10),
//                               child: AppButtons(
//                                 size: 50,
//                                 color: selectedPersonCountIndex == index
//                                     ? Colors.white
//                                     : Colors.black,
//                                 backgroundColor:
//                                     selectedPersonCountIndex == index
//                                         ? Colors.black87
//                                         : AppColors.buttonBackground,
//                                 borderColor: selectedPersonCountIndex == index
//                                     ? Colors.black87
//                                     : AppColors.buttonBackground,
//                                 text: (index + 1).toString(),
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       AppLargeText(
//                         text: "Description",
//                         colour: Colors.black.withOpacity(0.8),
//                         size: 22,
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 )),
//             Positioned(
//                 bottom: 20,
//                 left: 20,
//                 right: 20,
//                 child: Row(
//                   children: [
//                     AppButtons(
//                         size: 60,
//                         color: AppColors.textColor2,
//                         backgroundColor: Colors.white,
//                         borderColor: AppColors.textColor1,
//                         isIcon: true,
//                         icon: Icons.favorite_border),
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     ResponsiveButton(
//                       isResponsive: true,
//                     )
//                   ],
//                 ))
//           ],
//         ),
//       ),
//     );
//   }
// }

// hotel_detail_page.dart

// import 'package:flutter/material.dart';

// class HotelDetailPage extends StatelessWidget {
//   final String hotelName;
//   final String hotelDescription;
//   final String imagePath;

//   const HotelDetailPage({
//     Key? key,
//     required this.hotelName,
//     required this.hotelDescription,
//     required this.imagePath,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(hotelName),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 hotelDescription,
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
