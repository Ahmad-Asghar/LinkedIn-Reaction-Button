import 'package:flutter/cupertino.dart';
import '../model/reaction_model.dart';

class ReactionButtonProvider extends ChangeNotifier {
  bool _showReactions = false;
  int _focusedReactionIndex = 0;
  int _selectedReactionIndex = 0;

  bool get showReactions => _showReactions;
  int get focusedReactionIndex => _focusedReactionIndex;
  int get selectedReactionIndex => _selectedReactionIndex;

  void showReactionTile() {
    _showReactions = !_showReactions;
    notifyListeners();
  }

  void selectReactionIndex(int index){
    _selectedReactionIndex=index;
    notifyListeners();

  }
  void changeFocusIndex(int index) {
    _focusedReactionIndex = index;
    notifyListeners();
  }


}

List<ReactionModel> reactionsList =[
  ReactionModel(color: const Color(0xff014880,), reactionName: 'Like'),
  ReactionModel(color: const Color(0xff275f2d,), reactionName: 'Celebrate'),
  ReactionModel(color: const Color(0xff6b5881,), reactionName: 'Support'),
  ReactionModel(color: const Color(0xffb83a04,), reactionName: 'Love'),
  ReactionModel(color: const Color(0xffa76f11,), reactionName: 'Insightful'),
  ReactionModel(color: const Color(0xff0e727d,), reactionName: 'Funny'),
];

