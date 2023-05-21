import 'package:flame/components.dart';
import 'package:flame_2048/tzfe_game.dart';
import 'package:flutter/painting.dart';

class Grid extends PositionComponent {
  @override
  bool get debugMode => false;

  static final gridPaint = Paint()..color = const Color(0xFFa2917d);
  static final tilePaint = Paint()..color = const Color(0xFFbfafa0);

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
          TzfeGame.tileGap + xi * (TzfeGame.tileWidth + TzfeGame.tileGap),
          TzfeGame.tileGap + yi * (TzfeGame.tileWidth + TzfeGame.tileGap),
          TzfeGame.tileSize.x,
          TzfeGame.tileSize.y,
        ),
        const Radius.circular(60.0),
      );
      canvas.drawRRect(tileRRect, tilePaint);
    }
  }
}
