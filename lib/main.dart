import 'package:flutter/material.dart';
import 'package:rentall/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       MaterialApp(
        title: 'Rendall',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LandingPage(),

    );
  }
}



// Widget buildRecommendedCard({
//   required int index,
//   required String imagePath,
//   required String price,
//   required String rating,
//   required String location,
//   required String roomInfo,
// }) {
//   return Container(
//     width: 250,
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12),
//       color: Colors.white,
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.asset(
//                 imagePath,
//                 width: double.infinity,
//                 height: 150,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             Positioned(
//               top: 8,
//               right: 8,
//               child: GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     // Toggle selection state
//                     selectedCardIndex = selectedCardIndex == index ? null : index;
//                   });
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   padding: EdgeInsets.all(8),
//                   child: Icon(
//                     selectedCardIndex == index
//                         ? Icons.favorite // Filled heart when selected
//                         : Icons.favorite_border, // Outline heart when not selected
//                     color: Colors.red,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 8),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     price,
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.red, size: 16),
//                       SizedBox(width: 4),
//                       Text(
//                         rating,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               SizedBox(height: 4),
//               Text(
//                 location,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 roomInfo,
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget buildRecommendedSectionn() {
//   return SingleChildScrollView(
//     scrollDirection: Axis.vertical,
//     child: Column(
//       children: [
//         buildRecommendeddCard(
//           index: 4,
//           imagePath: 'https://images.pexels.com/photos/2467558/pexels-photo-2467558.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//           price: "\$120/Night",
//           rating: "4.0",
//           location: "Carinthia Lake See Breakfast",
//           roomInfo: "Private room / 4 beds",
//         ),
//         SizedBox(height: 10),
//         buildRecommendeddCard(
//           index: 5,
//           imagePath: 'assets/images/r5.jpg',
//           price: "\$150/Night",
//           rating: "4.5",
//           location: "Santorini Island Resort",
//           roomInfo: "Private room / 2 beds",
//         ),
//         SizedBox(height: 10),
//         buildRecommendeddCard(
//           index: 6,
//           imagePath: 'assets/images/r6.jpg',
//           price: "\$180/Night",
//           rating: "4.8",
//           location: "Tokyo City Center Stay",
//           roomInfo: "Private apartment / 1 bed",
//         ),
//         SizedBox(height: 10),
//         buildRecommendeddCard(
//           index: 7,
//           imagePath: 'assets/images/r7.jpg',
//           price: "\$100/Night",
//           rating: "3.9",
//           location: "Cozy Cabin in the Woods",
//           roomInfo: "Entire cabin / 3 beds",
//         ),
//       ],
//     ),
//   );
// }
//
// // Recommended card with adaptive size
// Widget buildRecommendeddCard({
//   required int index,
//   required String imagePath,
//   required String price,
//   required String rating,
//   required String location,
//   required String roomInfo,
// }) {
//   return Container(
//     width: double.infinity, // Full width of parent
//     height: 250, // Adjusted height for the card
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(12),
//       color: Colors.white,
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.5),
//           blurRadius: 10,
//           offset: Offset(0, 4),
//         ),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Stack for image and favorite icon
//         Expanded(
//           flex: 6,
//           child: Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: Image.asset(
//                   imagePath,
//                   width: double.infinity,
//                   height: double.infinity, // Image height adjusts within the container
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedCardIndex = selectedCardIndex == index ? null : index;
//                     });
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: EdgeInsets.all(8),
//                     child: Icon(
//                       selectedCardIndex == index
//                           ? Icons.favorite // Filled heart when selected
//                           : Icons.favorite_border, // Outline heart when not selected
//                       color: Colors.red,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 8),
//
//         // Price, rating, and description section
//         Expanded(
//           flex: 4,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       price,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Row(
//                       children: [
//                         Icon(Icons.star, color: Colors.red, size: 16),
//                         SizedBox(width: 4),
//                         Text(
//                           rating,
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   location,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   roomInfo,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 14,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }