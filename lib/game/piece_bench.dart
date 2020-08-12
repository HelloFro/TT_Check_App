import 'package:flutter/material.dart';

import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';

import 'package:tt_check/constants.dart';

import 'package:tt_check/game/piece.dart';

class PieceBench extends StatelessWidget {
  const PieceBench({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Piece(name: "Pawn", piece: WhitePawn(size: kPieceSize)),
          Piece(name: "Rook", piece: WhiteRook(size: kPieceSize)),
          Piece(name: "Bishop", piece: WhiteBishop(size: kPieceSize)),
          Piece(name: "King", piece: WhiteKing(size: kPieceSize)),
        ],
      ),
    );
  }
}