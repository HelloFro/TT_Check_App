import 'package:flutter/material.dart';

import 'package:tt_check/constants.dart';
import 'package:tt_check/game/piece_bench.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PieceBench(player: Player.black),
          SizedBox(height: 10),
          Placeholder(color: Colors.orangeAccent),
          SizedBox(height: 10),
          PieceBench(player: Player.white),
        ]
      ),
    );
  }
}