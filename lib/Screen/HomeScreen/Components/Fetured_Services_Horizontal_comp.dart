// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:nb_utils/nb_utils.dart';
//
// import '../../../colour/colors.dart';
//
// class ServiceList extends StatelessWidget {
//   final List<ServiceData> services;
//
//   // ✅ Constructor accepts services dynamically
//   ServiceList({required this.services});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: primaryLightColor,
//       height: 450,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Categories", style: boldTextStyle(size: 16)),
//                     TextButton(
//                       onPressed: () => toast("View All Clicked"), // Replace with navigation
//                       child: Text("View All", style: boldTextStyle(color: primaryColor, size: 12)),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           Container(
//             height: 350,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: services.length,
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: EdgeInsets.only(left: 10),
//                   padding: EdgeInsets.only(right: 5),
//                   child: ServiceCard(service: services[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ServiceCard extends StatelessWidget {
//   final ServiceData service;
//
//   ServiceCard({required this.service});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 290,
//       decoration: BoxDecoration(
//         color: Colors.red,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               Container(
//                 height: 170,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//                 ),
//                 child: Center(
//                   child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
//                 ),
//               ),
//               Positioned(
//                 top: 12,
//                 left: 12,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
//                   constraints: BoxConstraints(maxWidth: context.width() * 0.3),
//                   decoration: boxDecorationWithShadow(
//                     borderRadius: radius(24),
//                   ),
//                   child: Marquee(
//                     directionMarguee: DirectionMarguee.oneDirection,
//                     child: Text(
//                       service.category,
//                     ).paddingSymmetric(horizontal: 8, vertical: 4),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(color: Colors.amber.shade50, borderRadius: BorderRadius.circular(24)),
//                       child: Row(
//                         children: [
//                           Icon(Icons.star, color: Colors.amber, size: 16),
//                           SizedBox(width: 4),
//                           Text(service.rating.toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8),
//                 Text(service.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 8),
//                 Text("\$${service.price.toStringAsFixed(2)}", style: TextStyle(fontSize: 16, color: Colors.purple, fontWeight: FontWeight.bold)),
//                 Divider(height: 20, color: Colors.grey[300]),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundColor: Colors.grey[300],
//                       radius: 16,
//                       child: Icon(Icons.person, color: Colors.grey[600]),
//                     ),
//                     SizedBox(width: 8),
//                     Expanded(
//                       child: Text(
//                         service.providerName,
//                         style: TextStyle(fontSize: 12, color: Colors.grey),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ServiceData {
//   final String name;
//   final String category;
//   final double price;
//   final double rating;
//   final String providerName;
//
//   ServiceData({
//     required this.name,
//     required this.category,
//     required this.price,
//     required this.rating,
//     required this.providerName,
//   });
// }


import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../colour/colors.dart';

class ServiceList extends StatelessWidget {
  final List<ServiceData> services;

  ServiceList({required this.services});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryLightColor,
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Featured", style: boldTextStyle(size: 16)),
                TextButton(
                  onPressed: () => toast("View All Clicked"),
                  child: Text("View All", style: boldTextStyle(color: Colors.blue, size: 12)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 295,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: services.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: ServiceCard(service: services[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final ServiceData service;

  ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 290,

      decoration: BoxDecoration(
        // color: cardLightColor,
        color:Color(0xFFF6F7F9),
        borderRadius: BorderRadius.circular(13),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 165,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  // child: Image.asset(
                  //   'assets/security.jpg', // Replace with actual image
                  //   fit: BoxFit.cover,
                  // ),
                  child: Placeholder(),
                ),
              ),
              // Positioned(
              //   top: 10,
              //   left: 10,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              //     decoration: BoxDecoration(
              //       color: Colors.white,
              //       borderRadius: BorderRadius.circular(24),
              //       boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              //     ),
              //     child: Text(
              //       service.category.toUpperCase(),
              //       style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blue),
              //     ),
              //   ),
              // ),

      Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
                  constraints: BoxConstraints(maxWidth: context.width() * 0.25),
                  decoration: boxDecorationWithShadow(
                    borderRadius: radius(24),
                  ),
                  child: Marquee(
                    directionMarguee: DirectionMarguee.oneDirection,
                    child: Text(
                      service.category,
                    ).paddingSymmetric(horizontal: 5, vertical: 1),
                  ),
                ),
              ),


              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    "\$${service.price.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    5,
                        (index) => Icon(
                      index < service.rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 16,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(service.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Divider(height: 15, color: Colors.grey[300]),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/user.jpg'), // Replace with actual provider image
                      radius: 16,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        service.providerName,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceData {
  final String name;
  final String category;
  final double price;
  final int rating;
  final String providerName;

  ServiceData({
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.providerName,
  });
}

