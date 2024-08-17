import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../providers/reaction_provider.dart';

class ReactWidget extends StatelessWidget {
  final int index;
  final int focusedIndex;

  const ReactWidget({super.key, required this.index, required this.focusedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom:1.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          focusedIndex == index ?   Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.w),
              child: Text(
                reactionsList[index-1].reactionName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 3.w
                ),),
            ),
          ):const SizedBox(),
          SizedBox(height: 1.h,),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: focusedIndex == index ? 50 : 30,
            child: ZoomIn(
              child: Image(
                image: AssetImage('assets/images/$index.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}