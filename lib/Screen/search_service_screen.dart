// import 'package:flutter/material.dart';
// import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
// import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/empty_error_state_widget.dart';
// import 'package:homescreen_client_balaji/colour/colors.dart';
// import 'package:nb_utils/nb_utils.dart';
//
//
// class SearchServiceScreen extends StatefulWidget {
//   @override
//   State<SearchServiceScreen> createState() => _SearchServiceScreenState();
// }
//
// class _SearchServiceScreenState extends State<SearchServiceScreen> {
//   FocusNode searchFocusNode = FocusNode();
//   TextEditingController searchCont = TextEditingController();
//
//   List<String> serviceList = [
//
//   ];
//   List<String> filteredServiceList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     filteredServiceList = serviceList; // Show all services initially
//   }
//
//   /// Perform Local Search Filtering
//   void filterServices(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         filteredServiceList = serviceList;
//       } else {
//         filteredServiceList = serviceList.where((service) => service.toLowerCase().contains(query.toLowerCase())).toList();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     searchFocusNode.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => hideKeyboard(context),
//       child: AppScaffold(
//         // backgroundColor: Colors.white,
//         // a: AppBar(
//         //   title:Text("Search Services"),
//         // ),
//
//         appBarTitle: "Search Service ",
//         appnavcolor: primaryColor,
//         child: Column(
//           children: [
//             /// Search Bar
//             Container(
//               padding: EdgeInsets.all(16),
//
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//
//                       decoration: BoxDecoration(
//                         color:Color(0xFFF6F7F9) ,
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       height: 45,
//                       child: AppTextField(
//                         textFieldType: TextFieldType.OTHER,
//                         focus: searchFocusNode,
//                         controller: searchCont,
//                         suffix: CloseButton(
//                           onPressed: () {
//                             searchCont.clear();
//                             filterServices(''); // Clears search results
//                           },
//                         ).visible(searchCont.text.isNotEmpty),
//                         onFieldSubmitted: (s) {
//                           filterServices(s); // Perform search when user submits
//                         },
//                         decoration: InputDecoration(
//                           hintText: "Search for services...",
//                           prefixIcon: Icon(Icons.search, size: 22).paddingAll(10),
//                           hintStyle: secondaryTextStyle(),
//
//                           // No border when not selected
//                           border: InputBorder.none,
//
//                           // Thin border when focused (selected)
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10),
//                             borderSide: BorderSide(color:primaryColor, width: 0.5), // Thin blue border
//                           ),
//                         ),
//
//                       ),
//                     ),
//                   ),
//                   15.width,
//
//                   /// Filter Button (Visual Only, No Functionality)
//                   Container(
//                     padding: EdgeInsets.all(8),
//                     decoration: boxDecorationDefault(color: context.primaryColor),
//                     child: Image.network(
//                        "https://static.vecteezy.com/system/resources/thumbnails/011/665/564/small/3d-rendering-blue-filter-icon-isolated-png.png",
//                       height: 26,
//                       width: 26,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//
//             /// Service List
//             Expanded(
//               child: filteredServiceList.isEmpty
//                   ? Container(
//                   margin: EdgeInsets.only(bottom: 150),
//                   child: NoDataWidget(title: "No services found", imageWidget: EmptyStateWidget()))
//                   : ListView.builder(
//                 itemCount: filteredServiceList.length,
//                 itemBuilder: (_, index) {
//                   return ListTile(
//                     leading: Icon(Icons.build, color: context.primaryColor),
//                     title: Text(filteredServiceList[index], style: primaryTextStyle()),
//                     onTap: () {
//                       toast("${filteredServiceList[index]} selected");
//                     },
//                   ).paddingSymmetric(horizontal: 16, vertical: 8);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/empty_error_state_widget.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class SearchServiceScreen extends StatefulWidget {
  @override
  State<SearchServiceScreen> createState() => _SearchServiceScreenState();
}

class _SearchServiceScreenState extends State<SearchServiceScreen> {
  FocusNode searchFocusNode = FocusNode();
  TextEditingController searchCont = TextEditingController();

  List<String> serviceList = [];
  List<String> filteredServiceList = [];

  @override
  void initState() {
    super.initState();
    filteredServiceList = serviceList;
  }

  void filterServices(String query) {
    setState(() {
      filteredServiceList = query.isEmpty
          ? serviceList
          : serviceList.where((service) => service.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: AppScaffold(
        appBarTitle: "Search Service",
        appnavcolor: primaryColor,
        child: Column(
          children: [
            /// Search Bar - Fixed with proper constraints
            Padding(
              padding: EdgeInsets.all(16),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Row(
                    children: [
                      /// Search Field - Takes remaining space after filter button
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F7F9),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 45,
                          child: AppTextField(
                            textFieldType: TextFieldType.OTHER,
                            focus: searchFocusNode,
                            controller: searchCont,
                            suffix: CloseButton(
                              onPressed: () {
                                searchCont.clear();
                                filterServices('');
                              },
                            ).visible(searchCont.text.isNotEmpty),
                            onFieldSubmitted: filterServices,
                            decoration: InputDecoration(
                              hintText: "Search for services...",
                              prefixIcon: Icon(Icons.search, size: 22).paddingAll(10),
                              hintStyle: secondaryTextStyle(),
                              border: InputBorder.none,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: primaryColor, width: 0.5),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 15),

                      /// Filter Button - Fixed width
                      Container(
                        width: 45, // Fixed width
                        height: 45, // Match search field height
                        padding: EdgeInsets.all(8),
                        decoration: boxDecorationDefault(color: context.primaryColor),
                        child: Image.network(
                          "https://static.vecteezy.com/system/resources/thumbnails/011/665/564/small/3d-rendering-blue-filter-icon-isolated-png.png",
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            /// Service List
            Expanded(
              child: filteredServiceList.isEmpty
                  ? Container(
                margin: EdgeInsets.only(bottom: 150),
                child: NoDataWidget(
                  title: "No services found",
                  imageWidget: EmptyStateWidget(),
                ),
              )
                  : ListView.builder(
                itemCount: filteredServiceList.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: Icon(Icons.build, color: context.primaryColor),
                    title: Text(filteredServiceList[index], style: primaryTextStyle()),
                    onTap: () {
                      toast("${filteredServiceList[index]} selected");
                    },
                  ).paddingSymmetric(horizontal: 16, vertical: 8);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

