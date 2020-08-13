import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';


final startingPlayerProvider = StateProvider((ref) => Player.black);

final turnStateProvider = StateProvider((ref) => Player.black);

final restartStateProvider = StateProvider((ref) => false);

final turnCounterStateProvider = StateProvider((ref) => 0);
