import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_2048/colors.dart';
import 'package:flame_2048/components/grid.dart';
import 'package:flame_2048/components/high_score.dart';
import 'package:flame_2048/components/reset.dart';
import 'package:flame_2048/components/score.dart';
import 'package:flame_2048/consts.dart';
import 'package:flame_2048/game_state.dart';
import 'package:flutter/painting.dart';

class TzfeGame extends FlameGame {
  late final GameState gameState;

  TzfeGame() {
    gameState = GameState(Consts.rows, Consts.cols);
  }

  @override
  Future<void> onLoad() async {
    const r = Consts.rows;
    const c = Consts.cols;
    const tw = Consts.tileWidth;
    const tg = Consts.tileGap;

    const cameraWidth = tw * c + tg * (c + 3);
    const cameraHeight = tw * (r + 2) + tg * (r + 5);

    const gridWidth = tw * c + tg * (c + 1);
    final grid = Grid()
      ..size = Vector2(gridWidth, gridWidth)
      ..position = Vector2(tg, tw + tg * 2);

    final scoreSize = Vector2(tw * 3, tw);
    final score = Score()
      ..size = scoreSize
      ..position = Vector2(cameraWidth / 2, tg)
      ..anchor = Anchor.topCenter;

    const yOffset = gridWidth + tw + tg * 3;
    final reset = Reset()
      ..size = Vector2(tw, tw)
      ..position = Vector2(tw / 2 + tg * 2, yOffset)
      ..anchor = Anchor.topLeft;

    final highScore = HighScore()
      ..size = Vector2(tw * 2, tw)
      ..position = Vector2(cameraWidth - tg * 2 - tw / 2, yOffset)
      ..anchor = Anchor.topRight;

    final world = World()
      ..add(grid)
      ..add(score)
      ..add(reset)
      ..add(highScore);
    add(world);

    final camera = CameraComponent(world: world)
      ..viewfinder.visibleGameSize = Vector2(cameraWidth, cameraHeight)
      ..viewfinder.position = Vector2(cameraWidth / 2.0, 0)
      ..viewfinder.anchor = Anchor.topCenter;
    add(camera);
  }

  @override
  Color backgroundColor() => Colors.background;
}
