import 'package:flutter/material.dart';

Widget wrapTextWithTooltip(Text text, String message) {
  return Tooltip(message: message, child: text);
}
