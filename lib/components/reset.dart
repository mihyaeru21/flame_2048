import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame_2048/colors.dart';
import 'package:flame_2048/consts.dart';
import 'package:flutter/painting.dart';

class Reset extends PositionComponent {
  static final backgroundPaint = Paint()..color = Colors.componentBackground;

  static final normal = TextPaint(
    style: const TextStyle(
      color: Colors.controlText,
      fontSize: 100,
    ),
  );

  static final down = TextPaint(
    style: const TextStyle(
      color: Colors.emptyTile,
      fontSize: 100,
    ),
  );

  // @override
  // bool get debugMode => true;

  @override
  Future<void> onLoad() async {
    final pos = Vector2(size.x / 2, size.y / 2);
    final button = ButtonComponent(
      button: TextComponent(
        text: "reset",
        textRenderer: normal,
        size: size,
        position: pos,
        anchor: Anchor.center,
      ),
      buttonDown: TextComponent(
        text: "reset",
        textRenderer: down,
        size: size,
        position: pos,
        anchor: Anchor.center,
      ),
    )
      ..size = size
      ..position.x = size.x / 2
      ..position.y = size.y / 2
      ..anchor = Anchor.center;
    add(button);
  }

  @override
  void render(Canvas canvas) {
    final bgSize = Vector2(Consts.tileWidth, Consts.tileWidth);
    final RRect bgRRect = RRect.fromRectAndRadius(
      bgSize.toRect(),
      const Radius.circular(60.0),
    );

    canvas.drawRRect(bgRRect, backgroundPaint);
  }
}
