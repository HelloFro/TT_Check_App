import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:tt_check/models/game.dart';

import '../constants.dart';

final gameProvider = Provider((ref) => Game());

final startingPlayerProvider = StateProvider((ref) => Player.black);

final turnStateProvider = StateProvider((ref) => Player.black);

final restartStateProvider = StateProvider((ref) => false);

final turnCounterStateProvider = StateProvider((ref) => 0);

final sharedPreferenceInstanceProvider = Provider((ref) async => await SharedPreferences.getInstance());

Future<void> setStartingPlayer(Player player) async => 
  await SharedPreferences.getInstance().then((pref) => pref.setInt('player', player == Player.black ? 0 : 1));

Future<Player> getStartingPlayerFromSP() async => 
  await SharedPreferences.getInstance().then((pref) => pref.containsKey('player') ? (pref.getInt('player') == 0 ? Player.black : Player.white) : Player.black);
