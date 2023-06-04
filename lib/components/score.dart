import 'package:flame/components.dart';
import 'package:flame_2048/colors.dart';
import 'package:flame_2048/consts.dart';
import 'package:flutter/painting.dart';

class Score extends PositionComponent {
  static final regular = TextPaint(
    style: const TextStyle(
      color: Colors.controlText,
      fontSize: 100,
    ),
  );

  static final bold = TextPaint(
    style: const TextStyle(
      color: Colors.controlText,
      fontSize: 200,
      fontWeight: FontWeight.w600,
    ),
  );

  static final backgroundPaint = Paint()..color = Colors.componentBackground;

  // @override
  // bool get debugMode => true;

  @override
  Future<void> onLoad() async {
    final label = TextComponent(
      text: "SCORE",
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
    final bgSize = Vector2(Consts.tileWidth * 3, Consts.tileWidth);
    final RRect bgRRect = RRect.fromRectAndRadius(
      bgSize.toRect(),
      const Radius.circular(60.0),
    );

    canvas.drawRRect(bgRRect, backgroundPaint);
  }
}
