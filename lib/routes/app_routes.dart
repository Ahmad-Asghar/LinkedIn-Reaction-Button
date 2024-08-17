import 'package:flutter/material.dart';

import '../presentation/like_screen/reaction_screen.dart';

class Routes {

  static final Map<String, WidgetBuilder> routes = {

    '/': (context) =>    const ReactionScreen(),

  };

}