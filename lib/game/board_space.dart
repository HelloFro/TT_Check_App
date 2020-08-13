import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tt_check/game/game_state.dart';
import 'package:tt_check/game/piece.dart';
import 'package:tt_check/models/piece_data.dart';

import '../constants.dart';

class BoardSpace extends StatelessWidget {
  const BoardSpace({Key key, this.spaceIdentifier}) : super(key: key);

  final int spaceIdentifier;

  @override
  Widget build(BuildContext context) {
    Widget accept;
    bool hasPiece = false;
    Color color;

    return Consumer((context, watch) {
      Player turn = watch(turnStateProvider).state;
      int turnCount = watch(turnCounterStateProvider).state;

      return Container(
        decoration: BoxDecoration(
          border: _determineBorder(),
        ),
        child: DragTarget<PieceData>(
          builder: (context, accepted, rejected){
            return accept ?? Container(width: kPieceSize, height: kPieceSize);
          },
          // TODO: check game state player turn to decide acceptance
          onWillAccept: (piece) => willAccept(piece, hasPiece, turn, turnCount),
          onAccept: (piece) {
            piece.changeLocation = Location.board;
            accept = Piece(pieceData: piece);
            hasPiece = true;
            color = hasPiece ? color : turn == Player.black ? Colors.black : Colors.white;
          },
        ),
        width: kPieceSize, 
        height: kPieceSize,
      );
    }
    );
  }

  Border _determineBorder() {
    Border determinedBorder = Border.all();

    final _borderSide = BorderSide(
      color: Colors.blue,
      width: 3.0,
      style: BorderStyle.solid,
    );

    switch(spaceIdentifier) {
      case 0:
        determinedBorder = Border(bottom: _borderSide, right: _borderSide);
        break;
      case 1:
        determinedBorder = Border(left: _borderSide, bottom: _borderSide, right: _borderSide);
        break;
      case 2:
        determinedBorder = Border(left: _borderSide, bottom: _borderSide);
        break;
      case 3:
        determinedBorder = Border(bottom: _borderSide, right: _borderSide, top: _borderSide);
        break;
      case 4:
        determinedBorder = Border(left: _borderSide, bottom: _borderSide, right: _borderSide, top: _borderSide);
        break;
      case 5:
        determinedBorder = Border(left: _borderSide, bottom: _borderSide, top: _borderSide);
        break;
      case 6:
        determinedBorder = Border(right: _borderSide, top: _borderSide);
        break;
      case 7:
        determinedBorder = Border(left: _borderSide, top: _borderSide, right: _borderSide);
        break;
      case 8:
        determinedBorder = Border(left: _borderSide, top: _borderSide);
        break;
    }
    return determinedBorder;
  }

  bool willAccept(PieceData p, bool hasPiece, Player turn, int turnCount){
    switch (p.name) {
      case "wPawn":
      case "bPawn":
        return !hasPiece && p.player == turn;
      case "wRook":
        return !hasPiece && p.player == turn && turnCount > 2;
      case "bRook":
        return !hasPiece && p.player == turn && turnCount > 3;
      case "wBishop":
        return !hasPiece && p.player == turn && turnCount > 4;
      case "bBishop":
        return !hasPiece && p.player == turn && turnCount > 5;
      case "wKing":
        return !hasPiece && p.player == turn && turnCount > 6;
      case "bKing":
        return !hasPiece && p.player == turn && turnCount > 7;
    }
  }
}