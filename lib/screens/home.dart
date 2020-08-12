import 'package:flutter/material.dart';
import 'package:tt_check/game/piece_bench.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PieceBench(),
    );
  }
}