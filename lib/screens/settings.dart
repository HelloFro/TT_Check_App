import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:toggle_switch/toggle_switch.dart';

import 'package:tt_check/game/game_state.dart';

import '../constants.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text("Settings", style: TextStyle(color: Colors.white, fontSize: 30)),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text("Starting Player"),
            trailing: Consumer((context, watch) => ToggleSwitch(
              activeBgColors: [Colors.black, Colors.white],
              activeFgColor: watch(startingPlayerProvider).state == Player.black ? Colors.white : Colors.black,
              initialLabelIndex: watch(startingPlayerProvider).state == Player.black ? 0 : 1,
              minWidth: 70,
              cornerRadius: 20.0,
              labels: [
                "Black",
                "White"
              ],
              onToggle: (index) async {  
                startingPlayerProvider.read(context).state = index == 0 ? Player.black : Player.white;
                turnStateProvider.read(context).state = startingPlayerProvider.read(context).state;
                turnCounterStateProvider.read(context).state = 0;
                restartStateProvider.read(context).state = !restartStateProvider.read(context).state;
              },
            )),
          ),
        ]
      ),
    );
  }
}