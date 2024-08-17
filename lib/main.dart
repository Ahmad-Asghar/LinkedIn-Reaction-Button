import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding/presentation/like_screen/providers/reaction_provider.dart';
import 'package:onboarding/routes/app_routes.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'common/app_colors.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ReactionButtonProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark
          .copyWith(statusBarColor: Colors.transparent));
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: Routes.routes,
        theme: ThemeData(
          primaryColor: AppColors.primaryColor,
          colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
        ),
      );
    });
  }
}
