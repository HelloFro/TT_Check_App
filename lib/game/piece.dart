import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tt_check/game/game_state.dart';
import 'package:tt_check/models/piece_data.dart';

import '../constants.dart';

class Piece extends StatelessWidget {
  const Piece({Key key, this.pieceData}) : super(key: key);

  final PieceData pieceData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Draggable(
        data: pieceData,
        child: pieceData.piece, 
        feedback: pieceData.piece,
        childWhenDragging: Opacity(child: pieceData.piece, opacity: .5),
        // TODO: implement Turn Logic
        onDragCompleted: () { 
          turnStateProvider.read(context).state = turnStateProvider.read(context).state == Player.black ? Player.white: Player.black;
          turnCounterStateProvider.read(context).state++;
          print("It is now " + turnStateProvider.read(context).state.toString() + "'s turn.");
        },
        onDragStarted: () => print("onDragStarted Player Turn: " + turnStateProvider.read(context).state.toString()),
      ),
      width: kPieceSize, 
      height: kPieceSize,
    );
  }
}