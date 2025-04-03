
import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/base_scaffold_widget.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/empty_error_state_widget.dart';
import 'package:homescreen_client_balaji/Screen/HomeScreen/Components/notification_widget.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:nb_utils/nb_utils.dart';

// Dummy Data Model
class NotificationData {
  String title;
  String message;
  String notificationType;
  int id;

  NotificationData({
    required this.title,
    required this.message,
    required this.notificationType,
    required this.id,
  });
}

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late Future<List<NotificationData>> future;

  List<NotificationData> dummyNotifications = [
    NotificationData(title: "Payment Received", message: "You received ₹500", notificationType: "PAYMENT", id: 1),
    NotificationData(title: "Booking Confirmed", message: "Your booking is confirmed!", notificationType: "BOOKING", id: 2),
    // NotificationData(title: "Offer Alert!", message: "Exclusive discount for you!", notificationType: "OFFER", id: 3),
  ];

  @override
  void initState() {
    super.initState();
    future = Future.value(dummyNotifications);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBarTitle: "Notification Screen",
      appnavcolor: primaryColor,
      actions: [
        IconButton(
          icon: Icon(Icons.clear_all_rounded, color: Colors.white),
          onPressed: () async {
            setState(() {
              dummyNotifications.clear();
              future = Future.value(dummyNotifications);
            });
          },
        ),
      ],
      child: SnapHelperWidget<List<NotificationData>>(
        future: future,
        initialData: dummyNotifications,
        loadingWidget: LoaderWidget(),
        errorBuilder: (error) {
          return NoDataWidget(
            title: error,
            imageWidget: ErrorStateWidget(),
            retryText: "Reload",
            onRetry: () {
              setState(() {
                future = Future.value(dummyNotifications);
              });
            },
          );
        },
        onSuccess: (list) {
          return AnimatedListView(
            shrinkWrap: true,
            itemCount: list.length,
          //  slideConfiguration: sliderConfigurationGlobal,
            listAnimationType: ListAnimationType.FadeIn,
            fadeInConfiguration: FadeInConfiguration(duration: 2.seconds),
            emptyWidget: NoDataWidget(
              title: "No Notifications",
              subTitle: "You have no new notifications.",
              imageWidget: EmptyStateWidget(),
            ),
            onSwipeRefresh: () async {
              setState(() {
                future = Future.value(dummyNotifications);
              });
              return 2.seconds.delay;
            },
            itemBuilder: (context, index) {
              NotificationData data = list[index];

              // return GestureDetector(
              //   onTap: () {
              //     toast("Tapped on: ${data.title}");
              //   },
              //   child: ListTile(
              //     title: Text(data.title, style: boldTextStyle()),
              //     subtitle: Text(data.message, style: secondaryTextStyle()),
              //     leading: Icon(Icons.notifications, color: Colors.blue),
              //     trailing: Icon(Icons.arrow_forward_ios, size: 16),
              //
              //   ),
              // );

              return  AnimatedListView(
                shrinkWrap: true,
                itemCount: list.length,
                listAnimationType: ListAnimationType.FadeIn,
                fadeInConfiguration: FadeInConfiguration(duration: 2.seconds),
                emptyWidget: NoDataWidget(
                  title: "No Notifications",
                  subTitle: "You have no new notifications.",
                  imageWidget: EmptyStateWidget(),
                ),
                onSwipeRefresh: () async {
                  setState(() {
                    future = Future.value(dummyNotifications);
                  });
                  return 2.seconds.delay;
                },
                itemBuilder: (context, index) {
                  NotificationData data = list[index];

                  return GestureDetector(
                    onTap: () {
                      toast("Tapped on: ${data.title}");
                    },
                    child: NotificationWidget(
                      profileImage: '', // Use an actual URL if available
                      type: data.notificationType,
                      message: data.message,
                      createdAt: '2025-03-21 12:00 PM', // Replace with actual time if available
                      isRead: false, // Add logic for read/unread
                    ).paddingAll(5)
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
