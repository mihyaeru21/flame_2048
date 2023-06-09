import 'package:flame/components.dart';
import 'package:flame_2048/colors.dart';
import 'package:flame_2048/consts.dart';
import 'package:flutter/painting.dart';

class TileNumberText extends TextBoxComponent {
  static const style = TextStyle(
    color: Colors.tileText,
    fontSize: 250,
    fontWeight: FontWeight.w900,
  );
  static final regular = TextPaint(style: style);

  TileNumberText({required int number})
      : super(
          text: number.toString(),
          textRenderer: regular,
          size: Vector2(100, 100), // dummy. ここで設定しないと後からも変更できない
          align: Anchor.center,
        );

  @override
  bool get debugMode => false;
}

class Tile extends PositionComponent {
  final int ix;
  final int iy;
  final int number;

  static final tilePaint1 = Paint()..color = Colors.tileBackground1;
  static final tilePaint2 = Paint()..color = Colors.tileBackground2;
  static final tilePaint3 = Paint()..color = Colors.tileBackground3;
  static final tilePaint4 = Paint()..color = Colors.tileBackground4;

  Tile(this.ix, this.iy, this.number);

  @override
  bool get debugMode => false;

  @override
  Future<void> onLoad() async {
    final textBox = TileNumberText(number: number)
      ..size.x = size.x
      ..size.y = size.y
      ..anchor = Anchor.center
      ..x = size.x / 2
      ..y = size.y / 2;
    add(textBox);
  }

  @override
  void render(Canvas canvas) {
    final RRect tileRRect = RRect.fromRectAndRadius(
      Consts.tileSize.toRect(),
      const Radius.circular(60.0),
    );

    canvas.drawRRect(tileRRect, tilePaint());
  }

  Paint tilePaint() {
    if (number <= 4) return tilePaint1;
    if (number <= 8) return tilePaint2;
    if (number < 2048) return tilePaint3;
    return tilePaint4;
  }
}
