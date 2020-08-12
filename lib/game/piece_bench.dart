import 'package:flutter/material.dart';

import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';

import 'package:tt_check/constants.dart';

import 'package:tt_check/game/piece.dart';

class PieceBench extends StatelessWidget {
  const PieceBench({Key key, this.player}) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: player == Player.white ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Piece(name: "Pawn", piece: WhitePawn(size: kPieceSize), player: player),
          Piece(name: "Rook", piece: WhiteRook(size: kPieceSize), player: player),
          Piece(name: "Bishop", piece: WhiteBishop(size: kPieceSize), player: player),
          Piece(name: "King", piece: WhiteKing(size: kPieceSize), player: player),
        ],
      ) : Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Piece(name: "Pawn", piece: BlackPawn(size: kPieceSize), player: player),
          Piece(name: "Rook", piece: BlackRook(size: kPieceSize), player: player),
          Piece(name: "Bishop", piece: BlackBishop(size: kPieceSize), player: player),
          Piece(name: "King", piece: BlackKing(size: kPieceSize), player: player),
        ],
      ),
    );
  }
}