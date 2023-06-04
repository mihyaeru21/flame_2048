import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_2048/colors.dart';
import 'package:flame_2048/components/tile.dart';
import 'package:flame_2048/consts.dart';
import 'package:flutter/painting.dart';

class Grid extends PositionComponent {
  @override
  bool get debugMode => false;

  static final gridPaint = Paint()..color = Colors.componentBackground;
  static final tilePaint = Paint()..color = Colors.emptyTile;

  @override
  Future<void> onLoad() async {
    final tiles = List.generate(11, (i) {
      final int xi = i % 4;
      final int yi = (i / 4).floor();
      final int number = pow(2, i + 1).toInt();

      return Tile(xi, yi, number)
        ..size = Consts.tileSize
        ..position = Vector2(
          Consts.tileGap + xi * (Consts.tileWidth + Consts.tileGap),
          Consts.tileGap + yi * (Consts.tileWidth + Consts.tileGap),
        );
    });
    addAll(tiles);
  }

  @override
  void render(Canvas canvas) {
    final gridRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.x, size.y),
      const Radius.circular(5.0),
    );

    canvas.drawRRect(gridRRect, gridPaint);
    for (int i = 0; i < 16; i++) {
      final int xi = i % 4;
      final int yi = (i / 4).floor();
      final tileRRect = RRect.fromRectAndRadius(
        Rect.fromLTWH(
          Consts.tileGap + xi * (Consts.tileWidth + Consts.tileGap),
          Consts.tileGap + yi * (Consts.tileWidth + Consts.tileGap),
          Consts.tileSize.x,
          Consts.tileSize.y,
        ),
        const Radius.circular(60.0),
      );
      canvas.drawRRect(tileRRect, tilePaint);
    }
  }
}
