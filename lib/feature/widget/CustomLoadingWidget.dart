import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: 7,
      shrinkWrap: true,
      itemBuilder: (_, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 110,
            margin: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(width: 100, height: 100, color: Colors.white),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 12,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8),
                      Container(height: 12, width: 150, color: Colors.white),
                      Spacer(),
                      Row(
                        children: [
                          Container(height: 10, width: 80, color: Colors.white),
                          SizedBox(width: 10),
                          Container(height: 10, width: 40, color: Colors.white),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
