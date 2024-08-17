
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TileWidget extends StatelessWidget {
  final String title;
  final String icon;
  const TileWidget({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/images/$icon.png'),
            height: 20,
          ),
          Text(title, style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 3.1.w,
          ),),
        ],
      ),
    );
  }
}