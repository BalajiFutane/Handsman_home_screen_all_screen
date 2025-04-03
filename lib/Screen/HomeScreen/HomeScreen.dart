
import 'package:flutter/material.dart';

import 'Components/Catergory_Horizontal_comp.dart';
import 'Components/Fetured_Services_Horizontal_comp.dart';
import 'Components/Home_screen_Shimmer.dart';
import 'Components/Job_Request_comp.dart';
import 'Components/Services_grid_2by2.dart';
import 'Components/Silder_Home_Screen_comp.dart';
class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> userImages = [
  'https://images.unsplash.com/photo-1734004691776-d7f04732c174?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
'https://images.unsplash.com/photo-1742268350523-70a032f3520d?q=80&w=1968&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
'https://images.unsplash.com/photo-1742275346989-2d696fa2c9b3?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  'https://images.unsplash.com/photo-1741807117240-0aee0cd41d25?q=80&w=2072&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',


  ];

   List<CategoryData> homeCategories = [
     CategoryData(name: "AC CoolCare", imagePath: "assets/icon/ic_calling.png"),
     CategoryData(name: "Cooking", imagePath: "assets/icon/ic_calling.png"),
     CategoryData(name: "Painter", imagePath: "assets/icon/ic_calling.png"),
     CategoryData(name: "Plumber", imagePath: "assets/icon/ic_calling.png"),
   ];

   List<ServiceData> services = [
     ServiceData(
       name: "Filter Replacement",
       category: "AC MAINTENANCE AI",
       price: 15.00,
       rating: 4,
       providerName: "Felix Harris",
     ),
     ServiceData(
       name: "Full Home Cleaning",
       category: "RESIDENTIAL CLEANING",
       price: 43.00,
       rating: 5,
       providerName: "Sophia Williams",
     ),
     ServiceData(
       name: "Carpet Cleaning",
       category: "DEEP CLEANING",
       price: 30.00,
       rating: 4,
       providerName: "John Doe",
     ),

     ServiceData(
       name: "Carpet Cleaning",
       category: "DEEP CLEANING",
       price: 30.00,
       rating: 4,
       providerName: "John Doe",
     ),

     ServiceData(
       name: "Carpet Cleaning",
       category: "DEEP CLEANING",
       price: 30.00,
       rating: 4,
       providerName: "John Doe",
     ),
   ];

   final List<ServiceDatafor2by2grid> servicesforgrid = [
     ServiceDatafor2by2grid(
       name: "Filter Replacement",
       category: "AC MAINTENANCE AI",
       price: 15.00,
       rating: 0.0,
       providerName: "Felix Harris",
     ),
     ServiceDatafor2by2grid(
       name: "Full Home Cleaning",
       category: "RESIDENTIAL CLEANING",
       price: 43.00,
       rating: 0,
       providerName: "Felix Harris",
     ),
     ServiceDatafor2by2grid(
       name: "Plumbing Repair",
       category: "PLUMBING SERVICES",
       price: 25.00,
       rating: 4.4,
       providerName: "John Doe",
     ),
     ServiceDatafor2by2grid(
       name: "Electrical Checkup",
       category: "ELECTRICAL WORK",
       price: 30.00,
       rating: 4.2,
       providerName: "Jane Smith",
     ),
     ServiceDatafor2by2grid(
       name: "Carpet Cleaning",
       category: "CLEANING SERVICES",
       price: 50.00,
       rating: 3.4,
       providerName: "Alex Johnson",
     ),
     ServiceDatafor2by2grid(
       name: "Roof Inspection",
       category: "HOME MAINTENANCE",
       price: 65.00,
       rating: 5.4,
       providerName: "Michael Brown",
     ),
   ];

   bool isLoading = true;



  @override
  void initState() {
    super.initState();

    // Simulate a network request (2 seconds delay)
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        isLoading = false; // ✅ Stop shimmer, show actual data
      });
    });
  }
   @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(


          children: [

            isLoading ? DashboardShimmer() :

            SliderDashboardComponent1(
              sliderList: userImages,
              callback: () {
                print("Location button clicked!"); // Handle location button click
              },
            ),


            SizedBox(height: 30,),

            CategoryListComponent(categories: homeCategories,),
            SizedBox(height: 30,),

            ServiceList(services: services),

            ServiceListNormalGrid(services: servicesforgrid,),
            SizedBox(height: 10,),

            JobRequestDashboardComponent4(),

            SizedBox(height: 10,),

          ],


        ),
      ),



    );
  }
}
