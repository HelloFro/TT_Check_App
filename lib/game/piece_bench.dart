import 'package:flutter/material.dart';

import 'package:chess_vectors_flutter/chess_vectors_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tt_check/constants.dart';
import 'package:tt_check/game/game_state.dart';

import 'package:tt_check/game/piece.dart';
import 'package:tt_check/models/piece_data.dart';

class PieceBench extends StatelessWidget {
  const PieceBench({Key key, this.player}) : super(key: key);

  final Player player;

  @override
  Widget build(BuildContext context) {
    return Consumer((context, watch) => Container(
      child: player == Player.white ? 
        Opacity(
          opacity: watch(turnStateProvider).state == Player.black ? 0.5 : 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Piece(pieceData: PieceData("wPawn", WhitePawn(size: kPieceSize), player)),
              Opacity(child: Piece(pieceData: PieceData("wRook", WhiteRook(size: kPieceSize), player)), opacity: watch(turnCounterStateProvider).state < 4  && watch(turnStateProvider).state == Player.white ? 0.5 : 1),
              Opacity(child: Piece(pieceData: PieceData("wBishop", WhiteBishop(size: kPieceSize), player)), opacity: watch(turnCounterStateProvider).state < 6  && watch(turnStateProvider).state == Player.white ? 0.5 : 1),
              Opacity(child: Piece(pieceData: PieceData("wKing", WhiteKing(size: kPieceSize), player)), opacity: watch(turnCounterStateProvider).state < 8  && watch(turnStateProvider).state == Player.white ? 0.5 : 1),
            ],
          )
        ) : 
        Opacity(
          opacity: watch(turnStateProvider).state == Player.black ? 1 : 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Piece(pieceData: PieceData("bPawn", BlackPawn(size: kPieceSize), player)),
              Opacity(child: Piece(pieceData: PieceData("bRook", BlackRook(size: kPieceSize), player)), opacity: watch(turnCounterStateProvider).state < 3  && watch(turnStateProvider).state == Player.black ? 0.5 : 1),
              Opacity(child: Piece(pieceData: PieceData("bBishop", BlackBishop(size: kPieceSize), player)), opacity: watch(turnCounterStateProvider).state < 5  && watch(turnStateProvider).state == Player.black ? 0.5 : 1),
              Opacity(child: Piece(pieceData: PieceData("bKing", BlackKing(size: kPieceSize), player)), opacity: watch(turnCounterStateProvider).state < 7  && watch(turnStateProvider).state == Player.black ? 0.5 : 1),
            ],
          ),
        ),
      )
    );
  }
}