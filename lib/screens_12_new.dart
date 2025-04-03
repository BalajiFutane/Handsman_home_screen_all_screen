import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/Helpdesk/add_help_desk_screen.dart';
import 'package:homescreen_client_balaji/Screen/Helpdesk/help_desk_detail_screen.dart';
import 'package:homescreen_client_balaji/Screen/Helpdesk/help_desk_list_screen.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/Home_screen_Shimmer.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/HomeScreen.dart';
import 'package:homescreen_client_balaji/Screen/booking_list_screen.dart';
import 'package:homescreen_client_balaji/Screen/chat_support_Screen.dart';

import 'package:homescreen_client_balaji/Screen/edit_profile_screen.dart';
import 'package:homescreen_client_balaji/Screen/maintenance_mode_screen.dart';
import 'package:homescreen_client_balaji/Screen/notification_screen.dart';

import 'package:homescreen_client_balaji/Screen/profile_fragment.dart';
import 'package:homescreen_client_balaji/Screen/feedback_screen.dart';
import 'package:homescreen_client_balaji/Screen/raw.dart';

import 'package:homescreen_client_balaji/Screen/search_service_screen.dart';
import 'package:homescreen_client_balaji/Screen/service_deatil_screen_after_booking.dart';
import 'package:homescreen_client_balaji/Screen/service_deatil_screen_after_booking_shimmer.dart';
import 'package:homescreen_client_balaji/Screen/setting_screen.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';


class Screens12New extends StatelessWidget {
  const Screens12New({super.key});

  @override
  Widget build(BuildContext context) {
    // List of Screens
    final List<Map<String, dynamic>> screens = [

      {'title': 'Home Screen', 'widget': HomeScreen(),        },
      {'title': 'Search Service Screen', 'widget': SearchServiceScreen(),        },
      {'title': 'Dashboard  Shimmer Screen', 'widget': DashboardShimmer(),        },
      {'title': 'Profile Screen', 'widget': ProfileFragment() },
      {'title': 'Setting Screen', 'widget': SettingScreen()   },
      {'title': 'Add-HelpDesk Screen', 'widget': AddHelpDeskScreen(callback: (bool ) {  },)},
      {'title': 'HelpDesk Deatils Screen', 'widget': HelpDeskDetailScreen(),},
      {'title': 'HelpDesk List Screen', 'widget': HelpDeskListScreen(),},
      {'title': 'Edit Profile Screen', 'widget': EditProfileScreen(),},
      {'title': 'Maintenance Mode Screen', 'widget': MaintenanceModeScreen(),},
      {'title': 'Booking Item Component  Screen', 'widget':BookingListScreen(),},
      {'title': 'Booking Item Component  Screen', 'widget':ExampleUsage(),},
      {'title': 'Service Deatil Screen After Booking', 'widget':ServiceDeatilScreenAfterBooking(),},
      {'title': 'RateApp Screen Screen After Booking', 'widget':FeedbackScreen(),},
      {'title': 'Notification Screen Screen', 'widget':NotificationScreen(),},
      {'title': 'Chat Support Screen', 'widget':ChatSupportScreen(

      )},
      {'title': 'Service Deatil Screen After Booking (Shimmer Screen)', 'widget':MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: ServiceDetailShimmer(),
        ),
      ),},
    ];

    return Scaffold(
      appBar: AppBar(title:  Text('Screens Multiple'),

     backgroundColor : primaryColor,
      ),
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(screens[index]['title']),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => screens[index]['widget']),
              );
            },
          );
        },
      ),
    );
  }
}
