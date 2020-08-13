import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tt_check/constants.dart';
import 'package:tt_check/game/board.dart';
import 'package:tt_check/game/game_state.dart';
import 'package:tt_check/game/piece_bench.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("(T-T) Check"),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PieceBench(player: Player.black),
            SizedBox(height: 10),
            Board(),
            SizedBox(height: 10),
            PieceBench(player: Player.white),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.replay),
        tooltip: "Restart",
        onPressed: () {
          turnStateProvider.read(context).state = startingPlayerProvider.read(context).state;
          turnCounterStateProvider.read(context).state = 0;
          restartStateProvider.read(context).state = !restartStateProvider.read(context).state;
        },
      ),
    );
  }
}