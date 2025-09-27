import '../../consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget ourButton({
  required VoidCallback? onPress,
  Color? color,
  Color? textColor,
  String? title,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color, // updated (instead of primary)
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onPress,
    child: title != null
        ? title.text.color(textColor).fontFamily(bold).make()
        : const SizedBox.shrink(),
  );
}
