import 'package:flutter/material.dart';

class Piece extends StatelessWidget {
  const Piece({Key key, this.piece, this.name}) : super(key: key);

  final String name;
  final Widget piece;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Draggable(
        child: piece, 
        feedback: piece,
        childWhenDragging: Placeholder(),
        // TODO: Turn Logic
        onDragCompleted: null,
      ),
    );
  }
}