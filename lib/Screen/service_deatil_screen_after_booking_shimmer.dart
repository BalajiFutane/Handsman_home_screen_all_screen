import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ServiceDetailShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Booking Information Section
          _buildShimmerSection(
            child: Column(
              children: [
                _buildShimmerRow(
                  children: [
                    _buildShimmerBox(height: 75, width: 80),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildShimmerBox(width: 200, height: 20),
                        SizedBox(height: 8),
                        _buildShimmerBox(width: 80, height: 20),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                _buildShimmerBox(height: 120, width: double.infinity),
                SizedBox(height: 16),
                _buildShimmerBox(width: 100, height: 20),
              ],
            ),
          ),

          SizedBox(height: 20),

          // About Provider Header
          _buildShimmerBox(width: 150, height: 20),
          SizedBox(height: 10),

          // About Provider Content
          _buildShimmerSection(
            child: Column(
              children: [
                _buildShimmerRow(
                  children: [
                    _buildShimmerBox(height: 75, width: 80, isCircle: true),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildShimmerBox(width: 150, height: 20),
                        SizedBox(height: 8),
                        _buildShimmerBox(width: 50, height: 20),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  children: [
                    _buildShimmerBox(width: double.infinity, height: 15),
                    SizedBox(height: 8),
                    _buildShimmerBox(width: double.infinity, height: 15),
                    SizedBox(height: 8),
                    _buildShimmerBox(width: double.infinity, height: 15),
                  ],
                ),
                SizedBox(height: 16),
                _buildShimmerBox(width: 100, height: 20),
              ],
            ),
          ),

          SizedBox(height: 20),

          // Price Detail Header
          _buildShimmerBox(width: 150, height: 20),
          SizedBox(height: 10),

          // Price Detail Content
          _buildShimmerSection(
            child: Column(
              children: [
                _buildShimmerRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildShimmerBox(width: 80, height: 20),
                    _buildShimmerBox(width: 60, height: 20),
                  ],
                ),
                SizedBox(height: 16),
                _buildShimmerRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildShimmerBox(width: 80, height: 20),
                    _buildShimmerBox(width: 60, height: 20),
                  ],
                ),
                SizedBox(height: 16),
                _buildShimmerRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _buildShimmerBox(width: 100, height: 20),
                        SizedBox(width: 8),
                        _buildShimmerBox(width: 20, height: 20),
                      ],
                    ),
                    _buildShimmerBox(width: 60, height: 20),
                  ],
                ),
                SizedBox(height: 16),
                _buildShimmerBox(width: double.infinity, height: 1),
                SizedBox(height: 16),
                _buildShimmerRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildShimmerBox(width: 120, height: 20),
                    _buildShimmerBox(width: 80, height: 20),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 80), // Space for the sticky button
        ],
      ),
    );
  }

  Widget _buildShimmerSection({required Widget child}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: child,
      ),
    );
  }

  Widget _buildShimmerRow({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    required List<Widget> children,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildShimmerBox({
    double width = double.infinity,
    double height = 20,
    bool isCircle = false,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: isCircle
            ? BorderRadius.circular(height / 2)
            : BorderRadius.circular(4),
      ),
    );
  }
}