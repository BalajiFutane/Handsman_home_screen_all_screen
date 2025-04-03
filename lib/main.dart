import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/screens_12_new.dart';

import 'Screen/HomeScreen/Components/Home_screen_Shimmer.dart';
import 'Screen/HomeScreen/HomeScreen.dart';

void main() {
  runApp( MaterialApp(
    home: DashboardScreen(),
  ));
}


// class MYApp extends StatelessWidget {
//   const MYApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return HomeScreen();
//   }
// }



class DashboardScreen extends StatefulWidget {
  final bool? redirectToBooking;

  DashboardScreen({this.redirectToBooking});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    if (widget.redirectToBooking == true) {
      currentIndex = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Handle double press to exit (optional)
        return true;
      },
      child: Scaffold(
        body: [

          Screens12New(),
          HomeScreen(), // Static Dashboard
          HomeScreen(), // Static Dashboard
           // Static Dashboard
          HomeScreen(), // Static Dashboard
          HomeScreen(), // Static Dashboard
          // Screens12New(), // Static Dashboard
          // DashboardFragment2(), // Static Booking Page
          // CategoryScreen(), // Static Category Page
          // ChatListScreen(), // Static Chat List Page
          // ProfileFragment(), // Static Profile Page
        ][currentIndex],
        bottomNavigationBar: Container(
        height: 75, // Increase height (default is ~56)
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          iconSize: 30, // ✅ Increase icon size
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.receipt), label: "Booking"),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),

    ),
    );
  }
}
