
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../../../colour/colors.dart';

class JobRequestDashboardComponent4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color:lightPrimaryColor,
        shape: BoxShape.rectangle,
      ),
      width: MediaQuery.of(context).size.width, // Use MediaQuery for width
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Can\'t find your services?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Post your request and find the best services!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.black),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white, backgroundColor: Colors.blue, // Text color
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              elevation: 0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () async {
              // bool? res = await Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SignInScreen(isFromDashboard: true)),
              // );

              // if (res ?? false) {
              //   // After successful login, navigate to the desired screen
              //   // You can replace the commented code with your actual screen, e.g.,
              //   // Navigator.push(
              //   //   context,
              //   //   MaterialPageRoute(builder: (context) => MyPostRequestListScreen()),
              //   // );
              // }
            },
            child: Text('New Request'),
          ),
        ],
      ),
    );
  }
}
