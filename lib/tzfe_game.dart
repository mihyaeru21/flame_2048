import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame_2048/components/grid.dart';
import 'package:flame_2048/components/tile.dart';

class TzfeGame extends FlameGame {
  static const double tileWidth = 400.0;
  static const double tileGap = 40.0;
  static final Vector2 tileSize = Vector2(tileWidth, tileWidth);

  @override
  Future<void> onLoad() async {
    const gridSize = tileGap * 5 + tileWidth * 4;
    final grid = Grid()
      ..size = Vector2(gridSize, gridSize)
      ..position = Vector2(tileGap, tileGap);

    final tiles = List.generate(11, (i) {
      final int xi = i % 4;
      final int yi = (i / 4).floor();
      final int number = pow(2, i + 1).toInt();

      return Tile(xi, yi, number)
        ..size = tileSize
        ..position = Vector2(
          tileGap + xi * (tileWidth + tileGap),
          tileGap + yi * (tileWidth + tileGap),
        );
    });
    grid.addAll(tiles);

    final world = World()..add(grid);
    add(world);

    const cameraSize = tileGap * 7 + tileWidth * 4;
    final camera = CameraComponent(world: world)
      ..viewfinder.visibleGameSize = Vector2(cameraSize, cameraSize)
      ..viewfinder.position = Vector2(cameraSize / 2.0, 0)
      ..viewfinder.anchor = Anchor.topCenter;
    add(camera);
  }
}
