import 'package:flutter/material.dart';

import '../constants.dart';

class Piece extends StatelessWidget {
  const Piece({Key key, this.piece, this.name, this.player}) : super(key: key);

  final String name;
  final Widget piece;
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Draggable(
        child: piece, 
        feedback: piece,
        childWhenDragging: player == Player.white ? Placeholder(color: Colors.white): Placeholder(color: Colors.black),
        // TODO: implement Turn Logic
        onDragCompleted: null,
      ),
      width: kPieceSize, 
      height: kPieceSize,
    );
  }
}