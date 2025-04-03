import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/Helpdesk/Comp/cached_image_widget.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/applied_tax_list_bottom_sheet.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/dotted_line.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class ServiceDeatilScreenAfterBooking extends StatefulWidget {
  const ServiceDeatilScreenAfterBooking({super.key});

  @override
  State<ServiceDeatilScreenAfterBooking> createState() =>
      _ServiceDeatilScreenAfterBookingState();
}

class _ServiceDeatilScreenAfterBookingState
    extends State<ServiceDeatilScreenAfterBooking> {
  @override
  Widget build(BuildContext context) {
    List<TaxData> dummyTaxes = [
      TaxData(title: 'Sales Tax', value: 7.5, type: 'percent'),
      TaxData(title: 'Service Fee', value: 2.0, type: 'fixed'),
      TaxData(title: 'City Tax', value: 1.5, type: 'percent'),
    ];

    return AppScaffold(
      appBarTitle: "Booking Status",
      appnavcolor: primaryColor,

      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 70), // Add bottom padding to avoid button overlap
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SettingSection(
                    title: Text('Booking Information', style: boldTextStyle(color: primaryColor)),
                    divider: Offstage(),
                    headingDecoration: BoxDecoration(
                        color: context.primaryColor.withOpacity(0.5),
                        borderRadius: BorderRadiusDirectional.vertical(
                            top: Radius.circular(16))),
                    headerPadding:
                    EdgeInsets.only(bottom: 14, right: 14, left: 16, top: 14),
                    items: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),

                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CachedImageWidget(
                                  url: "",
                                  height: 75,
                                  width: 80,
                                  fit: BoxFit.cover,
                                  radius: 8,
                                ),
                                SizedBox(width: 16),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Residential Security Patrol",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ).paddingAll(2),
                                    Text(
                                      "&41.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.blue),
                                    ).paddingAll(2)
                                  ],
                                )
                              ],
                            ).paddingAll(8),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: Theme.of(context).dividerColor),
                                borderRadius:
                                BorderRadius.all(Radius.circular(8)),
                              ),
                              margin: EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Address:",
                                        style: secondaryTextStyle(),
                                      ).expand(flex: 2),
                                      8.width,
                                      Marquee(
                                        child: Text(
                                          "OP NO 2 AHILYADEVI HOLKAR,Chowk, Pume",
                                          style: boldTextStyle(size: 12),
                                          textAlign: TextAlign.left,
                                        ),
                                      ).expand(flex: 5),
                                    ],
                                  ).paddingAll(8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Date & Time:",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ).expand(flex: 2),
                                      SizedBox(width: 8),
                                      Expanded(
                                        flex: 5,
                                        child: Marquee(
                                          child: Text(
                                            " March 31, 2025 at 11:33 PM",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(left: 8, bottom: 8, right: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Payment Status:",
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 12,
                                        ),
                                      ).expand(flex: 2),
                                      SizedBox(width: 8),
                                      Expanded(
                                        flex: 5,
                                        child: Marquee(
                                          child: Text(
                                            "pending",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ).paddingOnly(left: 8, bottom: 8, right: 8),
                                ],
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "View Status",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.only(right: 5, left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("About Provider",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "View Status",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ))
                      ],
                    ),
                  ),

                  Container(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.all(Radius.circular(12))),

                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedImageWidget(
                                url: "",
                                height: 75,
                                width: 80,
                                fit: BoxFit.cover,
                                radius: 50,
                              ),
                              SizedBox(width: 16),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Abhi Yadhav",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ).paddingAll(2),
                                  Row(
                                    children: [
                                      Icon(Icons.star,
                                          color: Colors.amber,
                                          size: 18),
                                      SizedBox(width: 4),
                                      Text(
                                        "4.5",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ).paddingAll(8),
                          Container(
                            margin: EdgeInsets.all(5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Email:",
                                      style: secondaryTextStyle(),
                                    ).expand(flex: 2),
                                    8.width,
                                    Marquee(
                                      child: Text(
                                        "abhi@gmail.com",
                                        style: boldTextStyle(size: 12),
                                        textAlign: TextAlign.left,
                                      ),
                                    ).expand(flex: 8),
                                  ],
                                ).paddingOnly(
                                    bottom: 8, left: 20, right: 8, top: 5),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Mobile:",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ).expand(flex: 2),
                                    SizedBox(width: 8),
                                    Expanded(
                                      flex: 8,
                                      child: Marquee(
                                        child: Text(
                                          " 7847484544444",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(left: 20, bottom: 8, right: 8),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address",
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 12,
                                      ),
                                    ).expand(flex: 2),
                                    SizedBox(width: 8),
                                    Expanded(
                                      flex: 8,
                                      child: Marquee(
                                        child: Text(
                                          "Xyz Street ,pune",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ),
                                  ],
                                ).paddingOnly(left: 20, bottom: 1, right: 8),
                              ],
                            ),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "View Status",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ))
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.only(right: 5, left: 5, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Prize Detail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            Text(
                              "\$120.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ).paddingOnly(bottom: 8),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Subtotal",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                              ],
                            ),
                            Text(
                              "\$135.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ).paddingOnly(bottom: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Subtotal + Tax:",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black87),
                                ),
                                SizedBox(width: 4),
                                Tooltip(
                                  message:
                                  "Subtotal includes base price + applicable taxes.",
                                  child: InkWell(
                                    child: Icon(
                                      Icons.info_outline,
                                      size: 20,
                                      color: Colors.cyan,
                                    ),
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (_) => AppliedTaxListBottomSheet(
                                            taxes: dummyTaxes, subTotal: 100),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "\$135.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ).paddingOnly(bottom: 8),

                        Divider(thickness: 1, color: Colors.grey),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total Amount:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "\$135.00",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                          ],
                        ).paddingOnly(top: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Sticky button at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),

              // color: Colors.white,
              child: AppButton(
                text: "btnSubmit",
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                  // side: BorderSide(color: Colors.white, width: 2), // White border
                ),

                height: 40,
                color: primaryColor,
                textStyle: boldTextStyle(color: Colors.white),
                width: context.width() - context.navigationBarHeight,
                onTap: () {
                  // Add your button action here
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}