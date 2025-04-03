import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../colour/colors.dart';

class ServiceListNormalGrid extends StatelessWidget {
  final List<ServiceDatafor2by2grid> services;

  ServiceListNormalGrid({required this.services});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories", style: boldTextStyle(size: 16)),
              TextButton(
                onPressed: () => toast("View All Clicked"),
                child: Text("View All", style: boldTextStyle(color: primaryColor, size: 12)),
              ),
            ],
          ),


          /// ✅ Grid View with 2 cards per row
          GridView.builder(
            shrinkWrap: true, // Important to avoid infinite height issues
            physics: NeverScrollableScrollPhysics(), // Disable GridView scrolling
            itemCount: services.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // ✅ 2 Cards per row
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.6, // ✅ Adjust the height-to-width ratio
            ),
            itemBuilder: (context, index) {
              return ServiceCard(service: services[index]);
            },
          ),
        ],
      ),
    );
  }
}


class ServiceCard extends StatelessWidget {
  final ServiceDatafor2by2grid service;

  ServiceCard({required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160, // ✅ Adjusted width
      height: 250, // ✅ Adjusted height
      decoration: BoxDecoration(
        color: Color(0xFFF6F7F9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ✅ Image with Marquee Text
          Stack(
            children: [
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: Center(
                  child: Icon(Icons.image, size: 50, color: Colors.grey[600]),
                ),
              ),

              /// ✅ Marquee Category Text Overlay
              Positioned(
                top: 8,
                left: 8,
                // right: 8, // ✅ Ensures full width
                child: Container(
                  height: 25,
                  width: 100,


                  // padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Marquee(
                    directionMarguee: DirectionMarguee.oneDirection,
                    child: Text(
                      "Hello Hello eloeloeloeloeloeloeloelo ",
                      // style: boldTextStyle(color: appStore.isDarkMode ? white : Colors.black, size: 10),
                    ).paddingSymmetric(horizontal: 5, vertical: 2),
                  ),
                ),
              ),
            ],
          ),

          /// ✅ Content Section
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// ✅ Star Rating
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 14),
                    SizedBox(width: 4),
                    Text(service.rating.toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: 6),
                Text(service.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text("\$${service.price.toStringAsFixed(2)}", style: TextStyle(fontSize: 14, color: Colors.purple, fontWeight: FontWeight.bold)),
                Divider(height: 12, color: Colors.grey[300]),

                /// ✅ Provider Info
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 12,
                      child: Icon(Icons.person, color: Colors.grey[600], size: 16),
                    ),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        service.providerName,
                        style: TextStyle(fontSize: 10, color: Colors.grey),
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

class ServiceDatafor2by2grid {
  final String name;
  final String category;
  final double price;
  final double rating;
  final String providerName;

  ServiceDatafor2by2grid({
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.providerName,
  });
}