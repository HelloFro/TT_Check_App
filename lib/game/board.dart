import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tt_check/constants.dart';
import 'package:tt_check/game/board_space.dart';
import 'package:tt_check/game/game_state.dart';

class Board extends StatelessWidget {
  const Board({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = Colors.blueAccent;
    return Consumer((context, watch) => Container(
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            BoardSpace(spaceIdentifier: 0),
            BoardSpace(spaceIdentifier: 1),        
            BoardSpace(spaceIdentifier: 2),  
            BoardSpace(spaceIdentifier: 3),         
            BoardSpace(spaceIdentifier: 4),         
            BoardSpace(spaceIdentifier: 5),          
            BoardSpace(spaceIdentifier: 6),      
            BoardSpace(spaceIdentifier: 7),         
            BoardSpace(spaceIdentifier: 8),        
          ],
          primary: false,
          shrinkWrap: watch(restartStateProvider).state,
        ),
        width: kPieceSize * 3 + 50,
        height: kPieceSize * 3 + 30,
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}