
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';






import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? height, width;
  final Widget? child;

  const ShimmerWidget({this.height, this.width, this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child ??
          Container(
            height: height,
            width: width,
            color: Colors.white,
          ),
    );
  }
}

class DashboardShimmer extends StatelessWidget {
  const DashboardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    BoxDecoration boxDecorationWithRoundedCorners({Color? backgroundColor}) {
      return BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(8),
      );
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          /// Slider UI
          ShimmerWidget(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 325,
                  width: screenWidth,
                  color: Theme.of(context).cardColor,
                ),
                Positioned(
                  bottom: -24,
                  right: 16,
                  left: 16,
                  child: Container(
                    height: 60,
                    width: screenWidth,
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: isDarkMode ? Colors.black12 : Colors.white30,
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),

          /// Upcoming Booking UI
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          //   child: ShimmerWidget(height: 130, width: screenWidth),
          // ),

          /// Category UI
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget(height: 20, width: screenWidth * 0.25),
                    ShimmerWidget(height: 20, width: screenWidth * 0.15),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (_, i) {
                    return ShimmerWidget(
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Container(
                            width: 60,
                            height: 10,
                            decoration: boxDecorationWithRoundedCorners(backgroundColor: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// Featured Service List UI
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget(height: 20, width: screenWidth * 0.25),
                    ShimmerWidget(height: 20, width: screenWidth * 0.15),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 280,
                      decoration: boxDecorationWithRoundedCorners(
                        backgroundColor: Theme.of(context).cardColor,
                      ),
                      child: ShimmerWidget(width: 280, height: 200),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          /// Service List UI
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget(height: 20, width: screenWidth * 0.25),
                    ShimmerWidget(height: 20, width: screenWidth * 0.15),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(4, (index) {
                  return Container(
                    width: screenWidth / 2 - 26,
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ShimmerWidget(height: 205, width: screenWidth / 2 - 26),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ShimmerWidget(height: 10, width: screenWidth * 0.5),
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              ShimmerWidget(
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(child: ShimmerWidget(height: 10, width: screenWidth)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  );
                }),
              ).padding(const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
            ],
          ),

          /// Post Job UI
          const SizedBox(height: 16),
          ShimmerWidget(
            child: Container(
              height: 160,
              width: screenWidth,
              decoration: boxDecorationWithRoundedCorners(backgroundColor: Theme.of(context).cardColor),
            ),
          ),
        ],
      ),
    );
  }
}

extension on Widget {
  Widget padding(EdgeInsets padding) {
    return Padding(padding: padding, child: this);
  }
}
