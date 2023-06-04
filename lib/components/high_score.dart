import 'package:flame/components.dart';
import 'package:flame_2048/colors.dart';
import 'package:flame_2048/consts.dart';
import 'package:flutter/painting.dart';

class HighScore extends PositionComponent {
  static final regular = TextPaint(
    style: const TextStyle(
      color: Colors.controlText,
      fontSize: 80,
    ),
  );

  static final bold = TextPaint(
    style: const TextStyle(
      color: Colors.controlText,
      fontSize: 120,
      fontWeight: FontWeight.w600,
    ),
  );

  static final backgroundPaint = Paint()..color = Colors.componentBackground;

  // @override
  // bool get debugMode => true;

  @override
  Future<void> onLoad() async {
    final label = TextComponent(
      text: "HIGH SCORE",
      textRenderer: regular,
    )
      ..anchor = Anchor.topCenter
      ..position.x = size.x / 2;
    add(label);

    final value = TextComponent(
      text: "1145141919",
      textRenderer: bold,
    )
      ..anchor = Anchor.bottomCenter
      ..position.x = size.x / 2
      ..position.y = size.y;
    add(value);
  }

  @override
  void render(Canvas canvas) {
    final bgSize = Vector2(Consts.tileWidth * 2, Consts.tileWidth);
    final RRect bgRRect = RRect.fromRectAndRadius(
      bgSize.toRect(),
      const Radius.circular(60.0),
    );

    canvas.drawRRect(bgRRect, backgroundPaint);
  }
}
