import 'package:flutter/material.dart';

import '../constants.dart';

enum Location { bench, board }

class PieceData{
  final String name;
  final Widget piece;
  final Player player;
  Location location = Location.bench;

  PieceData(this.name, this.piece, this.player);

  set changeLocation(Location l) => location = l;
}