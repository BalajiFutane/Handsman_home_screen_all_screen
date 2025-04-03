import 'dart:async';
import 'package:flutter/material.dart';
import 'package:homescreen_client_balaji/Screen/notification_screen.dart';
import 'package:homescreen_client_balaji/Screen/search_service_screen.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:homescreen_client_balaji/colour/colors.dart';
import 'package:nb_utils/nb_utils.dart';

class SliderDashboardComponent1 extends StatefulWidget {
  final List<String> sliderList; // List of image URLs or asset paths
  final VoidCallback? callback;

  SliderDashboardComponent1({required this.sliderList, this.callback});

  @override
  _SliderDashboardComponent1State createState() => _SliderDashboardComponent1State();
}

class _SliderDashboardComponent1State extends State<SliderDashboardComponent1> {
  PageController sliderPageController = PageController(initialPage: 0);
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    if (widget.sliderList.length >= 2) {
      _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
        if (_currentPage < widget.sliderList.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        if (mounted) {
          sliderPageController.animateToPage(
            _currentPage,
            duration: Duration(milliseconds: 800),
            curve: Curves.easeOutQuart,
          );
        }
      });
    }

    sliderPageController.addListener(() {
      if (mounted) {
        setState(() {
          _currentPage = sliderPageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    sliderPageController.dispose();
    super.dispose();
  }

  /// **Slider Widget**
  Widget getSliderWidget() {
    return SizedBox(
      height: 320,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          /// **Slider Images**
          widget.sliderList.isNotEmpty
              ? PageView.builder(
            controller: sliderPageController,
            itemCount: widget.sliderList.length,
            itemBuilder: (context, index) {
              return Image.network(
                widget.sliderList[index],
                height: 250,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset('assets/img1.jpg',
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover);
                },
              );
            },
          )
              : Image.asset('assets/img1.jpg',
              height: 250, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),

          /// **Page Indicator Dots**
          if (widget.sliderList.length > 1)
            // Positioned(
            //   bottom: 40,
            //   left: MediaQuery.of(context).size.width / 2 - (widget.sliderList.length * 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: List.generate(
            //       widget.sliderList.length,
            //           (index) => AnimatedContainer(
            //         duration: Duration(milliseconds: 300),
            //         margin: EdgeInsets.symmetric(horizontal: 4),
            //         height: 8,
            //         width: _currentPage == index ? 20 : 8,
            //         decoration: BoxDecoration(
            //           color: _currentPage == index ? Colors.blue : Colors.white,
            //           borderRadius: BorderRadius.circular(4),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),


            Positioned(
              bottom: 28,
              left: MediaQuery.of(context).size.width / 2.2 - (widget.sliderList.length * 10),
              child: DotIndicator(

                pageController: sliderPageController,
                pages: widget.sliderList,
                indicatorColor: primaryColor,
                unselectedIndicatorColor: Colors.white,
                currentBoxShape: BoxShape.rectangle,
                boxShape: BoxShape.rectangle,
                borderRadius: radius(16),
                currentBorderRadius: radius(16),
                currentDotSize: 70,
                currentDotWidth: 20,
                dotSize: 30,
              ).scale(scale: 0.38),
            ),

          /// **🔔 Notification Icon**
          Positioned(
            top: 45,
            right: 14,
            child: GestureDetector(
              onTap: () {
                // Implement notification functionality


                NotificationScreen()
                    .launch(context, pageRouteAnimation: PageRouteAnimation.Fade);

              },
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 1),
                  ],
                ),
                child: Icon(Icons.notifications, color: Colors.black, size: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows overlapping elements
      children: [
        /// **Main Slider**
        getSliderWidget(),

        /// **Location and Search Positioned on the Slider**
        Positioned(
          bottom: -25, // Slightly overlapping the slider
          left: 16,
          right: 16,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    widget.callback?.call();
                  },
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color:primaryColor),
                        SizedBox(width: 8),
                        Text("Current Location", style: secondaryTextStyle()).expand(),
                        Icon(Icons.gps_fixed, color:primaryColor),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 14),
              GestureDetector(
                onTap: () {

                  // SearchServiceScreen().
                  // SearchServiceScreen().launch(context);
                  SearchServiceScreen()
                      .launch(context, pageRouteAnimation: PageRouteAnimation.Fade);


                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2),
                    ],
                  ),
                  child: Icon(Icons.search, color: primaryColor),
                ),
              ),



            ],
          ),
        ),
      ],
    );
  }
}
