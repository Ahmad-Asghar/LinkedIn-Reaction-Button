import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/presentation/like_screen/providers/reaction_provider.dart';
import 'package:onboarding/presentation/like_screen/widgets/reaction_widget.dart';
import 'package:onboarding/presentation/like_screen/widgets/tile_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../common/app_colors.dart';

class ReactionScreen extends StatelessWidget {
  const ReactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ReactionButtonProvider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              GlobalKey key = GlobalKey();
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   const SizedBox(
                     width: double.maxFinite,
                     child: Image(
                       fit:BoxFit.fill,
                       image: AssetImage('assets/images/post_image.png'),
                     ),
                   ),
                   Padding(
                     padding:  EdgeInsets.symmetric(horizontal: 4.w),
                     child: Divider(color: AppColors.dividerColor),
                   ),
                   SizedBox(height: 0.5.h,),
                   Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            if(provider.selectedReactionIndex==0){
                              provider.selectReactionIndex(1);
                            }else{
                              provider.selectReactionIndex(0);
                            }
                          },
                          onLongPress: () {
                            if (key.currentContext != null) {
                              final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
                              final Offset position = renderBox.localToGlobal(Offset.zero);
                              showDialog(
                                barrierColor: Colors.transparent,
                                context: context,
                                builder: (BuildContext context) {
                                  Timer(const Duration(milliseconds: 100), () {
                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      provider.changeFocusIndex(1);
                                    });
                                  });
                                  return Consumer<ReactionButtonProvider>(
                                    builder: (context, provider, child) {
                                      return Stack(
                                        children: [
                                          Positioned(
                                            left: position.dx,
                                            top: position.dy - 21.h,
                                            child: Padding(
                                              padding:  EdgeInsets.only(left: 4.w),
                                              child: SizedBox(
                                                height: 21.h,
                                                width: 80.w,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    SizedBox(
                                                      height: 15.h,
                                                      child: Stack(
                                                        alignment: Alignment.bottomCenter,
                                                        children: [
                                                          ZoomIn(
                                                            animate: true,
                                                            child: Container(
                                                              height: 6.h,
                                                              width: 80.w,
                                                              decoration: BoxDecoration(
                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(25),
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors.black.withOpacity(0.2),
                                                                    spreadRadius: 2,
                                                                    blurRadius: 10,
                                                                    offset: const Offset(0, 4),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment.bottomCenter,
                                                            child: Padding(
                                                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  ReactWidget(index: 1, focusedIndex: provider.focusedReactionIndex),
                                                                  ReactWidget(index: 2, focusedIndex: provider.focusedReactionIndex),
                                                                  ReactWidget(index: 3, focusedIndex: provider.focusedReactionIndex),
                                                                  ReactWidget(index: 4, focusedIndex: provider.focusedReactionIndex),
                                                                  ReactWidget(index: 5, focusedIndex: provider.focusedReactionIndex),
                                                                  ReactWidget(index: 6, focusedIndex: provider.focusedReactionIndex),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onHorizontalDragUpdate: (details) {
                                                        double containerWidth = 80.w;
                                                        double partWidth = containerWidth / 6;
                                                        int part = (details.localPosition.dx / partWidth).floor();
                                                        part = part.clamp(0, 5);
                                                        provider.changeFocusIndex(part + 1);
                                                      },
                                                      onHorizontalDragEnd: (details) {
                                                        Navigator.pop(context);
                                                        provider.selectReactionIndex(provider.focusedReactionIndex);
                                                      },
                                                      child: Container(
                                                        height: 5.h,
                                                        width: 80.w,
                                                        color: Colors.transparent,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              // Handle the case where key.currentContext is null
                              debugPrint('Key context is null');
                            }
                          },
                          child: Container(
                            key: key,
                            child: provider.selectedReactionIndex == 0
                                ? Column(
                              children: [
                                const Image(
                                  image: AssetImage('assets/images/unliked.png'),
                                  height: 20,
                                ),
                                Text("Like", style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 3.1.w,
                                ),),
                              ],
                            )
                                : Column(
                              children: [
                                Stack(
                                  children: [
                                    Image(
                                      image: AssetImage('assets/images/${provider.selectedReactionIndex}.png'),
                                      height: 20,
                                    ),
                                    ElasticIn(
                                      child: Image(
                                        image: AssetImage('assets/images/${provider.selectedReactionIndex}.png'),
                                        height: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  reactionsList[provider.selectedReactionIndex-1].reactionName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 3.1.w,
                                    color: reactionsList[provider.selectedReactionIndex-1].color,
                                  ),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const TileWidget(title: 'Comment', icon: 'comment',),
                      const TileWidget(title: 'Repost', icon: 'repost',),
                      const TileWidget(title: 'Send', icon: 'send',),
                    ],
                  ),
                ],
              );
            },
          );
        },
      ),

    );
  }
}






