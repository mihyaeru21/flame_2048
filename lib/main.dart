import 'package:flame/game.dart';
import 'package:flame_2048/tzfe_game.dart';
import 'package:flutter/material.dart';

void main() {
  final game = TzfeGame();
  runApp(GameWidget(
    game: game,
  ));
}
