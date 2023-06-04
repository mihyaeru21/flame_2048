import 'package:flame/components.dart';
import 'package:flame_2048/colors.dart';
import 'package:flutter/painting.dart';

class LabelText extends TextBoxComponent {
  static const style = TextStyle(
    color: Colors.tileText,
    fontSize: 250,
    fontWeight: FontWeight.w900,
  );
  static final regular = TextPaint(style: style);

  LabelText({required int number})
      : super(
          text: number.toString(),
          textRenderer: regular,
          size: Vector2(100, 100), // dummy. ここで設定しないと後からも変更できない
          align: Anchor.center,
        );

  @override
  bool get debugMode => false;
}
